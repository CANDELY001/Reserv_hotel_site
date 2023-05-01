<%-- 
    Document   : location
    Created on : Jun 9, 2022, 5:19:49 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/Dream_Hotel/css/location.css"/>
    </head>
    <body>
        <jsp:include page="/jsp/Header.jsp"></jsp:include>
            <section class="sec2">
                <div class="container">
                    <div class="container2">
                        <p>Welcome to Dream Hotel,<br/> a sky high sanctuary that blends <br/>effortless luxury with grounding tranquility.</p>

                    </div>

                    <img src="/Dream_Hotel/images/hotel.png" class="hotel" />
                    <img src="/Dream_Hotel/images/car1.png" class="car1" />
                    <img src="/Dream_Hotel/images/car2.png" class="car2" />
                    <img src="/Dream_Hotel/images/car3.png" class="car3" />
                    <img src="/Dream_Hotel/images/car4.png" class="car4" />
                    <img src="/Dream_Hotel/images/dog.gif" class="dog_1" />
                    <img src="/Dream_Hotel/images/cloud.png" class="cloud" />
                    <img src="/Dream_Hotel/images/cloud.png" class="cloud_2" />
                    <img src="/Dream_Hotel/images/cloud.png" class="cloud_3" />
                    <img src="/Dream_Hotel/images/cloud.png" class="cloud_4" />
                </div>
            </section>
            <section class="sec3">
                <div class="div">
                    <!--<img src="/Dream_Hotel/images/map.jpeg" id="kharita" />-->
                    <div class="mapouter" style="width: 80%; margin: auto; margin-left: 300px"><div class="gmap_canvas"><iframe width="979" height="567" id="gmap_canvas" src="https://maps.google.com/maps?q=hotel%20farah&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://www.whatismyip-address.com/divi-discount/">divi discount</a><br><style>.mapouter{
                            position:relative;
                            text-align:right;
                            height:567px;
                            width:979px;
                        }</style><a href="https://www.embedgooglemap.net">how to embed google maps in html</a><style>.gmap_canvas {
                            overflow:hidden;
                            background:none!important;
                            height:567px;
                            width:979px;
                        }</style></div></div>
                    <p>Contact info</p>
                    <button id="adrse">Adresse</button>
                    /
                    <button id="email">Email</button>
                    /
                    <button id="tele">Phone</button>
                    <div id="divadresse">
                        <p>
                            Set on a main road, this informal hotel with views of the Atlantic
                            <br />
                            Ocean is 3 km from both the Hassan II Mosque and the Casablanca
                            Twin<br />
                            Center skyscrapers.
                        </p>
                        <h3>Adresse: H9WQ+JXF, Av. des FAR, Casablanca</h3>
                    </div>
                    <div id="divemail">
                        <h1>
                            <a href="sharifa.mesbahi124@gmail.com">Dreamhotel@gmail.com</a>
                        </h1>
                    </div>
                    <div id="divphone">
                        <h2>Phone: 05224-58100</h2>
                    </div>
                </div>
            </section>
         
                    <jsp:include page="/jsp/Footer.jsp"></jsp:include>
    </section>
    <!--<script language="javascript" src="room&tarif.js"></script>-->
    <script lang="JavaScript">

        var email = document.getElementById("email");
        var adr = document.getElementById("adrse");
        var phone = document.getElementById("tele");
        var divad = document.getElementById("divadresse");
        var divem = document.getElementById("divemail");
        var divtel = document.getElementById("divphone");
        adr.addEventListener("click", () => {
            divad.style.display = "block";
            divem.style.display = "none";
            divtel.style.display = "none";
            console.log("1");
        });
        email.addEventListener("click", () => {
            divad.style.display = "none";
            divem.style.display = "block";
            divtel.style.display = "none";
            console.log("11");
        });
        phone.addEventListener("click", () => {
            divad.style.display = "none";
            divem.style.display = "none";
            divtel.style.display = "block";
            console.log("111");
        });
        function openNav() {
            document.getElementById("myNav").style.height = "100%";
            document.getElementByTagName("Header").style.height = "0%"
        }

        function closeNav() {
            document.getElementById("myNav").style.height = "0%";
            document.getElementByTagName("Header").style.display = "block";
        }
    </script>
</body>
</html>
