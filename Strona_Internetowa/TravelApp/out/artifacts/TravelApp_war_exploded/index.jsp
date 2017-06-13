<%--
  Created by IntelliJ IDEA.
  User: Marysia
  Date: 13.06.2017
  Time: 00:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <link href = style.css rel="stylesheet">
    <title>Strona główna</title>
  </head>
  <body onload="mapaStart()">
<div class="pasek">
    <navi>
        <ul>
            <li><a href="index.jsp">Strona główna</a></li>
            <li><a href="addpost.html">Dodaj post</a></li>
            <li> <a href ="post.html">Twoje posty</a></li>
            <li><a href="galeria.html">Twoja galeria</a></li>
            <li><a href="userpanel.html">Twoje konto</a></li>
            <li><a href="logowanie.html">Wyloguj sie</a></li>
        </ul>
    </navi>


</div>

<div id="map"> Mapa </div>



<footer>Maria Czak-Żukowska, Katarzyna Pyznarska, Maciej Tymoszuk</footer>

  <script async defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9FXQ1bzM8Yf_xq0TbqaPCIr1SzE6pbTM&callback=initMap"></script>
  <script script async src="script.js" type="text/javascript"></script>


  </body>
</html>
