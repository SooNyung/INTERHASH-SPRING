<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tag check</title>
<script type="text/javascript">
	function checkOnly(chk) {

		var obj = document.getElementsByName("favorite");

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
		var a = "asfasdf";
		//alert(document.tagcheck.val.value);
		//opener.document.fo.aaaaa.value = document.tagcheck.favorite.value;
		var obj = document.getElementsByName("favorite");

		for (var i = 0; i < obj.length; i++) {
			if (obj[i].checked == true) {
				opener.document.writeForm.tag.value = document.getElementsByName("favorite")[i].value;
				break;
			}
		}
		//opener.document.fo.aaaaa.value = document.getElementsByName("favorite")[0].value;
		/* self.opener = self; */
		window.close();
	}
	
</script>
</head>
<body class="align">
	  <div class="site__container box-shadow border-round white">
		<div class="grid__container">
			<h1>Please check your HASHTAG!</h1>
			 <form name="tagcheck" method="post" class="form form--login">
			<div class="form__field">
				<input type="checkbox" name="hash" id="tkfkd" value="사랑" onClick="javascript:checkOnly(this);"
					style="display: none"> <label id="check" for="tkfkd">#사랑</label>
				<input type="checkbox" name="hash" id="qbxl" value="뷰티" onClick="javascript:checkOnly(this);"
					style="display: none"> <label id="check" for="qbxl">#뷰티</label>
				<input type="checkbox" name="hash" id="dnwjd" value="우정" onClick="javascript:checkOnly(this);"
					style="display: none"> <label id="check" for="dnwjd">#우정</label>
				<input type="checkbox" name="hash" id="dugod" value="여행" onClick="javascript:checkOnly(this);"
					style="display: none"> <label id="check" for="dugod">#여행</label>
				<input type="checkbox" name="hash" id="djsdj" value="언어" onClick="javascript:checkOnly(this);"
					style="display: none"> <label id="check" for="djsdj">#언어</label>
			</div>

			<div class="form__field">
				<input type="checkbox" name="hash" id="dmatlr" value="음식" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="dmatlr">#음식</label>
				 <input type="checkbox" name="hash" id="votus" value="패션" onClick="javascript:checkOnly(this);"style="display:none">
				<label for="votus">#패션</label>
				<input type="checkbox" name="hash" id="dbaj" value="유머" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="dbaj">#유머</label>
				<input type="checkbox" name="hash" id="dmlfy" value="건강" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="dmlfy">#건강</label>
				<input type="checkbox" name="hash" id="rpdla" value="게임" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="rpdla">#게임</label>
			</div>
			
			<div class="form__field">
				 <input type="checkbox" name="hash" id="gkrry" value="학교" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="gkrry">#학교</label>
				 <input type="checkbox" name="hash" id="gosemvhs" value="핸드폰" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="gosemvhs">#핸드폰</label>
				<input type="checkbox" name="hash" id="tkwls" value="사진" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="tkwls">#사진</label>
				<input type="checkbox" name="hash" id="dodhksehdanf" value="애완동물" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="dodhksehdanf"> #애완동물 </label>				
			</div>
			
			<div class="form__field">
				<input type="checkbox" name="hash" id="dkrtptjfl" value="악세서리" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="dkrtptjfl">#악세서리</label>
				<input type="checkbox" name="hash" id="cnlal" value="취미" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="cnlal">#취미</label>
				<input type="checkbox" name="hash" id="dmadkr" value="음악" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="dmadkr">#음악</label>
				<input type="checkbox" name="hash" id="ck" value="차" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="ck">#차</label>
				<input type="checkbox" name="hash" id="Rna" value="꿈" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="Rna">#꿈</label>
			
				
			</div>
				
			<div class="form__field">
				<input type="checkbox" name="hash" id="ehtj" value="도서" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="ehtj">#도서</label>
				<input type="checkbox" name="hash" id="ehs" value="돈" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="ehs">#돈</label>
				<input type="checkbox" name="hash" id="epdlffl" value="데일리" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="epdlffl">#데일리</label>
				<input type="checkbox" name="hash" id="ansghktodghkf" value="문화생활" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="ansghktodghkf">#문화생활</label>
			</div>
			
			<div class="form__field">
				<input type="checkbox" name="hash" id="todghkfdydvna" value="생활용품" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="todghkfdydvna">#생활용품</label>
				<input type="checkbox" name="hash" id="zkvp" value="카페" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="zkvp">#카페</label>
				<input type="checkbox" name="hash" id="dmawn" value="음주" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="dmawn">#음주</label>
				<input type="checkbox" name="hash" id="skfTl" value="날씨" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="skfTl">#날씨</label>
			</div>
			
			<div class="form__field">
				<input type="checkbox" name="hash" id="tv" value="TV" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="tv">#TV</label>
				<input type="checkbox" name="hash" id="rkwhr" value="가족" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="rkwhr">#가족</label>
				<input type="checkbox" name="hash" id="dPtnf" value="예술" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="dPtnf">#예술</label>
				<input type="checkbox" name="hash" id="dusdPdls" value="연예인" onClick="javascript:checkOnly(this);" style="display:none">
				<label for="dusdPdls">#연예인</label>
				<input type="checkbox" name="hash" id="cnrwp" value="축제" onClick="javascript:checkOnly(this);" style="display:none">
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