<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tag check</title>
<style>
[class*="fontawesome-"]:before {
	font-family: 'FontAwesome', sans-serif;
}

.form__field {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	margin-bottom: 1rem;
}

.align {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
}

* {
	box-sizing: border-box;
}

html {
	height: 100%;
	width: 100%;
}

body {
	/* background-color: #2c3338; */
	background-color: #FFFFFF;
	color: #606468;
	/* color:#EAEAEA; */
	font: 400 0.875rem/1.5 "Open Sans", sans-serif;
	margin: 0;
	/*   min-height: 100%; */
}

input[type="button"] {
	border-radius: 0.25rem;
	margin-left:110px;
	padding: 1rem;
	background-color: #ea4c88;
	color: #eee;
	font-weight: bold;
	text-transform: uppercase;
}


input[type="button"]:focus, input[type="button"]:hover{
	background-color: #d44179;
}
.site__container {
	-webkit-box-flex: 1;
	-webkit-flex: 1;
	-ms-flex: 1;
	flex: 1;
	padding: 3rem 0;
	height: 50%;
}

input {
	border: 0;
	color: inherit;
	font: inherit;
	margin: 0;
	outline: 0;
	padding: 0;
	-webkit-transition: background-color .3s;
	transition: background-color .3s;
}

.text--center {
	text-align: center;
}

.grid__container {
	margin: 0 auto;
	max-width: 50rem;
	width: 400px;
}

label {
	background-color: #FFCCCC;
	color: white;
	font-weight: bold;
	/*   background-color:#DBDBDB; */
	border-bottom-right-radius: 0;
	border-top-right-radius: 0;
	padding-left: 1.25rem;
	padding-right: 1.25rem;
	border-radius: 0.25rem;
	padding: 1rem;
	margin: 5px;
}

label:focus, label:hover {
	background-color: #ea4c88;
	color: #eee;
	font-weight: bold;
}

:checked+label {
	background-color: #ea4c88;
	color: #eee;
	font-weight: bold;
}
</style>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	function checkOnly(chk) {

		var obj = document.getElementsByName("hash");

		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}

	var checkflag = "false";

	function check(field) {
		if (checkflag == "false") {
			for (i = 0; i < field.length; i++) {
				field[i].checked = true;
			}
			checkflag = "true";
		} else {
			for (i = 0; i < field.length; i++) {
				field[i].checked = false;
			}
			checkflag = "false";
		}
	};
	
	function sendValue(){
		
		var obj = document.getElementsByName("hash");
		var chklen = obj.length;
		var checkList ="";
			// 체크박스의 갯수를 변수에 담는다.
			 
			// 체크박스 갯수만큼 for 문을 돌려 체크된 넘의 value값을 가져온다.
			 for(i=0; i<chklen; i++){
			    if(obj[i].checked == true){
			      checkList+="#"+obj[i].value+" ";
			      
			    }
			  }
			 opener.document.writeForm.tag.value = checkList;
			 window.close();
		}
			 
		
	/* 	var checkList ="";

		for (var i = 0; i < obj.length; i++) {
			if (obj[i].checked == true) {
				opener.document.writeForm.tag.value = document.getElementsByName("hash")[i].value;
				break;
			}
		}
		window.close(); */
	
