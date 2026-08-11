document.addEventListener('DOMContentLoaded', function () {
    const burger = document.getElementById('burger');
    const menu = document.getElementById('menu');
    const nav = document.getElementById('nav');


    burger.addEventListener('click', function () {
        menu.style.display='block';
        burger.classList.toggle('checked')
    //     nav.addEventListener('click', function () {
    //         // Сбрасываем overflow
    //         nav.style.overflow = 'unset';
    //     });
    });

    // Закрывать меню при клике на ссылку (для удобства)
    // menu.querySelectorAll('a').forEach(link => {
    //     link.addEventListener('click', () => {
    //         menu.classList.remove('open');
    //     });
    // });
});
