<%--
  Created by IntelliJ IDEA.
  User: bruno
  Date: 28/05/2024
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Solicitud</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../../../assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../../../assets/css/style.css">
    <link rel="stylesheet" href="styles_vecino.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="LogoSM.png" />
    <!--JS para los popups-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .card-animation {
            animation: fadeIn 0.5s ease-in-out;
        }

        .cards-container {
            position: relative;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .card {
            display: none;
            flex-direction: column;
            align-items: center;
            width: 60%;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            background-color: white;
            text-align: center;
        }

        .card.active {
            display: flex;
        }

        .nav-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 50%;
        }

        .prev {
            left: 70px;
        }

        .next {
            right: 70px;
        }

        .hidden {
            display: none;
        }
    </style>
</head>
<body>
<div class="container-scroller">
    <!-- partial:../../partials/_sidebar.html -->
    <nav class="sidebar sidebar-offcanvas" id="sidebar" style ="background-color: #000f22;">
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top" style ="background-color: #000f22;">
            <h3 class="sidebar-brand brand-logo" style ="color:white; font-weight: 200px; cursor: default;">Menú</h3>
            <h3 class="sidebar-brand brand-logo-mini" style ="color:white; font-weight: 200px; cursor: default;">M</h3>
        </div>
        <ul class="nav">
            <li class="nav-item menu-items">
                <a class="nav-link" href="../pagina_principal_vecino.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-home"></i>
              </span>
                    <span class="menu-title" style="color: white;">Página principal</span>
                </a>
            </li>
            <li class="nav-item menu-items">
                <a class="nav-link" href="../Miperfil.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-account"></i>
              </span>
                    <span class="menu-title" style="color: white;">Mi perfil</span>
                </a>
            </li>
            <li class="nav-item menu-items">
                <a class="nav-link" href="https://mail.google.com/mail/u/0/#inbox">
              <span class="menu-icon">
                <i class="mdi mdi-email"></i>
              </span>
                    <span class="menu-title" style="color: white;">Correo</span>
                </a>
            </li>
            <li class="nav-item menu-items active">
                <a class="nav-link" href="#">
              <span class="menu-icon">
                <i class="mdi mdi-key-change"></i>
              </span>
                    <span class="menu-title" style="color: white;">Sol. coordinador(a)</span>
                </a>
            </li>
            <li class="nav-item menu-items">
                <a class="nav-link" href="../eventos/eventos.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-earth"></i>
              </span>
                    <span class="menu-title" style="color: white;">Eventos</span>
                </a>
            </li>
            <li class="nav-item menu-items">
                <a class="nav-link" href="../incidencias/incidencia_vecino.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-alert"></i>
              </span>
                    <span class="menu-title" style="color: white;">Incidencias</span>
                </a>
            </li>
            <li class="nav-item menu-items" onclick="return mostrarPopupCerrarSesion();">
                <a class="nav-link" href="#">
              <span class="menu-icon">
                <i class="mdi mdi-logout"></i>
              </span>
                    <span class="menu-title" style="color: white;">Cerrar sesión</span>
                </a>
            </li>
        </ul>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_navbar.jsp -->
        <nav class="navbar p-0 fixed-top d-flex flex-row">
            <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch" style ="background-color: #000f22">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                    <span class="mdi mdi-menu" style="color: white;"></span>
                </button>
                <ul class="navbar-nav navbar-nav-right">
                    <li class="nav-item dropdown">
                        <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
                            <div class="navbar-profile">
                                <div class="Header-nav-item">
                                    <h2 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 23px; font-weight:500; cursor: default;">Manuel Yarleque</h2>
                                    <h5 class="mb-0 d-none d-sm-block navbar-profile-name" style ="margin-right: 10px; font-size: 15px; font-weight:500; cursor: default;">Vecino sanmiguelino</h5>
                                </div>
                                <img class="img-xs rounded-circle" src="LogoSM.png" alt="" style ="height: 50px; width: 100%;">
                            </div>
                        </a>
                    </li>
                </ul>
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                    <span class="mdi mdi-format-line-spacing"></span>
                </button>
            </div>
        </nav>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper" style="background-color: #d6e9ff;">
                <!--CONTENIDO-->
                <h1 style="font-weight: bold; color: black;">Solicitud a coordinador(a):</h1>
                <div class="container_sol" style="margin-top: -30px;">
                    <div class="card_sol">
                        <div class="coord-card">
                            <p style="font-size: 20px;">¡Únete a nuestro equipo de coordinadores y marca la diferencia! ¿En qué área te gustaría brillar como coordinador? Cuenta con 2 opciones: deportes y cultura.</p>
                            <div class="img-select">
                                <div class="select">
                                    <label>
                                        <input type="radio" name="opcion" value="deportes" onchange="showCards(this.value); checkOptionSelected();"> Deportes
                                    </label>
                                    <label>
                                        <input type="radio" name="opcion" value="cultura" onchange="showCards(this.value); checkOptionSelected();"> Cultura
                                    </label>
                                    <button class="beautiful-button" onclick="mostrarAlerta()">Enviar solicitud</button>
                                </div>
                                <div id="cards-container" class="cards-container">
                                    <button id="prev" class="nav-button prev hidden" onclick="changeSlide(-1)">&#10094;</button>
                                    <div class="card card-animation" id="card1">
                                        <img src="deportes1.png" alt="Deportes">
                                        <h2>Organiza Eventos Deportivos</h2>
                                        <p>En esta área de deportes, tendrás la oportunidad de organizar diversos eventos deportivos que fomenten la participación y el espíritu de equipo.</p>
                                    </div>
                                    <div class="card card-animation" id="card2">
                                        <img src="deportes2.jpg" alt="Profesores de Deportes">
                                        <h2>Elige a tus Profesores</h2>
                                        <p>Contarás con la opción de seleccionar profesores que puedan impartir diferentes deportes o actividades al aire libre, con toda la voluntad de atender a las necesidades y preferencias de los participantes.</p>
                                    </div>
                                    <div class="card card-animation" id="card3">
                                        <img src="imagen_deportes.jpg" alt="Ejemplos de Deportes">
                                        <h2>Inspírate en Ejemplos</h2>
                                        <p>Algunos ejemplos de actividades que puedes organizar incluyen torneos de fútbol, clases de yoga en el parque, y competiciones de atletismo, entre otros.</p>
                                    </div>
                                    <button id="next" class="nav-button next hidden" onclick="changeSlide(1)">&#10095;</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<script src="../../../../assets/vendors/js/vendor.bundle.base.js"></script>
