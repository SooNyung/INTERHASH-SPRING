<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하고 목록으로 표출하기</title>
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#111;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:280px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 200, 1);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F4F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}

</style>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
  
</div>
<p id="result"></p>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9ee99f6f7e29a9a2459e7218773c63fe&libraries=services"></script>
<script>
// 마커를 담을 배열입니다

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new daum.maps.LatLng(${latitude}, ${longtitude}), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(${latitude}, ${longtitude}); 

//마커를 생성합니다
var marker = new daum.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

(function(marker, ${maptitle}) {
    daum.maps.event.addListener(marker, 'mouseover', function() {
        displayInfowindow(marker, ${maptitle});
    });

    daum.maps.event.addListener(marker, 'mouseout', function() {
        infowindow.close();
    });
  

    itemEl.onmouseover =  function () {
        displayInfowindow(marker, ${maptitle});
    };

    itemEl.onmouseout =  function () {
        infowindow.close();
    };
})(marker, ${maptitle});


function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);    
}
//아래 코드는 지도 위의 마커를 제거하는 코드입니다
//marker.setMap(null);    

</script>
</body>
</html>