document.addEventListener("DOMContentLoaded", function () {
    const burger = document.getElementById("burger");
    const nav = document.getElementById("nav");
    if (!burger || !nav) return;

    function setSubmenu(item, open) {
        item.classList.toggle("open", open);
        const toggle = item.querySelector(":scope > .submenu-toggle");
        if (toggle) toggle.setAttribute("aria-expanded", String(open));
        if (!open) {
            item.querySelectorAll(".has-submenu.open").forEach(child => setSubmenu(child, false));
        }
    }

    function closeMenu() {
        nav.classList.remove("active");
        burger.classList.remove("active");
        burger.setAttribute("aria-expanded", "false");
        nav.querySelectorAll(".has-submenu").forEach(item => setSubmenu(item, false));
    }

    burger.addEventListener("click", function () {
        const open = !nav.classList.contains("active");
        closeMenu();
        nav.classList.toggle("active", open);
        burger.classList.toggle("active", open);
        burger.setAttribute("aria-expanded", String(open));
    });

    nav.querySelectorAll(".submenu-toggle").forEach(function (toggle, index) {
        const parent = toggle.parentElement;
        const submenu = parent.querySelector(":scope > .submenu");
        if (!submenu) return;
        submenu.id = "submenu-" + index;
        toggle.setAttribute("aria-controls", submenu.id);
        toggle.setAttribute("aria-expanded", "false");
        parent.addEventListener("pointerenter", function (event) {
            if (event.pointerType === "mouse" && window.innerWidth > 768) setSubmenu(parent, true);
        });
        parent.addEventListener("pointerleave", function (event) {
            if (event.pointerType === "mouse" && window.innerWidth > 768 && !parent.contains(document.activeElement)) {
                setSubmenu(parent, false);
            }
        });
        parent.addEventListener("focusout", function (event) {
            if (!parent.contains(event.relatedTarget)) setSubmenu(parent, false);
        });
        toggle.addEventListener("click", function () {
            const open = !parent.classList.contains("open");
            Array.from(parent.parentElement.children).forEach(sibling => {
                if (sibling !== parent) setSubmenu(sibling, false);
            });
            setSubmenu(parent, open);
        });
    });

    document.addEventListener("click", function (event) {
        if (!nav.contains(event.target) && !burger.contains(event.target)) closeMenu();
    });

    nav.addEventListener("keydown", function (event) {
        if (event.key !== "Escape") return;
        const item = event.target.closest(".has-submenu.open");
        if (item) {
            setSubmenu(item, false);
            item.querySelector(":scope > .submenu-toggle").focus();
        } else {
            closeMenu();
            burger.focus();
        }
        event.preventDefault();
    });

    window.matchMedia("(min-width: 769px)").addEventListener("change", closeMenu);
});

function changeLanguage(element) {
    changeLanguageMobile(element.checked ? "en" : "ru");
}

function changeLanguageMobile(lang) {
    const url = new URL(window.location.href);
    url.searchParams.set("lang", lang);
    window.location.href = url.toString();
}
