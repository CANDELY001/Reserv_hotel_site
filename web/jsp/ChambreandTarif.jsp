<%-- 
    Document   : ChambreandTarif
    Created on : Jun 10, 2022, 2:04:43 PM
    Author     : HP
--%>

<%@page import="pk.Models.Visiteur"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pk.dao.MyUtile"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/Dream_Hotel/css/ChambreandTarif.css"/>

        <script
            src="https://kit.fontawesome.com/f6dcf461c1.js" crossorigin="anonymous"
        ></script>
    </head>
    <body>
        <jsp:include page="/jsp/Header.jsp"></jsp:include>
            <section class="sec2">
                <video src="/Dream_Hotel/pics/My Movie.mp4" muted loop autoplay></video>
                <div class="content">
                    <h1>
                        your <br />
                        comfort <br />
                        is our priority
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
                                <a href="#"><img src="https://i.ibb.co/Wnxq2Nq/twitter.png" /></a>
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
            <div class="booking_info ">
                <form action="/Dream_Hotel/jsp/ChambreandTarif.jsp">
                    <div class="booking">
                        <div class="item">
                            <div class="dropdown2">
                                <p>Date</p>
                                <i class="fa fa-angle-down" onclick="showme()"></i>

                                <div id="divdate" class="dropdown-content">


                                    <input type="date" name="dated" value="2022-06-11" id="dated">

                                    <input  type="date" name="datef" value="2022-06-18" id="datef">

                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="dropdown2">
                                <p >Room,Adults</p>
                                <i class="fa fa-angle-down"  onclick="showme2()"></i>
                                <div id="divroom" class="dropdown-content">


                                    <p>Adulte</p>  <input type="number" value="1" style="color: black;" name="adult"/><br>


                                    <p>Children</p>  <input type="number" value="0" style="color: black;" name="children" /><br>

                                    <p>lit</p><input type="number" value="1" style="color: black;" name="nbrlit"/>
                                </div></div>
                        </div>
                        <div class="item">

                            <div class="dropdown2">
                                <p >Code promo</p>
                                <i class="fa fa-angle-down"  onclick="showme4()"></i>
                                <div id="divpromo" class="dropdown-content">

                                    <input type="text" placeholder="Enter the code here" name="promo">

                                </div></div>
                        </div>
                        <div class="item">

                            <div class="dropdown2">
                                <p >Filters</p>
                                <i class="fa fa-angle-down"  onclick="showme3()"></i>
                                <div id="divfiltre" class="dropdown-content">


                                    <p>Prix <span>500DH</span> <input type="range" value="1" max="5000" min="500" step="100" name="prix" /> <span> 50000DH</span>
                                    </p> <br>

                                    <p>Type room  <select name="type">
                                            <option value="-">All</option>
                                            <option value="Suite">Suite</option>
                                            <option value="Room">Room</option>
                                        </select></p><br>

                                </div></div>
                        </div>
                        <div class="item">
                            <button class="button-51" role="button" type="submit">search</button>
                        </div>
                    </div>
                </form>
            </div>
        <%

            Connection con = MyUtile.seConnecter();
            String req = "select * from chambre join typelit using(nolit)";
            if (request.getParameter("type") != null && request.getParameter("type").equals("-")) {
                req += " where ";

                if (request.getParameter("dated") != null && request.getParameter("datef") != null) {
                    req += "  idch  not in (select idch from reservation where dateDebutRef like to_date('" + request.getParameter("dated") + "','yyyy-mm-dd')";
                    req += " and   DATEFINREF like to_date('" + request.getParameter("datef") + "','yyyy-mm-dd'))";
                }
                if (request.getParameter("adult") != null && request.getParameter("nbrlit") != null && request.getParameter("children") != null) {
                    if (Integer.parseInt(request.getParameter("adult")) >= 2 && Integer.parseInt(request.getParameter("children")) != 0) {
                        req += " and nbrlit>=" + Integer.parseInt(request.getParameter("nbrlit")) + " and nolit =2 and ";
                    }
                }
                if (request.getParameter("prix") != null) {
                    req += " and prix<=" + Integer.parseInt(request.getParameter("prix"));
                }
            }
            if (request.getParameter("type") != null && !request.getParameter("type").equals("-")) {
                if (request.getParameter("type").equals("Suite")) {
                    req += " where ";

                    if (request.getParameter("dated") != null && request.getParameter("datef") != null) {
                        req += "  idch  not in (select idch from reservation where dateDebutRef like to_date('" + request.getParameter("dated") + "','yyyy-mm-dd')";
                        req += " and   DATEFINREF like to_date('" + request.getParameter("datef") + "','yyyy-mm-dd'))";
                    }
                    if (request.getParameter("adult") != null && request.getParameter("nbrlit") != null && request.getParameter("children") != null) {
                        if (Integer.parseInt(request.getParameter("adult")) >= 2 && Integer.parseInt(request.getParameter("children")) != 0) {
                            req += " and nbrlit>=" + Integer.parseInt(request.getParameter("nbrlit")) + " and nolit =2 and type like('Suite%')";
                        }
                    }
                    if (request.getParameter("prix") != null) {
                        req += " and prix<=" + Integer.parseInt(request.getParameter("prix"));
                    }
                }
                if (request.getParameter("type").equals("Room")) {
                    req += " where ";

                    if (request.getParameter("dated") != null && request.getParameter("datef") != null) {
                        req += "  idch  not in(select idch from reservation where dateDebutRef like to_date('" + request.getParameter("dated") + "','yyyy-mm-dd')";
                        req += " and   DATEFINREF like to_date('" + request.getParameter("datef") + "','yyyy-mm-dd'))";
                    }
                    if (request.getParameter("adult") != null && request.getParameter("nbrlit") != null && request.getParameter("children") != null) {
                        if (Integer.parseInt(request.getParameter("adult")) >= 2 && Integer.parseInt(request.getParameter("children")) != 0) {
                            req += " and nbrlit>=" + Integer.parseInt(request.getParameter("nbrlit")) + " and nolit=2 and type in('Room double','Room triple','Room twin','Room double-double')";
                        }
                    }
                    if (request.getParameter("prix") != null) {
                        req += " and prix<=" + Integer.parseInt(request.getParameter("prix"));
                    }
                }
            }
            System.out.print(req);
            ResultSet rs = con.createStatement().executeQuery(req);
        %>
        <section class="sec3">
            <div class="wrap">
                <%
   
   
