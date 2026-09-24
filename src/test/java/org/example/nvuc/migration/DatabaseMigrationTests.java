package org.example.nvuc.migration;

import org.flywaydb.core.Flyway;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.EnabledIfEnvironmentVariable;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;

/** Use a disposable PostgreSQL database; each test owns a randomly named schema. */
@EnabledIfEnvironmentVariable(named = "NVUC_MIGRATION_TEST_URL", matches = ".+")
class DatabaseMigrationTests {
    private Connection connection;
    private String schema;

    @BeforeEach
    void createSchema() throws SQLException {
        connection = DriverManager.getConnection(System.getenv("NVUC_MIGRATION_TEST_URL"),
                System.getenv("NVUC_MIGRATION_TEST_USER"), System.getenv("NVUC_MIGRATION_TEST_PASSWORD"));
        schema = "nvuc_migration_test_" + UUID.randomUUID().toString().replace("-", "");
        execute("CREATE SCHEMA " + schema);
        connection.setSchema(schema);
    }

    @AfterEach
    void removeOwnSchema() throws SQLException {
        if (connection != null) {
            try {
                if (schema != null) execute("DROP SCHEMA IF EXISTS " + schema + " CASCADE");
            } finally {
                connection.close();
            }
        }
    }

    private Flyway flyway(String target) {
        return Flyway.configure()
                .dataSource(System.getenv("NVUC_MIGRATION_TEST_URL"),
                        System.getenv("NVUC_MIGRATION_TEST_USER"), System.getenv("NVUC_MIGRATION_TEST_PASSWORD"))
                .schemas(schema).defaultSchema(schema).target(target).load();
    }

    @Test
    void emptyDatabaseGetsRealSnapshotAndSequenceBeyondImportedIds() throws SQLException {
        var flyway = flyway("latest");
        assertEquals(3, flyway.migrate().migrationsExecuted);
        assertEquals(42, number("SELECT count(*) FROM journals"));
        assertEquals(44, number("SELECT max(id) FROM journals"));
        assertEquals(6538, number("SELECT max(length(description_en)) FROM journals"));
        assertEquals(1, number("SELECT count(*) FROM admin_users WHERE username = 'admin'"));
        assertEquals(45, number("INSERT INTO journals (year, issue) VALUES (2027, 'test') RETURNING id"));
        assertEquals(0, flyway.migrate().migrationsExecuted);
        assertEquals(43, number("SELECT count(*) FROM journals"));
    }

    @Test
    void upgradePreservesExistingJournalsAndCustomizedAdministrator() throws SQLException {
        flyway("2").migrate();
        execute("CREATE TABLE journals (id BIGSERIAL PRIMARY KEY, year INTEGER, issue VARCHAR(255), "
                + "title VARCHAR(255), title_en VARCHAR(255), contents TEXT, contents_en TEXT, "
                + "description TEXT, description_en TEXT, cover VARCHAR(255), pdf VARCHAR(255))");
        execute("INSERT INTO journals (year, issue, description) VALUES (2030, 'existing', repeat('x', 7000))");
        execute("UPDATE admin_users SET password = 'already-customized-password' WHERE username = 'admin'");
        assertEquals(2, flyway("latest").migrate().migrationsExecuted);
        assertEquals(1, number("SELECT count(*) FROM journals"));
        assertEquals(7000, number("SELECT length(description) FROM journals WHERE issue = 'existing'"));
        assertEquals(1, number("SELECT count(*) FROM admin_users WHERE password = 'already-customized-password'"));
        assertEquals(2, number("INSERT INTO journals (year, issue) VALUES (2031, 'next') RETURNING id"));
    }

    private void execute(String sql) throws SQLException {
        try (var statement = connection.createStatement()) { statement.execute(sql); }
    }

    private long number(String sql) throws SQLException {
        try (var statement = connection.createStatement(); var result = statement.executeQuery(sql)) {
            assertTrue(result.next());
            return result.getLong(1);
        }
    }
}