</script>
</head>
<body class="align">
	  <div class="site__container box-shadow border-round white">
		<div class="grid__container">
			 <form name="tagcheck" method="post" class="form form--login">
			<div class="form__field">
				<input type="checkbox" name="hash" id="tkfkd" value="사랑" 
					style="display: none"> <label id="check" for="tkfkd">#사랑</label>
				<input type="checkbox" name="hash" id="qbxl" value="뷰티" 
					style="display: none"> <label id="check" for="qbxl">#뷰티</label>
				<input type="checkbox" name="hash" id="dnwjd" value="우정" 
					style="display: none"> <label id="check" for="dnwjd">#우정</label>
				<input type="checkbox" name="hash" id="dugod" value="여행" 
					style="display: none"> <label id="check" for="dugod">#여행</label>
				<input type="checkbox" name="hash" id="djsdj" value="언어" 
					style="display: none"> <label id="check" for="djsdj">#언어</label>
			</div>

			<div class="form__field">
				<input type="checkbox" name="hash" id="dmatlr" value="음식" style="display:none">
				<label for="dmatlr">#음식</label>
				 <input type="checkbox" name="hash" id="votus" value="패션" style="display:none">
				<label for="votus">#패션</label>
				<input type="checkbox" name="hash" id="dbaj" value="유머" style="display:none">
				<label for="dbaj">#유머</label>
				<input type="checkbox" name="hash" id="dmlfy" value="건강" style="display:none">
				<label for="dmlfy">#건강</label>
				<input type="checkbox" name="hash" id="rpdla" value="게임" style="display:none">
				<label for="rpdla">#게임</label>
			</div>
			
			<div class="form__field">
				 <input type="checkbox" name="hash" id="gkrry" value="학교" style="display:none">
				<label for="gkrry">#학교</label>
				 <input type="checkbox" name="hash" id="gosemvhs" value="핸드폰" style="display:none">
				<label for="gosemvhs">#핸드폰</label>
				<input type="checkbox" name="hash" id="tkwls" value="사진" style="display:none">
				<label for="tkwls">#사진</label>
				<input type="checkbox" name="hash" id="dodhksehdanf" value="애완동물" style="display:none">
				<label for="dodhksehdanf"> #애완동물 </label>				
			</div>
			
			<div class="form__field">
				<input type="checkbox" name="hash" id="dkrtptjfl" value="악세서리" style="display:none">
				<label for="dkrtptjfl">#악세서리</label>
				<input type="checkbox" name="hash" id="cnlal" value="취미" style="display:none">
				<label for="cnlal">#취미</label>
				<input type="checkbox" name="hash" id="dmadkr" value="음악" style="display:none">
				<label for="dmadkr">#음악</label>
				<input type="checkbox" name="hash" id="ck" value="차" style="display:none">
				<label for="ck">#차</label>
				<input type="checkbox" name="hash" id="Rna" value="꿈" style="display:none">
				<label for="Rna">#꿈</label>
			
				
			</div>
				
			<div class="form__field">
				<input type="checkbox" name="hash" id="ehtj" value="도서" style="display:none">
				<label for="ehtj">#도서</label>
				<input type="checkbox" name="hash" id="ehs" value="돈" style="display:none">
				<label for="ehs">#돈</label>
				<input type="checkbox" name="hash" id="epdlffl" value="데일리" style="display:none">
				<label for="epdlffl">#데일리</label>
				<input type="checkbox" name="hash" id="ansghktodghkf" value="문화생활" style="display:none">
				<label for="ansghktodghkf">#문화생활</label>
			</div>
			
			<div class="form__field">
				<input type="checkbox" name="hash" id="todghkfdydvna" value="생활용품" style="display:none">
				<label for="todghkfdydvna">#생활용품</label>
				<input type="checkbox" name="hash" id="zkvp" value="카페" style="display:none">
				<label for="zkvp">#카페</label>
				<input type="checkbox" name="hash" id="dmawn" value="음주" style="display:none">
				<label for="dmawn">#음주</label>
				<input type="checkbox" name="hash" id="skfTl" value="날씨" style="display:none">
				<label for="skfTl">#날씨</label>
			</div>
			
			<div class="form__field">
				<input type="checkbox" name="hash" id="tv" value="TV" style="display:none">
				<label for="tv">#TV</label>
				<input type="checkbox" name="hash" id="rkwhr" value="가족" style="display:none">
				<label for="rkwhr">#가족</label>
				<input type="checkbox" name="hash" id="dPtnf" value="예술" style="display:none">
				<label for="dPtnf">#예술</label>
				<input type="checkbox" name="hash" id="dusdPdls" value="연예인" style="display:none">
				<label for="dusdPdls">#연예인</label>
				<input type="checkbox" name="hash" id="cnrwp" value="축제" style="display:none">
				<label for="cnrwp">#축제</label>
				
			</div>
			<input type="hidden" name="email" value="${c.email}">
			
<!-- 			<input type="submit" value=" MODIFY HASHTAG "> -->
			<input id="checkButton" type="button" name="Submit" value="확인" onClick="sendValue()">

			</form>
		</div>
	</div>

</body>
</html>