package org.example.nvuc.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;

import java.time.Duration;

@Configuration
public class CacheConfig {

    public static final CacheControl PDF_CACHE =
            CacheControl
                    .maxAge(Duration.ofDays(365))
                    .cachePublic();

    public static final CacheControl COVER_CACHE =
            CacheControl
                    .maxAge(Duration.ofDays(30))
                    .cachePublic();
}
