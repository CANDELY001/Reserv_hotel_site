<%-- 
    Document   : Accueil
    Created on : Jun 2, 2022, 9:19:55 PM
    Author     : HP
--%>

<%@page import="pk.Models.Visiteur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/Dream_Hotel/css/Home.css"/>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style> .popup {
                display: flex;
                align-items: center;
                justify-content: center;
                position: fixed;
                width: 100vw;
                height: 100vh;
                bottom: 0;
                right: 0;
                background-color: rgba(0, 0, 0, 0.8);
                z-index: 99999;
                visibility: hidden;
                opacity: 0;
                overflow: hiden;
                transition: 0.64s ease-in-out;
            }
            .popup-inner {
                position: relative;
                bottom: -100vw;
                right: -100vh;
                display: flex;
                align-items: center;
                max-width: 800px;
                max-height: 600px;
                width: 60%;
                height: 80%;
                background-color: #fff;
                transform: rotate(32deg);
                transition: 0.64s ease-in-out;
            }
            .popup__photo {
                display: flex;
                justify-content: flex-end;
                align-items: flex-end;
                width: 40%;
                height: 100%;
                overflow: hidden;
            }
            .popup__photo img {
                width: auto;
                height: 100%;
            }
            .popup__text {
                display: flex;
                flex-direction: column;
                justify-content: center;
                width: 60%;
                height: 100%;
                padding: 4rem;
            }
            .popup__text h1 {
                font-size: 2rem;
                font-weight: 600;
                margin-bottom: 2rem;
                text-transform: uppercase;
                color: #0a0a0a;
            }
            .popup__text p {
                font-size: 0.875rem;
                color: #686868;
                line-height: 1.5;
            }
            .popup:target {
                visibility: visible;
                opacity: 1;
            }
            .popup:target .popup-inner {
                bottom: 0;
                right: 0;
                transform: rotate(0);
            }
            .popup__close {
                position: absolute;
                right: -1rem;
                top: -1rem;
                width: 3rem;
                height: 3rem;
                font-size: 0.875rem;
                font-weight: 300;
                border-radius: 100%;
                background-color: #0a0a0a;
                z-index: 4;
                color: #fff;
                line-height: 3rem;
                text-align: center;
                cursor: pointer;
                text-decoration: none;
            }
            .popup input {
                padding: 16px;
                border-radius: 5px;
                border-color: gainsboro;
  display: inline-block;
                width: 100%;
                border-top: none;
                border-left: none;
                border-right: none;
                /*box-shadow: 1px 1px 20px 0px rgba(50, 50, 50, 0.3);*/
            }

            .popup input::placeholder {
                color: gainsboro;
            }
            .popup label {
                display: inline-block;
                width: 100%;
                text-align: center;
                letter-spacing: 3px;
                word-spacing: 10px;
                font-weight: 700;
                font-style: italic;
                font-size: 1em;
                color: gray;
                text-transform: uppercase;
            }

            .popup .container {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .popup .btn {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 220px;
                height: 60px;
                background-color: black;
                cursor: pointer;
                font-size: 24px;
                color: white;
                transition: all 0.3s;
                position: relative;
                text-align: center;
                overflow: hidden;
                border-radius: 5px;
                box-shadow: 0 6px 30px -10px #cccccc;
            }
            .popup .btn:hover {
                transform: translateX(5px) translateY(4px);
                background-color: white;
                color: black;
            }

            .shop-now {
                position: relative;
            }
            .shop-now .santa-icon {
                position: absolute;
                width: 30px;
                height: 30px;
                top: -17px;
                right: -20px;
                transform: rotate(14deg);
            }
            .shop-now .santa-icon img {
                width: 100%;
                height: 100%;
            }

            .snowflake-grid {
                display: inline-grid;
                grid-template-columns: 1fr 1fr;
                grid-auto-rows: 50px;
                gap: 5px;
                width: 100px;
                transform: scale(0.4);
            }
            .snowflake-grid div {
                border-radius: 5px;
            }
            .snowflake-grid .snowflake-item {
                position: relative;
            }

            .to-left {
                position: absolute;
                top: -4px;
                left: -35px;
                animation: swing 3s infinite;
            }
            .to-left div {
                animation: flash 3s infinite;
            }

            .to-right {
                position: absolute;
                top: -25px;
                right: -35px;
                animation: swing 2.5s infinite;
            }
            .to-right div {
                animation: flash 2.5s infinite;
            }

            .border-left {
                border-left: 4px solid #e6dada;
            }

            .border-right {
                border-right: 4px solid #e6dada;
            }

            .border-bottom {
                border-bottom: 4px solid #e6dada;
            }

            .border-top {
                border-top: 4px solid #e6dada;
            }

            .sub-items {
                height: 28px;
                width: 28px;
            }

            .m-w-15 {
                width: 15px;
            }

            .m-h-15 {
                height: 15px;
            }

            .r-270 {
                transform: rotate(270deg);
            }

            .r-180 {
                transform: rotate(180deg);
            }

            .r-90 {
                transform: rotate(90deg);
            }

            .pull-down {
                position: absolute;
                bottom: 5px;
                right: 5px;
            }

            .pull-down-right {
                position: absolute;
                bottom: 5px;
                left: 5px;
            }

            .pull-right {
                position: absolute;
                right: 5px;
                top: 5px;
            }

            .pull-left {
                position: absolute;
                left: 5px;
                top: 5px;
            }

            .m-3 {
                margin: 3px;
            }

            @keyframes swing {
                50% {
                    transform: rotateZ(10deg) scale(0.4);
                }
            }
            @keyframes flash {
                50% {
                    border-color: #485563;
                }
            }

            .popup2 {
                display: flex;
                align-items: center;
                justify-content: center;
                position: fixed;
                width: 100vw;
                height: 100vh;
                bottom: 0;
                right: 0;
                background-color: rgba(0, 0, 0, 0.8);
                z-index:99999;
                visibility: hidden;
                opacity: 0;
                overflow: hiden;
                transition: 0.64s ease-in-out;
            }
            .popup2 .popup-inner {
                position: relative;
                bottom: -100vw;
                right: -100vh;
                display: flex;
                align-items: center;
                max-width: 800px;
                max-height: 800px;
                width: 60%;
                height: 90%;
                background-color: #fff;
                transform: rotate(32deg);
                transition: 0.64s ease-in-out;
            }
            .popup2 .popup__photo {
                display: flex;
                justify-content: flex-end;
                align-items: flex-end;
                width: 40%;
                height: 100%;
                overflow: hidden;
            }
            .popup2   .popup__photo img {
                width: auto;
                height: 100%;
            }
            .popup2   .popup__text {
                display: flex;
                flex-direction: column;
                justify-content: center;
                width: 60%;
                height: 100%;
                padding: 4rem;
            }
            .popup2    .popup__text h1 {
                font-size: 2rem;
                font-weight: 600;
                margin-bottom: 2rem;
                text-transform: uppercase;
                color: #0a0a0a;
            }
            .popup2    .popup__text p {
                font-size: 0.875rem;
                color: #686868;
                line-height: 1.5;
            }
            .popup2:target {
                visibility: visible;
                opacity: 1;
            }
            .popup2:target .popup-inner {
                bottom: 0;
                right: 0;
                transform: rotate(0);
            }
            .popup__close {
                position: absolute;
                right: -1rem;
                top: -1rem;
                width: 3rem;
                height: 3rem;
                font-size: 0.875rem;
                font-weight: 300;
                border-radius: 100%;
                background-color: #0a0a0a;
                z-index: 4;
                color: #fff;
                line-height: 3rem;
                text-align: center;
                cursor: pointer;
                text-decoration: none;
            }

            .popup2 .container {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .popup2 .btn {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 220px;
                height: 60px;
                background-color: black;
                cursor: pointer;
                font-size: 24px;
                color: white;
                transition: all 0.3s;
                position: relative;
                text-align: center;
                overflow: hidden;
                border-radius: 5px;
                box-shadow: 0 6px 30px -10px #cccccc;
            }
            .popup2 .btn:hover {
                transform: translateX(5px) translateY(4px);
                background-color: white;
                color: black;
            }

            .shop-now {
                position: relative;
            }
            .shop-now .santa-icon {
                position: absolute;
                width: 30px;
                height: 30px;
                top: -17px;
                right: -20px;
                transform: rotate(14deg);
            }
            .shop-now .santa-icon img {
                width: 100%;
                height: 100%;
            }

            .snowflake-grid {
                display: inline-grid;
                grid-template-columns: 1fr 1fr;
                grid-auto-rows: 50px;
                gap: 5px;
                width: 100px;
                transform: scale(0.4);
            }
            .snowflake-grid div {
                border-radius: 5px;
            }
            .snowflake-grid .snowflake-item {
                position: relative;
            }

            .to-left {
                position: absolute;
                top: -4px;
                left: -35px;
                animation: swing 3s infinite;
            }
            .to-left div {
                animation: flash 3s infinite;
            }

            .to-right {
                position: absolute;
                top: -25px;
                right: -35px;
                animation: swing 2.5s infinite;
            }
            .to-right div {
                animation: flash 2.5s infinite;
            }

            .border-left {
                border-left: 4px solid #e6dada;
            }

            .border-right {
                border-right: 4px solid #e6dada;
            }

            .border-bottom {
                border-bottom: 4px solid #e6dada;
            }

            .border-top {
                border-top: 4px solid #e6dada;
            }

            .sub-items {
                height: 28px;
                width: 28px;
            }

            .m-w-15 {
                width: 15px;
            }

            .m-h-15 {
                height: 15px;
            }

            .r-270 {
                transform: rotate(270deg);
            }

            .r-180 {
                transform: rotate(180deg);
            }

            .r-90 {
                transform: rotate(90deg);
            }

            .pull-down {
                position: absolute;
                bottom: 5px;
                right: 5px;
            }

            .pull-down-right {
                position: absolute;
                bottom: 5px;
                left: 5px;
            }

            .pull-right {
                position: absolute;
                right: 5px;
                top: 5px;
            }

            .pull-left {
                position: absolute;
                left: 5px;
                top: 5px;
            }

            .m-3 {
                margin: 3px;
            }

            @keyframes swing {
                50% {
                    transform: rotateZ(10deg) scale(0.4);
                }
            }
            @keyframes flash {
                50% {
                    border-color: #485563;
                }
            }

            * {
                box-sizing: border-box;
            }

            .row {
                display: -ms-flexbox; /* IE10 */
                display: flex;
                -ms-flex-wrap: wrap; /* IE10 */
                flex-wrap: wrap;
                margin: 0 -16px;
            }

            .col-25 {
                -ms-flex: 25%; /* IE10 */
                flex: 25%;
            }

            .col-50 {
                -ms-flex: 50%; /* IE10 */
                flex: 50%;
            }

            .col-25,
            .col-50 {
                padding: 0 16px;
            }

            .popup2  input[type="text"] {
                width: 100%;
                margin-bottom: 10px;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }
            .popup input[type="submit"]{
                background-color: transparent;
                border: none;
                color: white;
            }
            .popup input[type="submit"]:hover{
                background-color: transparent;
                border: none;
                color: black;
            }
            .popup2  label {
                margin-bottom: 10px;
                display: block;
            }

            .popup2   .icon-container {
                margin-bottom: 20px;
                padding: 7px 0;
                font-size: 24px;
                display: inline;
            }

            span.price {
                float: right;
                color: grey;
            }

            @media (max-width: 800px) {
                .row {
                    flex-direction: column-reverse;
                }
                .col-25 {
                    margin-bottom: 20px;
                }
            }</style>
    </head>
    <body>
        <div class="popup2" id="popup2">
            <div class="popup-inner">
                <div class="popup__photo">
                    <img src="pics/01-naumi-singapore-eden-nirwana_604e7638.jpeg" />
                </div>
                <div class="popup__text">
                    <h1>Pyement details</h1>
                    <label id="radio" for="fname">Payement Cards :</label>

                    <div class="icon-container">
                        <i class="fa fa-cc-visa" style="color: navy"></i>
                        <i class="fa fa-cc-amex" style="color: blue"></i>
                        <i class="fa fa-cc-mastercard" style="color: red"></i>
                        <i class="fa fa-cc-discover" style="color: orange"></i>
                    </div>

                    <div id="divcard">
                        <label for="cname">Name on Card</label>
                        <input
                            type="text"
                            id="cname"
                            name="cardname"
                            placeholder="John More Doe"
                            />
                        <label for="ccnum">Credit card number</label>
                        <input
                            type="text"
                            id="ccnum"
                            name="cardnumber"
                            placeholder="1111-2222-3333-4444"
                            />
                        <label for="expmonth">Exp Month</label>
                        <input
                            type="text"
                            id="expmonth"
                            name="expmonth"
                            placeholder="September"
                            />
                        <div class="row">
                            <div class="col-50">
                                <label for="expyear">Exp Year</label>
                                <input
                                    type="text"
                                    id="expyear"
                                    name="expyear"
                                    placeholder="2018"
                                    />
                            </div>
                            <div class="col-50">
                                <label for="cvv">CVV</label>
                                <input type="text" id="cvv" name="cvv" placeholder="352" />
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="btn">
                            <div class="shop-now">Add card</div>
                            <div class="snowflake-grid to-left">
                                <div class="snowflake-item border-bottom border-right">
                                    <div class="sub-items border-right border-bottom pull-down">
                                        <div
                                            class="m-w-15 m-h-15 border-right border-bottom m-3"
                                            ></div>
                                    </div>
                                </div>
                                <div class="snowflake-item border-bottom border-left">
                                    <div
                                        class="sub-items border-right border-bottom r-90 pull-down-right"
                                        >
                                        <div
                                            class="m-w-15 m-h-15 border-right border-bottom m-3"
                                            ></div>
                                    </div>
                                </div>
                                <div class="snowflake-item border-top border-right">
                                    <div
                                        class="sub-items border-right border-bottom r-270 pull-right"
                                        >
                                        <div
                                            class="m-w-15 m-h-15 border-right border-bottom m-3"
                                            ></div>
                                    </div>
                                </div>
                                <div class="snowflake-item border-top border-left">
                                    <div
                                        class="sub-items border-right border-bottom r-180 pull-left"
                                        >
                                        <div
                                            class="m-w-15 m-h-15 border-right border-bottom m-3"
                                            ></div>
                                    </div>
                                </div>
                            </div>
                            <div class="snowflake-grid to-right">
                                <div class="snowflake-item border-bottom border-right">
                                    <div class="sub-items border-right border-bottom pull-down">
                                        <div
                                            class="m-w-15 m-h-15 border-right border-bottom m-3"
                                            ></div>
                                    </div>
                                </div>
                                <div class="snowflake-item border-bottom border-left">
                                    <div
                                        class="sub-items border-right border-bottom r-90 pull-down-right"
                                        >
                                        <div
                                            class="m-w-15 m-h-15 border-right border-bottom m-3"
                                            ></div>
                                    </div>
                                </div>
                                <div class="snowflake-item border-top border-right">
                                    <div
                                        class="sub-items border-right border-bottom r-270 pull-right"
                                        >
                                        <div
                                            class="m-w-15 m-h-15 border-right border-bottom m-3"
                                            ></div>
                                    </div>
                                </div>
                                <div class="snowflake-item border-top border-left">
                                    <div
                                        class="sub-items border-right border-bottom r-180 pull-left"
                                        >
                                        <div
                                            class="m-w-15 m-h-15 border-right border-bottom m-3"
                                            ></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="info"></div>
                </div>
                <a class="popup__close" href="#">X</a>
            </div>
        </div>
        <div class="popup" id="popup">
            <div class="popup-inner">
                <div class="popup__photo">
                    <img src="pics/room1.jpeg" />
                </div>
                <div class="popup__text">
                    <h1>Manage Account</h1>
                    <form action="/Dream_Hotel/ChangermdpServlet" method="post">
                        <% Visiteur v = null;
                            if (session.getAttribute("v") != null) {
                                v = (Visiteur) session.getAttribute("v");
                            }
              if (v != null) {%>


                        <label>Name</label>
                        <input type="text" placeholder="nom"  name="nom" value="<%=v.getPseudo()%>" disabled="" /><br />
                        <label>Email</label>
                        <input type="text" placeholder="email" value="<%=v.getEmail()%>" disabled=""/><br />
                     

                        <label>Current password</label>
                        <input type="password" placeholder="password" name="pass11" /><br />

                        <label>New password</label>
                        <input type="password" placeholder="password" name="pass12" /><br />
                          <%}%> <%
                            if (request.getAttribute("pass") != null) {
                        %>
                        <div style="color:blue; font-size: 12px; font-style: italic;"><%=request.getAttribute("pass")%></div>
                        <%}%>
                        <div class="container">
                            <div class="btn">
                                <div class="shop-now"><input type="submit" value="Save"/></div>
                                <div class="snowflake-grid to-left">
                                    <div class="snowflake-item border-bottom border-right">
                                        <div class="sub-items border-right border-bottom pull-down">
                                            <div
                                                class="m-w-15 m-h-15 border-right border-bottom m-3"
                                                ></div>
                                        </div>
                                    </div>
                                    <div class="snowflake-item border-bottom border-left">
                                        <div
                                            class="sub-items border-right border-bottom r-90 pull-down-right"
                                            >
                                            <div
                                                class="m-w-15 m-h-15 border-right border-bottom m-3"
                                                ></div>
                                        </div>
                                    </div>
                                    <div class="snowflake-item border-top border-right">
                                        <div
                                            class="sub-items border-right border-bottom r-270 pull-right"
                                            >
                                            <div
                                                class="m-w-15 m-h-15 border-right border-bottom m-3"
                                                ></div>
                                        </div>
                                    </div>
                                    <div class="snowflake-item border-top border-left">
                                        <div
                                            class="sub-items border-right border-bottom r-180 pull-left"
                                            >
                                            <div
                                                class="m-w-15 m-h-15 border-right border-bottom m-3"
                                                ></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="snowflake-grid to-right">
                                    <div class="snowflake-item border-bottom border-right">
                                        <div class="sub-items border-right border-bottom pull-down">
                                            <div
                                                class="m-w-15 m-h-15 border-right border-bottom m-3"
                                                ></div>
                                        </div>
                                    </div>
                                    <div class="snowflake-item border-bottom border-left">
                                        <div
                                            class="sub-items border-right border-bottom r-90 pull-down-right"
                                            >
                                            <div
                                                class="m-w-15 m-h-15 border-right border-bottom m-3"
                                                ></div>
                                        </div>
                                    </div>
                                    <div class="snowflake-item border-top border-right">
                                        <div
                                            class="sub-items border-right border-bottom r-270 pull-right"
                                            >
                                            <div
                                                class="m-w-15 m-h-15 border-right border-bottom m-3"
                                                ></div>
                                        </div>
                                    </div>
                                    <div class="snowflake-item border-top border-left">
                                        <div
                                            class="sub-items border-right border-bottom r-180 pull-left"
                                            >
                                            <div
                                                class="m-w-15 m-h-15 border-right border-bottom m-3"
                                                ></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="info"></div>
                </div>
                </form>
                <a class="popup__close" href="#">X</a>
            </div>
        </div>
        <div class="wrap">
            <jsp:include page="/jsp/Header.jsp"></jsp:include>
                <section class="sec2">
                    <video src="/Dream_Hotel/pics/My Movie.mp4" muted loop autoplay></video>
                    <div class="content">
                        <h1>
                            A world of <br />
                            possibility <br />and dreams
                        </h1>
                        <!--<h1> UN MONDE <br> INNOMBRABLES <br>POSSIBILITÉS<br>& DE RÊVES </h1> -->
                        <div class="socialdiv">
                            <ul class="social">
                                <li>
                                    <a href="#"
                                       ><img src="https://i.ibb.co/x7P24fL/facebook.png"
                                          /></a>
                                </li>
                                <li>
                                    <a href="#"
                                       ><img src="https://i.ibb.co/Wnxq2Nq/twitter.png"
                                          /></a>
                                </li>
                                <li>
                                    <a href="#"
                                       ><img src="https://i.ibb.co/ySwtH4B/instagram.png"
                                          /></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </section>
                <section class="sec3">
                    <div class="aboutus">
                        <img src="/Dream_Hotel/pics/pic.jpeg" />
                    </div>
                    <div class="aboutus2">
                        <div class="quote">
                            <h6>James et la pêche géante</h6>
                            <h3>
                                "Eh bien, peut-être que ça a commencé comme ça. Comme un rêve,
                                mais n'est-ce pas tout ? Ces bâtiments. Ces lumières. Toute cette
                                ville. Quelqu'un devait d'abord en rêver. Et c'est peut-être ce
                                que j'ai fait. Je rêvais de venir ici, mais je l'ai fait. "
                            </h3>
                            <a class="btn" href="/Dream_Hotel/jsp/About.jsp"
                               >ABOUT US
                                <span class="line-1"></span>
                                <span class="line-2"></span>
                                <span class="line-3"></span>
                                <span class="line-4"></span>
                            </a>
                        </div>
                    </div>
                </section>
                <section class="sec4">
                    <div class="suggest reveal">
                        <h2 class="titlesec4">stay with us</h2>
                        <div class="cardd">
                            <div class="cardd-element">
                                <a href="/Dream_Hotel/jsp/Offer.jsp"><img src="/Dream_Hotel/pics/f70a524fd3b731db70a99fac6486668f.jpeg" /></a>
                                <p>our Bars</p>
                            </div>
                        </div>

                        <div class="cardd">
                            <div class="cardd-element">
                                <a href="/Dream_Hotel/jsp/Offer.jsp"> <img src="/Dream_Hotel/pics/1fdd5349fc2be18530ea8b8353dce88c 2.jpeg" /></a>
                                <p>our GYM</p>
                            </div>
                        </div>
                        <div class="cardd">
                            <div class="cardd-element">
                                <a href="/Dream_Hotel/jsp/Offer.jsp"><img src="/Dream_Hotel/pics/3ac0b6db8ac1efad97ce112b78d98ab8.jpeg" /></a>
                                <p>our SPA</p>
                            </div>
                        </div>
                        <div class="cardd">
                            <div class="cardd-element">
                                <a href="/Dream_Hotel/jsp/Offer.jsp"><img src="/Dream_Hotel/pics/916f337876d51cc0b8ade420b9620709.jpeg" /></a>
                                <p>our RESTAURANTS</p>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="sec5">
                    <div class="slider">
                        <div class="slide active">
                            <img
                                src="/Dream_Hotel/pics/01-naumi-singapore-eden-nirwana_604e7638.jpeg"
                                alt=""
                                />
                            <div class="info">
                                <h2>MAGICLY</h2>
                            </div>
                        </div>
                        <div class="slide">
                            <img
                                src="/Dream_Hotel/pics/02-naumi-singapore-gabrielle-camillia_1e4c1322.jpeg"
                                alt=""
                                />
                            <div class="info">
                                <h2>EDEN</h2>
                            </div>
                        </div>
                        <div class="slide">
                            <img
                                src="/Dream_Hotel/pics/04-naumi-auckland-airport-ziggy_5448352d.jpeg"
                                alt=""
                                />
                            <div class="info">
                                <h2>BERSKER</h2>
                            </div>
                        </div>
                        <div class="slide">
                            <img src="/Dream_Hotel/pics/07-thecentralhabitat_4a4a368f.jpeg" alt="" />
                            <div class="info">
                                <h2>LOVELY</h2>
                            </div>
                        </div>
                        <div class="slide">
                            <img src="/Dream_Hotel/pics/room2.jpeg" alt="" />
                            <div class="info">
                                <h2>ELFEN LIED</h2>
                            </div>
                        </div>
                    </div>
                    <div class="navigation">
                        <a class="prev-btn">
                            <img src="/Dream_Hotel/pics/chevron-left-solid.svg" alt=""
                                 /></a>
                        <a class="next-btn">
                            <img src="/Dream_Hotel/pics/chevron-right-solid.svg" alt=""
                                 /></a>
                    </div>
                </section>
                <section class="sec6">
                    <h2>DREAM SIGANTURES</h2>
                    <h4>(Just some things that we offer)</h4>
                    <div id="wrapper">
                        <div id="carousel">
                            <div id="content">
                                <div class="card">
                                    <img src="/Dream_Hotel/dream signiateurs/05-hometech_716dfc58.webp" />
                                    <h2 class="card-title">HOME TECH</h2>
                                </div>
                                <div class="card">
                                    <img src="/Dream_Hotel/dream signiateurs/06-noplastics_d3b911fc.webp" />
                                    <h2 class="card-title">NO SIGNLE USE PLASTIC</h2>
                                </div>
                                <div class="card">
                                    <img class="parking_img" src="pics/parking-sensor.png" />
                                    <h2 class="card-title">PARKING</h2>
                                </div>
                                <div class="card">
                                    <img
                                        src="/Dream_Hotel/dream signiateurs/07-superbathamenities_8e4f2c5d.webp"
                                        />
                                    <h2 class="card-title">SUPERFOOD BATH AMENITIES</h2>
                                </div>
                                <div class="card">
                                    <img src="/Dream_Hotel/dream signiateurs/08-wilddesigns_cf3df083.webp" />
                                    <h2 class="card-title">WILD DESIGNES</h2>
                                </div>
                                <div class="card">
                                    <img
                                        src="/Dream_Hotel/dream signiateurs/01-hyperlocalnibbles_8177fee1.webp"
                                        />
                                    <h2 class="card-title">BREAKFAST</h2>
                                </div>
                                <div class="card">
                                    <img
                                        src="/Dream_Hotel/dream signiateurs/07-superbathamenities_8e4f2c5d.webp"
                                        />
                                    <h2 class="card-title">ALIMENTATION BIOLOGIQUE</h2>
                                </div>
                                <div class="card">
                                    <img src="/Dream_Hotel/dream signiateurs/03-candyisland_8d9c6c60.webp" />
                                    <h2 class="card-title">CANDY STATION</h2>
                                </div>
                                <div class="card">
                                    <img src="/Dream_Hotel/dream signiateurs/02-blowyourwig_ebdb8c5c.webp" />
                                    <h2 class="card-title">BELOW YOU WIG</h2>
                                </div>
                            </div>
                        </div>
                        <button id="prev">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                >
                            <path fill="none" d="M0 0h24v24H0V0z" />
                            <path
                                d="M15.61 7.41L14.2 6l-6 6 6 6 1.41-1.41L11.03 12l4.58-4.59z"
                                />
                            </svg>
                        </button>
                        <button id="next">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                >
                            <path fill="none" d="M0 0h24v24H0V0z" />
                            <path
                                d="M10.02 6L8.61 7.41 13.19 12l-4.58 4.59L10.02 18l6-6-6-6z"
                                />
                            </svg>
                        </button>
                    </div>
                </section>
                <section class="sec7">
                    <div class="element">
                        <span class="s1"
                              ><img src="/Dream_Hotel/pics/home-playful_2c371e08.jpeg" alt=""
                              /></span>
                        <span class="s1">
                            <h1>PLAYFUL</h1>
                        </span>
                    </div>
                    <div class="element">
                        <span class="s1"
                              ><img src="/Dream_Hotel/pics/03a5f96744e2d9912469ee7be83963d1.jpeg" alt=""
                              /></span>
                        <span class="s1">
                            <h1>COMFORTABLE</h1>
                        </span>
                    </div>
                    <div class="element">
                        <span class="s1"
                              ><img src="/Dream_Hotel/pics/home-beautiful_3b25d9a4.jpeg" alt=""
                              /></span>
                        <span class="s1">
                            <h1>BEAUTIFUL</h1>
                        </span>
                    </div>
                    <div class="element">
                        <span class="s1"
                              ><img src="/Dream_Hotel/pics/2db205185b793aeebd5e81a190fddc0f.jpeg" alt=""
                              /></span>
                        <span class="s1">
                            <h1>GORGEOUS</h1>
                        </span>
                    </div>
                    <div class="element">
                        <span class="s1"
                              ><img src="/Dream_Hotel/pics/home-trendsetting_bb6a0684.jpeg" alt=""
                              /></span>
                        <span class="s1">
                            <h1>GENEROUS</h1>
                        </span>
                    </div>
                    <div class="element">
                        <span class="s1"
                              ><img src="/Dream_Hotel/pics/home-quirky_68239c1b.jpeg" alt=""
                              /></span>
                        <span class="s1">
                            <h1>QUIRKY</h1>
                        </span>
                    </div>
                    <div class="element">
                        <span class="s1"
                              ><img src="/Dream_Hotel/pics/home-bold_6e6b5794.jpeg" alt=""
                              /></span>
                        <span class="s1">
                            <h1>BLOD</h1>
                        </span>
                    </div>
                </section>
            <jsp:include page="/jsp/Footer.jsp"></jsp:include>
        </div>



        <script src="/Dream_Hotel/js/Header.js"></script><!-- comment -->
    </body>
</html>