<script src="../../../../assets/js/off-canvas.js"></script>
<script src="../../../../assets/js/hoverable-collapse.js"></script>
<script src="../../../../assets/js/misc.js"></script>
<script src="../../../../assets/js/settings.js"></script>
<script src="../../../../assets/js/todolist.js"></script>
<script>
    function mostrarPopupCerrarSesion() {
        Swal.fire({
            title: 'Cerrar sesión',
            text: '¿Estás seguro de que deseas cerrar sesión?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#00913f',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, cerrar sesión',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "../../LOGIN/login.jsp";
            }
        });
    }
</script>
<script>
    function mostrarAlerta() {
        Swal.fire({
            title: '¿Estás seguro de que quieres enviar la solicitud?',
            text: 'Este proceso será irreversible',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#00913f',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, enviar solicitud',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '¡Solicitud enviada!',
                    'La solicitud ha sido enviada correctamente.',
                    'success'
                );
            } else {
                Swal.fire(
                    'Solicitud cancelada',
                    '',
                    'info'
                );
            }
        });
    }
</script>
<script>
    const cards = {
        deportes: [
            {
                img: 'deportes1.png',
                title: 'Organiza Eventos Deportivos',
                desc: 'En esta área de deportes, tendrás la oportunidad de organizar diversos eventos deportivos que fomenten la participación y el espíritu de equipo.'
            },
            {
                img: 'deportes2.jpg',
                title: 'Elige a tus Profesores',
                desc: 'Contarás con la opción de seleccionar profesores que puedan impartir diferentes deportes o actividades al aire libre, con toda la voluntad de atender a las necesidades y preferencias de los participantes.'
            },
            {
                img: 'imagen_deportes.jpg',
                title: 'Inspírate en Ejemplos',
                desc: 'Algunos ejemplos de actividades que puedes organizar incluyen torneos de fútbol, clases de yoga en el parque, y competiciones de atletismo, entre otros.'
            }
        ],
        cultura: [
            {
                img: 'imagen_cultura.jpg',
                title: 'Organiza Eventos Culturales',
                desc: 'En esta área de cultura, tendrás la oportunidad de organizar eventos culturales que promuevan la creatividad y la apreciación artística.'
            },
            {
                img: 'cultura2.jpg',
                title: 'Elige a tus Profesores',
                desc: 'Contarás con la opción de seleccionar profesores que puedan impartir diferentes disciplinas artísticas, con toda la voluntad de atender a las necesidades y preferencias de los participantes.'
            },
            {
                img: 'cultura3.jpg',
                title: 'Inspírate en Ejemplos',
                desc: 'Algunos ejemplos de actividades que puedes organizar incluyen exposiciones de arte, talleres de teatro, y clases de música, entre otros.'
            }
        ]
    };

    let currentSlide = 0;

    function showCards(opcion) {
        const cardElements = document.querySelectorAll('.card');
        cardElements.forEach(card => {card.classList.remove('active');
            card.classList.add('card-animation');});

        currentSlide = 0;

        const selectedCards = cards[opcion];
        cardElements.forEach((card, index) => {
            card.querySelector('img').src = selectedCards[index].img;
            card.querySelector('h2').textContent = selectedCards[index].title;
            card.querySelector('p').textContent = selectedCards[index].desc;
            card.classList.toggle('active', index === currentSlide);
        });

        updateNavigation();
    }

    function changeSlide(direction) {
        const cardElements = document.querySelectorAll('.card');
        cardElements[currentSlide].classList.remove('active');

        currentSlide += direction;
        currentSlide = Math.max(0, Math.min(currentSlide, cardElements.length - 1));

        cardElements[currentSlide].classList.add('active');
        updateNavigation();
    }

    function updateNavigation() {
        document.getElementById('prev').classList.toggle('hidden', currentSlide === 0);
        document.getElementById('next').classList.toggle('hidden', currentSlide === document.querySelectorAll('.card').length - 1);
    }
</script>
</body>
</html>
