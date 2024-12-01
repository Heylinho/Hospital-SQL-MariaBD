document.addEventListener('DOMContentLoaded', () => {
    const hamburguer = document.querySelector('.hamburguer');
    const navbar = document.querySelector('.navbar');
    const Inicio = document.querySelector('.Inicio');
    const Hospital = document.querySelector('.Hospital');
    const Alunos = document.querySelector('.Alunos');
    const Sair = document.querySelector('.Sair')

    hamburguer.addEventListener('click', () => {
        hamburguer.classList.toggle('active');
        navbar.classList.toggle('active');
    });

    Hospital.addEventListener('click', () => {
        hamburguer.classList.toggle('active');
        navbar.classList.toggle('active');
    });

    Alunos.addEventListener('click', () => {
        hamburguer.classList.toggle('active');
        navbar.classList.toggle('active');
    });

    Inicio.addEventListener('click', () => {
        hamburguer.classList.toggle('active');
        navbar.classList.toggle('active');
    });

    Sair.addEventListener('click', () => {
        hamburguer.classList.toggle('active');
        navbar.classList.toggle('active');
    });
});

