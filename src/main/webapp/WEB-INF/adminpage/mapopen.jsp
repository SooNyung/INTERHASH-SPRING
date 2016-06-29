<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Ű����� ��Ұ˻��ϰ� ������� ǥ���ϱ�</title>
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'����',sans-serif;font-size:12px;}
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
// ��Ŀ�� ���� �迭�Դϴ�

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
mapOption = { 
    center: new daum.maps.LatLng(${latitude}, ${longtitude}), // ������ �߽���ǥ
    level: 3 // ������ Ȯ�� ����
};

var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

//��Ŀ�� ǥ�õ� ��ġ�Դϴ� 
var markerPosition  = new daum.maps.LatLng(${latitude}, ${longtitude}); 

//��Ŀ�� �����մϴ�
var marker = new daum.maps.Marker({
position: markerPosition
});

//��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
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
//�Ʒ� �ڵ�� ���� ���� ��Ŀ�� �����ϴ� �ڵ��Դϴ�
//marker.setMap(null);    

</script>
</body>
</html>