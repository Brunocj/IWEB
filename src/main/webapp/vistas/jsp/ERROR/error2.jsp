<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Whoops! Page Not Found</title>
    <style>
        /* Variables */
        :root {
            --bgColor: #f7f7f7;
            --jaggedDistance: 32px;
            --booSize: calc(var(--jaggedDistance) * 5);
            --booBg: var(--bgColor);
            --booShadow: #e0e0e0; /* Adjusted for darken effect */
            --booFaceSize: calc(var(--jaggedDistance) / 1.3333);
            --booFaceColor: #9b9b9b;
        }

        @keyframes floating {
            0% {
                transform: translate3d(0, 0, 0);
            }
            45% {
                transform: translate3d(0, -10%, 0);
            }
            55% {
                transform: translate3d(0, -10%, 0);
            }
            100% {
                transform: translate3d(0, 0, 0);
            }
        }

        @keyframes floatingShadow {
            0% {
                transform: scale(1);
            }
            45% {
                transform: scale(.85);
            }
            55% {
                transform: scale(.85);
            }
            100% {
                transform: scale(1);
            }
        }

        .border-bottom-jagged {
            position: relative;
            padding-bottom: var(--jaggedDistance);
        }

        .border-bottom-jagged::after {
            content: '';
            display: block;
            position: absolute;
            left: calc(-1 * var(--jaggedDistance) / 1.7);
            bottom: calc(-1 * var(--jaggedDistance) / 3.85);
            width: calc(100% + var(--jaggedDistance));
            height: var(--jaggedDistance);
            background-repeat: repeat-x;
            background-size: var(--jaggedDistance) var(--jaggedDistance);
            background-position: left bottom;
            background-image:
                    linear-gradient(-45deg, var(--bgColor) calc(var(--jaggedDistance) / 2), transparent 0),
                    linear-gradient(45deg, var(--bgColor) calc(var(--jaggedDistance) / 2), transparent 0),
                    linear-gradient(-45deg, var(--booFaceColor) calc(var(--jaggedDistance) / 1.7), transparent 0),
                    linear-gradient(45deg, var(--booFaceColor) calc(var(--jaggedDistance) / 1.7), transparent 0);
        }

        body {
            background-color: rgba(53, 75, 125, 255);
            font-family: "Poppins", sans-serif;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }

        .background {
            position: fixed;
            top: 0;
            left: 0;
            width: 50%;
            height: 100%;
            background-color: rgba(109, 208, 255, 255); /* Color de la izquierda */
            z-index: 1;
        }

        #content {
            position: relative;
            z-index: 3;
            padding: 30px;
            text-align: center;
            font-weight: bold;
            font-family: "Poppins", sans-serif;
        }

        .circle {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 800px;
            height: 800px;
            background-color: white;
            border-radius: 50%;
            z-index: 2;
        }

        .container {
            font-family: 'Varela Round', sans-serif;
            color: var(--booFaceColor);
            position: relative;
            height: 100vh;
            text-align: center;
            font-size: calc(var(--jaggedDistance) / 2);
        }

        .container h1 {
            font-size: var(--jaggedDistance);
            margin-top: var(--jaggedDistance);
        }

        .boo-wrapper {
            width: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding-top: calc(var(--jaggedDistance) * 2);
            padding-bottom: calc(var(--jaggedDistance) * 2);
        }

        .boo {
            width: var(--booSize);
            height: calc(var(--booSize) + (var(--booSize) * .15));
            background-color: var(--booBg);
            margin-left: auto;
            margin-right: auto;
            border: calc(var(--jaggedDistance) / 1.65 - var(--jaggedDistance) / 2) solid var(--booFaceColor);
            border-bottom: 0;
            overflow: hidden;
            border-radius: calc(var(--booSize) / 2) calc(var(--booSize) / 2) 0 0;
            box-shadow: calc(-1 * var(--jaggedDistance) / 2) 0 0 2px rgba(var(--booShadow), .5) inset;
            animation: floating 3s ease-in-out infinite;
        }

        .boo .face {
            width: var(--booFaceSize);
            height: calc(var(--jaggedDistance) / 10);
            border-radius: 5px;
            background-color: var(--booFaceColor);
            position: absolute;
            left: 50%;
            bottom: calc(var(--jaggedDistance) + var(--booFaceSize));
            transform: translateX(-50%);
        }

        .boo .face::before,
        .boo .face::after {
            content: '';
            display: block;
            width: calc(var(--booFaceSize) / 4);
            height: calc(var(--booFaceSize) / 4);
            background-color: var(--booFaceColor);
            border-radius: 50%;
            position: absolute;
            bottom: calc(var(--jaggedDistance) + (var(--booFaceSize) / 3));
        }

        .boo .face::before {
            left: calc(-1 * var(--booFaceSize));
        }

        .boo .face::after {
            right: calc(-1 * var(--booFaceSize));
        }

        .shadow {
            width: calc(var(--booSize) - var(--jaggedDistance));
            height: calc(var(--jaggedDistance) / 2);
            background-color: rgba(var(--booShadow), .75);
            margin-top: calc(var(--jaggedDistance) * 1.25);
            margin-right: auto;
            margin-left: auto;
            border-radius: 50%;
            animation: floatingShadow 3s ease-in-out infinite;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            font-size: 16px;
            color: #007bff;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="background"></div>
<div class="circle"></div>
<div id="content">
    <div class="container">
        <div class="boo-wrapper">
            <div class="boo">
                <div class="face"></div>
            </div>
            <div class="shadow"></div>

            <h1>Whoops!</h1>
            <p>
                No pudimos encontrar la página<br/>
                que estás buscando.
            </p>
            <%
                String referer = request.getHeader("Referer");
                if (referer != null && !referer.isEmpty()) {
            %>
            <a href="<%= referer %>" class="back-link">Regresar</a>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>
