document.addEventListener("DOMContentLoaded", function () {

    const burger = document.getElementById("burger");
    const nav = document.getElementById("nav");

    // Открытие / закрытие мобильного меню
    burger.addEventListener("click", function () {
        burger.classList.toggle("active");
        nav.classList.toggle("active");
    });


    // Все пункты, у которых есть подменю
    const submenuToggles = document.querySelectorAll(".submenu-toggle");

    submenuToggles.forEach(function (toggle) {

        toggle.addEventListener("click", function (event) {

            // На мобильных не переходим по "#"
            if (window.innerWidth <= 768) {
                event.preventDefault();

                const parent = toggle.parentElement;

                // Если нужно закрывать соседние подменю
                const siblings = parent.parentElement.children;

                Array.from(siblings).forEach(function (sibling) {
                    if (sibling !== parent) {
                        sibling.classList.remove("open");
                    }
                });

                parent.classList.toggle("open");
            }
        });

    });


    // Клик вне меню — закрываем меню
    document.addEventListener("click", function (event) {

        if (
            nav.classList.contains("active") &&
            !nav.contains(event.target) &&
            !burger.contains(event.target)
        ) {
            nav.classList.remove("active");
            burger.classList.remove("active");

            // Закрываем все подменю
            document
                .querySelectorAll(".has-submenu.open")
                .forEach(function (item) {
                    item.classList.remove("open");
                });
        }

    });


    // При переходе обратно на desktop
    window.addEventListener("resize", function () {

        if (window.innerWidth > 768) {
            nav.classList.remove("active");
            burger.classList.remove("active");

            document
                .querySelectorAll(".has-submenu.open")
                .forEach(function (item) {
                    item.classList.remove("open");
                });
        }

    });

});