while (rs.next()) {
                %>
                <div class="blog-post">
                    <div
                        class="blog-post_img"
                        onclick="document.getElementById('id0<%=rs.getInt("idch")%>').style.display = 'block'"
                        >
                        <img src="/Dream_Hotel/chambres/<%=rs.getString("img")%>" alt="" />
                    </div>
                    <div class="blog-post_info">
                        <div class="blog-post_date"></div>
                        <h1 class="blog-post_title"><%=rs.getString("title")%></h1>
                        <p class="blog-post_text">
                            <%=rs.getString("description")%>
                        </p>
                        <div class="starts">
                            <span class="hint-star star">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                            </span>
                        </div>
                        <a href="/Dream_Hotel/jsp/checkout.jsp?idch=<%=rs.getString("idch")%>&motant=<%=rs.getInt("prix")%>" class="blog-post_cta">Book now</a>

                        <a href="/Dream_Hotel/like?idch=<%=rs.getString("idch")%>" style="color:black;"><i id="<%=rs.getString("idch")%>" class="fas fa-heart" style="font-size: 30px; margin-left: 500px; " onclick="jadore('<%=rs.getString("idch")%>')"></i>
                        </a>
                    </div>
                </div>
                <%}
                    rs.close();%>

            </div>
        </section>

        <% req = "select * from chambre";
            rs = con.createStatement().executeQuery(req);
            while (rs.next()) {%>
        <div id="id0<%=rs.getInt("idch")%>" class="modal">
            <span onclick="document.getElementById('id0<%=rs.getInt("idch")%>').style.display = 'none'" class="close" title="Close Modal">&times;</span>
            <div class="modal-content" action="/action_page.php">
                <div class="container-all">
                    <div class="container">
                        <%
                            ResultSet rs2, rs3;
                            rs2 = con.createStatement().executeQuery("select * from image join chambre using(idch) where idch=" + rs.getInt("idch"));
                            rs3 = con.createStatement().executeQuery("select rownum ,url, idimage, idch from (select * from image join chambre using(idch) where idch=" + rs.getInt("idch") + ")where rownum<=1");


                        %>
                        <div class="feature">
                            <figure class="featured-item image-holder r-3-2 transition" ></figure>
                        </div>

                        <div class="gallery-wrapper">
                            <div class="gallery">
                                <%     
      while (rs2.next()) {
   
                                %>
                                <div class="item-wrapper">
                                    <figure class="gallery-item image-holder r-3-2  transition" style="background-image: url('/Dream_Hotel/chambres/<%=rs2.getString("url")%>')" ></figure>
                                </div>
                                <%}%>



                            </div>
                        </div>

                        <div class="controls">
                            <button class="move-btn left">&larr;</button>
                            <button class="move-btn right">&rarr;</button>
                        </div>

                    </div>
                    <div class="info">
                        <h1><%=rs.getString("title")%></h1>
                        <h2><%=rs.getInt("prix")%> DH</h2>
                        <div class="description">
                            <p><%=rs.getString("description")%></p>

                        </div>
                             <div class="starts">
                            <span class="hint-star star">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                            </span>
                        <div class="miza">
                            <span>
                                <img src="/Dream_Hotel/phot/nest_remote_comfort_sensor_FILL0_wght400_GRAD0_opsz48.png" alt="">
                                <p class="grpp"> WiFi</p> 
                            </span>  <%if (rs.getInt("parking") == 1) {%>
                            <span>

                                <img src="/Dream_Hotel/phot/local_parking_FILL0_wght400_GRAD0_opsz48.png" alt="">
                                <p class="grpp"> Parking</p>
                            </span><%}%>
                            <span>
                                <img src="/Dream_Hotel/phot/snooze_FILL0_wght400_GRAD0_opsz48.png" alt="">
                                <p class="grpp">Late check out</p> 
                            </span>
                            <%if (rs.getInt("breakfast") == 1) {%>
                            <span>
                                <img src="/Dream_Hotel/phot/bakery_dining_FILL0_wght400_GRAD0_opsz48.png" alt="">
                                <p class="grpp">Breakfast</p> 
                            </span>
                            <%}%>

                        </div>
                       
                        </div>
                        <button class="book">Book Now</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%}%>
