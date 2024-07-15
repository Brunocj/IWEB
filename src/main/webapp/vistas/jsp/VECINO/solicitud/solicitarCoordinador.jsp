<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLogueado" scope="session" type="org.example.webappsm.model.beans.Usuario"/>

<%
    int id = usuarioLogueado.getId();

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Solicitud</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vistas/jsp/VECINO/solicitud/styles_vecino.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/vistas/jsp/LogoSM.png" />
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
    <%
        //String userRole = (String) session.getAttribute("userRole"); ->Usar cuando empecemos con las sessions

        String userRole = "Vecino"; //Cambiar de acuerdo al rol (hasta que obtengamos el userRole mediante querys
        String menu = "/vistas/jsp/Utilidades/menu_" + userRole + ".jsp";
    %>

    <%-- Incluir el menú y pasar el parámetro de la página activa --%>
    <jsp:include page="<%= menu %>">
        <jsp:param name="activePage" value="eventos"/>
    </jsp:include>
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
                                <!-- Cambios en el formulario -->
                                <form method="POST" action="<%=request.getContextPath()%>/Vecino?action=enviarSolicitud" id="solicitudForm">
                                    <div class="select">
                                        <!-- Modificado para asegurar que los radio buttons envíen los valores correctamente -->
                                        <label>
                                            <input type="radio" name="idArea" id="deportes" value="2" onchange="showCards(this.value); checkOptionSelected();" required> Deportes
                                        </label>
                                        <label>
                                            <input type="radio" name="idArea" id="cultura" value="1" onchange="showCards(this.value); checkOptionSelected();" required> Cultura
                                        </label>
                                        <!-- Agregar un campo oculto para el idUsuario -->
                                        <input type="hidden" name="idUsuario" value="<%=id%>">
                                        <!-- Botón que llama a la función de SweetAlert -->
                                        <a type="button" class="buttonasd" onclick="confirmSubmit()">Enviar solicitud</a>
                                    </div>
                                </form>
                                <!-- Fin de los cambios en el formulario -->
                                <div id="cards-container" class="cards-container">
                                    <button id="prev" class="nav-button prev hidden" onclick="changeSlide(-1)">&#10094;</button>
                                    <div class="card card-animation" id="card1">
                                        <img style="height: 40vh">
                                        <h2 style="height: 5vh"></h2>
                                        <p style="height: 6vh"></p>
                                    </div>
                                    <div class="card card-animation" id="card2">
                                        <img style="height: 40vh">
                                        <h2 style="height: 5vh"></h2>
                                        <p style="height: 6vh"></p>
                                    </div>
                                    <div class="card card-animation" id="card3">
                                        <img style="height: 40vh">
                                        <h2 style="height: 5vh"></h2>
                                        <p style="height: 6vh"></p>
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
<script src="${pageContext.request.contextPath}/assets/vendors/js/vendor.bundle.base.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/off-canvas.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/hoverable-collapse.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/misc.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/settings.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/todolist.js"></script>

<script>
    // Modificado para enviar el formulario después de confirmar la alerta
    function confirmSubmit() {
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
                document.getElementById('solicitudForm').submit(); // Enviar el formulario después de confirmar
            }
        });
    }
</script>
<script>
    const cards = {
        2: [
            {
                img: '${pageContext.request.contextPath}/vistas/jsp/VECINO/solicitud/deportes1.png',
                title: 'Organiza Eventos Deportivos',
                desc: 'En esta área de deportes, tendrás la oportunidad de organizar diversos eventos deportivos que fomenten la participación y el espíritu de equipo.'
            },
            {
                img: '${pageContext.request.contextPath}/vistas/jsp/VECINO/solicitud/deportes2.jpg',
                title: 'Elige a tus Profesores',
                desc: 'Contarás con la opción de seleccionar profesores que puedan impartir diferentes deportes o actividades al aire libre, con toda la voluntad de atender a las necesidades y preferencias de los participantes.'
            },
            {
                img: '${pageContext.request.contextPath}/vistas/jsp/VECINO/solicitud/imagen_deportes.jpg',
                title: 'Inspírate en Ejemplos',
                desc: 'Algunos ejemplos de actividades que puedes organizar incluyen torneos de fútbol, clases de yoga en el parque, y competiciones de atletismo, entre otros.'
            }
        ],
        1: [
            {
                img: '${pageContext.request.contextPath}/vistas/jsp/VECINO/solicitud/imagen_cultura.jpg',
                title: 'Organiza Eventos Culturales',
                desc: 'En esta área de cultura, tendrás la oportunidad de organizar eventos culturales que promuevan la creatividad y la apreciación artística.'
            },
            {
                img: '${pageContext.request.contextPath}/vistas/jsp/VECINO/solicitud/cultura2.jpg',
                title: 'Elige a tus Profesores',
                desc: 'Contarás con la opción de seleccionar profesores que puedan impartir diferentes disciplinas artísticas, con toda la voluntad de atender a las necesidades y preferencias de los participantes.'
            },
            {
                img: '${pageContext.request.contextPath}/vistas/jsp/VECINO/solicitud/cultura3.jpg',
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
