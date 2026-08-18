document.addEventListener("DOMContentLoaded", function () {

    const burger = document.getElementById("burger");
    const nav = document.getElementById("nav");


    /* =====================================================
       BURGER MENU
    ===================================================== */

    burger.addEventListener("click", function (event) {

        event.stopPropagation();

        burger.classList.toggle("active");
        nav.classList.toggle("active");

    });


    /* =====================================================
       SUBMENUS
    ===================================================== */

    const submenuToggles =
        document.querySelectorAll(".submenu-toggle");


    submenuToggles.forEach(function (toggle) {

        toggle.addEventListener("click", function (event) {

            if (window.innerWidth > 768) {
                return;
            }

            event.preventDefault();

            const parent = toggle.parentElement;

            const siblings = parent.parentElement.children;


            Array.from(siblings).forEach(function (sibling) {

                if (sibling !== parent) {
                    sibling.classList.remove("open");
                }

            });

            parent.classList.toggle("open");

        });

    });


    /* =====================================================
       CLICK OUTSIDE MENU
    ===================================================== */

    document.addEventListener("click", function (event) {

        if (!nav.classList.contains("active")) {
            return;
        }

        if (
            !nav.contains(event.target) &&
            !burger.contains(event.target)
        ) {

            nav.classList.remove("active");
            burger.classList.remove("active");

            document
                .querySelectorAll(".has-submenu.open")
                .forEach(function (item) {

                    item.classList.remove("open");

                });

        }

    });


    /* =====================================================
       RESIZE
    ===================================================== */

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


/* =========================================================
   LANGUAGE - DESKTOP
========================================================= */

function changeLanguage(element) {

    const lang = element.checked ? "en" : "ru";

    const url = new URL(window.location.href);

    url.searchParams.set("lang", lang);

    window.location.href = url.toString();

}


/* =========================================================
   LANGUAGE - MOBILE
========================================================= */

function changeLanguageMobile(lang) {

    const url = new URL(window.location.href);

    url.searchParams.set("lang", lang);

    window.location.href = url.toString();

}