</div>

<jsp:include page="/jsp/Footer.jsp"></jsp:include>
    <script src="/Dream_Hotel/js/jquery.js"></script>
    <script>

                var m = 0;

                function jadore(e) {
                    if (m == 0) {
                        document.getElementById(e).style.color = "black";

                        m++;
                    } else {
                        document.getElementById(e).style.color = "red";
                        m = 0;
                    }



                }

                /* 
                 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
                 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
                 */
                // Get the modal
                var modal = document.getElementById('id01');

                // When the user clicks anywhere outside of the modal, close it
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
                var gallery = document.querySelector('.gallery');
                var galleryItems = document.querySelectorAll('.gallery-item');
                var numOfItems = gallery.children.length;
                var itemWidth = 7; // percent: as set in css

                var featured = document.querySelector('.featured-item');

                var leftBtn = document.querySelector('.move-btn.left');
                var rightBtn = document.querySelector('.move-btn.right');
                var leftInterval;
                var rightInterval;

                var scrollRate = 0.2;
                var left;

                function selectItem(e) {
                    if (e.target.classList.contains('active'))
                        return;

                    featured.style.backgroundImage = e.target.style.backgroundImage;

                    for (var i = 0; i < galleryItems.length; i++) {
                        if (galleryItems[i].classList.contains('active'))
                            galleryItems[i].classList.remove('active');
                    }

                    e.target.classList.add('active');
                }

                /*   function galleryWrapLeft() {
                 var first = gallery.children[0];
                 gallery.removeChild(first);
                 gallery.style.left = -itemWidth + '%';
                 gallery.appendChild(first);
                 gallery.style.left = '0%';
                 }
                 
                 function galleryWrapRight() {
                 var last = gallery.children[gallery.children.length - 1];
                 gallery.removeChild(last);
                 gallery.insertBefore(last, gallery.children[0]);
                 gallery.style.left = '-23%';
                 }
                 
                 function moveLeft() {
                 left = left || 0;
                 
                 leftInterval = setInterval(function() {
                 gallery.style.left = left + '%';
                 
                 if (left > -itemWidth) {
                 left -= scrollRate;
                 } else {
                 left = 0;
                 galleryWrapLeft();
                 }
                 }, 1);
                 }
                 
                 function moveRight() {
                 //Make sure there is element to the leftd
                 if (left > -itemWidth && left < 0) {
                 left = left  - itemWidth;
                 
                 var last = gallery.children[gallery.children.length - 1];
                 gallery.removeChild(last);
                 gallery.style.left = left + '%';
                 gallery.insertBefore(last, gallery.children[0]);	
                 }
                 
                 left = left || 0;
                 
                 leftInterval = setInterval(function() {
                 gallery.style.left = left + '%';
                 
                 if (left < 0) {
                 left += scrollRate;
                 } else {
                 left = -itemWidth;
                 galleryWrapRight();
                 }
                 }, 1);
                 }
                 
                 function stopMovement() {
                 clearInterval(leftInterval);
                 clearInterval(rightInterval);
                 }*/

                //leftBtn.addEventListener('mouseenter', moveLeft);
                //leftBtn.addEventListener('mouseleave', stopMovement);
                //rightBtn.addEventListener('mouseenter', moveRight);
                //rightBtn.addEventListener('mouseleave', stopMovement);


                //Start this baby up
                function init() {


                    //Set Initial Featured Image
                    featured.style.backgroundImage = galleryItems[0].style.backgroundImage;

                    //Set Images for Gallery and Add Event Listeners
                    for (var i = 0; i < galleryItems.length; i++) {

                        galleryItems[i].addEventListener("click", selectItem);
                    }
                }
                init();
                //sticky menu
                var bar = document.querySelector(".booking_info");
                window.onscroll = function () {
                    // pageYOffset or scrollY
                    if (window.scrollY > 600) {
                        bar.classList.add("sticky");
                    } else {
                        bar.classList.remove("sticky");
                    }
                };


                var monthFormatter = new Intl.DateTimeFormat("en-us", {month: "long"});
                var weekdayFormatter = new Intl.DateTimeFormat("en-us", {
                    weekday: "long",
                });

                var dates = [];
                dates[0] = new Date(); // defaults to today
                dates[1] = addDays(dates[0], 7);

                var currentDate = 0; // index into dates[]
                var previousDate = 1;

                var datesBoxes = $(".date-picker-date");
                var displayBoxes = $(".date-picker-display");

                // sensible default just in case jQuery doesn't kick in
                // makes sure that the experience is still usable, and when $(window).width() returns then this variable is updated to the correct value
                var windowWidth = 300;
                var colourPickerWidth = 300;

                // set up dates
                $(document).ready(function () {
                    // will work the same the first time as every other
                    updateDatePicker();

                    // update dates shown to correct dates
                    $(datesBoxes[0]).text(getDateString(dates[0]));
                    $(datesBoxes[1]).text(getDateString(dates[1]));

                    $(displayBoxes[0]).text(
                            dates[0].getDate() + " " + monthFormatter.format(dates[0]).slice(0, 3)
                            );
                    $(displayBoxes[1]).text(
                            dates[1].getDate() + " " + monthFormatter.format(dates[1]).slice(0, 3)
                            );
                });

                // add event listeners
                $(document).ready(function () {
                    // has to be applied each time, as it's removed when calendar is reset
                    applyDateEventListener();

                    $(".date-picker-date").click(function (e) {
                        // if active, toggle picker off and return
                        var currentlyActive = $(this).hasClass("active");
                        if (currentlyActive) {
                            $(this).removeClass("active");
                            hideDatePicker();
                            return;
                        }

                        $(".date-picker-date").removeClass("active");
                        $(this).addClass("active");

                        // update currentDate
                        previousDate = currentDate;
                        if ($(this)[0].id === "date-picker-date-first") {
                            currentDate = 0;
                        } else {
                            currentDate = 1;
                        }

                        // update calendar
                        showDatePicker(e);
                        updateDatePicker();
                    });

                    $("#date-picker-next-month").click(function () {
                        changeMonth("Next");
                    });

                    $("#date-picker-previous-month").click(function () {
                        changeMonth("Previous");
                    });

                    $("#date-picker-exit").click(function () {
                        hideDatePicker();
                    });

                    $(document).click(function (e) {
                        var target = $(e.target);
                        var clickedOnPicker = target.closest("#date-picker-modal").length;
                        var clickedOnDate = target.closest(".date-picker-date").length;
                        var isPreviousOrNext =
                                target.hasClass("previous-month") || target.hasClass("next-month");

                        if (!(clickedOnPicker || clickedOnDate || isPreviousOrNext)) {
                            hideDatePicker();
                        }
                    });
                });

                // called on initialising (set to today) and then every time the month changes or on moving between dates
                function updateDatePicker(changeMonth = false) {
                    var datePicker = $("#date-picker");
                    var curDate = dates[currentDate]; // shorthand

                    // check if it needs to update
                    // updates if changed month directly (changeMonth) or if switched to other .date-picker-date and month is different (differentMonth)
                    var differentMonth = checkChangedMonth();
                    if (changeMonth === false && differentMonth === false) {
                        return;
                    }

                    updatePickerMonth();

                    // clear out all tr instances other than the header row
                    // really just removing all rows and appending header row straight back in
                    var headerRow = `
     <tr id="date-picker-weekdays">
       <th>S</th>
       <th>M</th>
       <th>T</th>
       <th>W</th>
       <th>T</th>
       <th>F</th>
       <th>S</th>
     </tr>`;
                    // clear all rows
                    datePicker.contents().remove();
                    datePicker.append(headerRow);

                    var todayDate = curDate.getDate();
                    var firstOfMonth = new Date(
                            curDate.getFullYear(),
                            curDate.getMonth(),
                            1
                            );
                    var firstWeekday = firstOfMonth.getDay(); // 0-indexed; 0 is Sunday, 6 is Saturday
                    var lastMonthToInclude = firstWeekday; // happily, this just works as-is.
                    var firstOfNextMonth = addMonths(firstOfMonth, 1);
                    var lastOfMonth = addDays(firstOfNextMonth, -1).getDate();

                    var openRow = "<tr class='date-picker-calendar-row'>";
                    var closeRow = "</tr>";
                    var currentRow = openRow;

                    // Add in as many of last month as required
                    if (lastMonthToInclude > 0) {
                        var lastMonthLastDay = addDays(firstOfMonth, -1);
                        var lastMonthDays = lastMonthLastDay.getDate();
                        var lastMonthStartAdding = lastMonthDays - lastMonthToInclude + 1;

                        // add days from previous month
                        // takes arguments (start loop, end loop <=, counter, 'true' if current month OR class if another month (optional, default "") )
                        //addToCalendar(lastMonthStartAdding, lastMonthDays, 0, "previous-month");
                        //addToCalendar(lastMonthStartAdding, lastMonthDays, 0, "month-previous");
                        addToCalendar(
                                lastMonthStartAdding,
                                lastMonthDays,
                                0,
                                "previous-month"
                                );
                    }

                    // fill out rest of row with current month
                    // doesn't matter how many of last month were included, all accounted for
                    addToCalendar(1, 7 - lastMonthToInclude, lastMonthToInclude, true);

                    // reset for current month generation
                    currentRow = openRow;

                    var counter = 7;
                    var addedFromCurrentMonth = 7 - firstWeekday + 1;

                    addToCalendar(addedFromCurrentMonth, lastOfMonth, counter, true);

                    // at this point, counter = all of this month + whatever was included from last month
                    counter = lastMonthToInclude + lastOfMonth;
                    var nextMonthToInclude = counter % 7 === 0 ? 0 : 7 - (counter % 7);

                    addToCalendar(1, nextMonthToInclude, counter, "next-month");

                    // add event listener again
                    applyDateEventListener();

                    // update current date box
                    updateDateShown();

                    // functions scoped to this outer function
                    //############################################################
                    function checkChangedMonth() {
                        // updates if changed month directly (changeMonth) or if switched to other .date-picker-date and month is different (differentMonth)
                        var differentMonth = false;
                        // checks if it's the same date again
                        if (currentDate !== previousDate) {
                            // if either month or year are different then month has changed
                            if (
                                    dates[0].getMonth() !== dates[1].getMonth() ||
                                    dates[0].getYear() !== dates[1].getYear()
                                    ) {
                                differentMonth = true;
                            }
                        }

                        return differentMonth;
                    }

                    function addToCalendar(start, end, counter, cellClass) {
                        var currentMonth = cellClass === true ? true : false;

                        for (var i = start; i <= end; i++) {
                            counter += 1;
                            if (i === todayDate && currentMonth) {
                                currentRow += `<td class="active">${i}</td>`;
                            } else if (cellClass && !currentMonth) {
                                currentRow += `<td class="${cellClass}">${i}</td>`;
                            } else {
                                currentRow += `<td>${i}</td>`;
                            }
                            if (counter % 7 === 0) {
                                datePicker.append(currentRow + closeRow);
                                currentRow = openRow;
                            }
                        }
                }
                }

                function updatePickerMonth() {
                    var monthName = monthFormatter.format(dates[currentDate]);
                    var year = dates[currentDate].getFullYear();
                    var dateText = monthName + " " + year;
                    $("#date-picker-month").text(dateText);
                }

                function dateSelected(currentDay) {
                    // update the active .date-picker-date with the current date
                    var activeDate = $($(".date-picker-date.active")[0]);

                    // get current date and update
                    dates[currentDate].setDate(currentDay);
                    updateDateShown();
                }

                // 'direction' can be either "Next" or "Previous"
                function changeMonth(direction) {
                    var increment = direction === "Next" ? 1 : -1;

                    // change month
                    dates[currentDate] = addMonths(dates[currentDate], increment);

                    // change month name in picker
                    updatePickerMonth();

                    // update calendar
                    // passes 'true' that month has changed
                    updateDatePicker(true);
                }

                function showDatePicker(e) {
                    var pxFromTop = $(".date-picker-date").offset().top;
                    var datePicker = $("#date-picker-modal");
                    datePicker.css("top", pxFromTop + 40);
                    // check if right edge of colourPicker will go off the edge of the screen, and if so then reduce left by that amount
                    var rightEdge = e.pageX + colourPickerWidth;
                    var overflowWidth = rightEdge - windowWidth;
                    if (overflowWidth > 0) {
                        datePicker.css("left", e.pageX - overflowWidth);
                    } else {
                        datePicker.css("left", e.pageX);
                    }

                    $("#date-picker-modal").removeClass("hidden-2");
                }

                function hideDatePicker() {
                    $(".date-picker-date").removeClass("active");
                    $("#date-picker-modal").addClass("hidden-2");
                }

                function applyDateEventListener() {
                    $("#date-picker td").click(function () {
                        // Calendar UI
                        $("#date-picker td").removeClass("active");
                        $(this).addClass("active");

                        // update variables
                        currentDay = $(this).text();

                        // update the current date
                        dateSelected(currentDay);

                        // change month based on calendar day class
                        if ($(this).hasClass("previous-month")) {
                            changeMonth("Previous");
                        } else if ($(this).hasClass("next-month")) {
                            changeMonth("Next");
                        } else {
                            // clicked in current month; made selection so hide picker again
                            hideDatePicker();
                        }
                    });
                }

                // Utilities
                //################################################################
                // set location for date picker
                $(document).ready(function () {
                    updateWidths();
                });

                $(window).resize(function () {
                    updateWidths();
                });

                function updateWidths() {
                    windowWidth = $(window).width();
                }

                // courtesy of https://stackoverflow.com/questions/563406/add-days-to-javascript-date
                function addDays(date, days) {
                    var result = new Date(date);
                    result.setDate(result.getDate() + days);
                    return result;
                }

                function addMonths(date, months) {
                    var result = new Date(date);
                    result.setMonth(result.getMonth() + months);
                    return result;
                }

                // courtesy of https://stackoverflow.com/a/15764763/7170445
                function getDateString(date) {
                    var year = date.getFullYear();

                    var month = (1 + date.getMonth()).toString();
                    month = month.length > 1 ? month : "0" + month;

                    var day = date.getDate().toString();
                    day = day.length > 1 ? day : "0" + day;

                    return day + "/" + month + "/" + year;
                }

                function updateDateShown() {
                    var formattedDate = getDateString(dates[currentDate]);
                    var updateDateBox = $(datesBoxes[currentDate]);

                    var updateDisplayBox = $(displayBoxes[currentDate]);
                    var dayAndMonth =
                            dates[currentDate].getDate() +
                            " " +
                            monthFormatter.format(dates[currentDate]).slice(0, 3);

                    updateDateBox.text(formattedDate);
                    updateDisplayBox.text(dayAndMonth);
                }
                var i = 0;
                function showme() {
                    if (i == 0) {
                        document.getElementById("divdate").style.display = "none";
                        i++;
                    } else {
                        document.getElementById("divdate").style.display = "block";
                        i = 0;
                    }
                }
                var j = 0;
                function showme2() {
                    if (j == 0) {
                        document.getElementById("divroom").style.display = "none";
                        j++;
                    } else {
                        document.getElementById("divroom").style.display = "block";
                        j = 0;
                    }
                }
                var k = 0;
                function showme3() {
                    if (k == 0) {
                        document.getElementById("divfiltre").style.display = "none";
                        k++;
                    } else {
                        document.getElementById("divfiltre").style.display = "block";
                        k = 0;
                    }
                }
                var l = 0;
                function showme4() {
                    if (l == 0) {
                        document.getElementById("divpromo").style.display = "none";
                        l++;
                    } else {
                        document.getElementById("divpromo").style.display = "block";
                        l = 0;
                    }
                }

</script>

</body>
</html>
