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

// function changeLanguage(language) {
//
//     const url = new URL(window.location.href);
//
//     url.searchParams.set("lang", language);
//
//     window.location.href = url.toString();
// }

//     function changeLanguage(element) {
//     const lang = element.checked ? 'en' : 'ru';
//
//     const url = new URL(window.location.href);
//     url.searchParams.set('lang', lang);
//
//     window.location.href = url.toString();
// }

//
    function changeLanguage(element) {

    const lang = element.checked ? 'en' : 'ru';

    const url = new URL(window.location.href);

    url.searchParams.set('lang', lang);

    window.location.href = url.toString();
}
//
//
//     function changeLanguageMobile(lang) {
//
//     const url = new URL(window.location.href);
//
//     url.searchParams.set('lang', lang);
//
//     window.location.href = url.toString();
// }
//
//
//     function toggleLanguages() {
//
//     const menu = document.getElementById('language-menu');
//     const button = document.querySelector('.language-mobile-button');
//
//     menu.classList.toggle('active');
//     button.classList.toggle('active');
// }
//
//
//     document.addEventListener('click', function(event) {
//
//     const switcher =
//     document.querySelector('.language-switcher');
//
//     const menu =
//     document.getElementById('language-menu');
//
//     const button =
//     document.querySelector('.language-mobile-button');
//
//     if (!switcher.contains(event.target)) {
//
//     menu.classList.remove('active');
//     button.classList.remove('active');
//
// }
//
// });

function changeLanguageMobile(lang) {
    const url = new URL(window.location.href);

    url.searchParams.set('lang', lang);

    window.location.href = url.toString();
}

