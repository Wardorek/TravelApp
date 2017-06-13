var users = new Array("user1", "user2", "user3");
var passwords = new Array("kod1", "kod2", "kod3");

function sprawdz_haslo(user, pass)
{
    for(var i = 0; i < users.length; i++){
        if((user == users[i]) && (pass == passwords[i]))
            return true;
    }
    return false;
}
function check()
{
    var user = document.logowanie.user.value;
    var pass = document.logowanie.pass.value;
    if(!sprawdz_haslo(user, pass)){
        alert('Niepoprawne hasło!');
    }
    else{
        document.location.href = "userpanel.html";
    }
}

var map;
function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 52.356, lng: 19.002},
        zoom: 5
    });

}

function dodajMarker(opcjeMarkera)
{
    opcjeMarkera.map = mapa;
    var marker = new google.maps.Marker(opcjeMarkera);
}

function mapaStart()
{
    var wspolrzedne = new google.maps.LatLng(53.41935400090768,14.58160400390625);
    var opcjeMapy = {
        zoom: 10,
        center: wspolrzedne,
        mapTypeId: google.maps.MapTypeId.SATELLITE
    };
    mapa = new google.maps.Map(document.getElementById("map"), opcjeMapy);

    // wspólne cechy ikon
    var rozmiar = new google.maps.Size(32,32);
    var rozmiar_cien = new google.maps.Size(59,32);
    var punkt_startowy = new google.maps.Point(0,0);
    var punkt_zaczepienia = new google.maps.Point(16,16);

    // ikonki
    var ikona1 = new google.maps.MarkerImage("http://maps.google.com/mapfiles/kml/pal2/icon38.png", rozmiar, punkt_startowy, punkt_zaczepienia);
    var ikona2 = new google.maps.MarkerImage("http://maps.google.com/mapfiles/kml/pal4/icon23.png", rozmiar, punkt_startowy, punkt_zaczepienia);
    var ikona3 = new google.maps.MarkerImage("http://maps.google.com/mapfiles/kml/pal3/icon13.png", rozmiar, punkt_startowy, punkt_zaczepienia);

    var cien1 = new google.maps.MarkerImage("http://maps.google.com/mapfiles/kml/pal2/icon38s.png", rozmiar_cien, punkt_startowy, punkt_zaczepienia);
    var cien2 = new google.maps.MarkerImage("http://maps.google.com/mapfiles/kml/pal4/icon23s.png", rozmiar_cien, punkt_startowy, punkt_zaczepienia);
    var cien3 = new google.maps.MarkerImage("http://maps.google.com/mapfiles/kml/pal3/icon13s.png", rozmiar_cien, punkt_startowy, punkt_zaczepienia);

    dodajMarker({position: new google.maps.LatLng(53.4203,14.7011), title: 'Restauracja #1', icon: ikona1, shadow: cien1});
    dodajMarker({position: new google.maps.LatLng(53.3902,14.7202), title: 'Restauracja #2', icon: ikona1, shadow: cien1});
    dodajMarker({position: new google.maps.LatLng(53.4101,14.6033), title: 'Myjnia', icon: ikona2, shadow: cien2});
    dodajMarker({position: new google.maps.LatLng(53.4014,14.5104), title: 'Tu byłem 6 razy', icon: ikona3, shadow: cien3});

}