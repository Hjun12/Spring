<%@ include file="../include/header.jspf"%>
<style>
.id_ok {
	color: #fff;
	display: none;
}

.id_already {
	color: #6A82FB;
	display: none;
}
</style>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb__links">
					<a href="./index.html"><i class="fa fa-home"></i> Home</a> <a
						href="./categories.html">movie register</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb End -->

<!-- Anime Section Begin -->
<style>
body {
	background-color: lightblue;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#submit").on("click", function() {

			if ($("#contentsid").val() == "") {
				alert("CONTENTSID를 입력하세요.");
				$("#contentsid").focus();
				return false;
			}
			var idChkVal = $("#idChk").val();
			if (idChkVal == "N") {
				alert("중복확인 버튼을 눌러주세요.");
				return false;
			}

			if ($("#contentstitle").val() == "") {
				alert("CONTENTSTITLE를 입력하세요.");
				$("#contentstitle").focus();
				return false;
			}
			if ($("#contentssummary").val() == "") {
				alert("CONTENTSSUMMARY를 입력하세요.");
				$("#contentssummary").focus();
				return false;
			}
			if ($("#contentsstart").val() == "") {
				alert("CONTENTSSTART를 입력하세요.");
				$("#contentsstart").focus();
				return false;
			}
			if ($("#contentsseason").val() == "") {
				alert("CONTENTSSEASON를 입력하세요.");
				$("#contentsseason").focus();
				return false;
			}
			if ($("#contentsepisode").val() == "") {
				alert("CONTENTSEPISODE를 입력하세요.");
				$("#contentsepisode").focus();
				return false;
			}
			if ($("#contentsscore").val() == "") {
				alert("CONTENTSSCORE를 입력하세요.");
				$("#contentsscore").focus();
				return false;
			}
			if ($("#contentsduration").val() == "") {
				alert("CONTENTSDURATION를 입력하세요.");
				$("#contentsduration").focus();
				return false;
			} else
				alert("영상물 입력되었습니다.");
		});

	})
	function fn_idChk() {
		$.ajax({
			url : "/movie/idChk",
			type : "post",
			dataType : "json",
			data : {
				"contentsid" : $("#contentsid").val()
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디입니다.");
					$("#idChk").attr("value", "N");
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
</script>


<section class="anime-details spad">
	<div class="container-fluid" fontcolor="white">
		<form action="/movie/insertmovie" method="post">
			<div class="row">
				<div class="col-md-2">
					CONTENTSID</br> <input type="text" name="contentsid" id="contentsid"
						placeholder="NUMBER(4,0)">
					<button class="idChk" type="button" id="idChk"
						onclick="fn_idChk();" value="N">중복확인</button>
				</div>
				<div class="col-md-2">
					NATIONCODE</br> <select name="nationcode" id="nationcode">
						<option value="KR" selected>KR</option>
						<option value="US">US</option>
						<option value="JP">JP</option>
					</select>
				</div>
				<div class="col-md-2">
					OTTID</br> <select name="ottid" id="ottid">
						<option value="1" selected>Netfilx</option>
						<option value="2">Disable</option>
						<option value="3">Disable</option>
					</select>
				</div>
				<div class="col-md-2">
					GRADEID</br> <select name="gradeid" id="gradeid">
						<option value="19" selected>19</option>
						<option value="15">15</option>
						<option value="12">12</option>
						<option value="7">7</option>
						<option value="ALL">ALL</option>
					</select>
				</div>
				<div class="col-md-2">
					CLASSID</br> <select name="classid" id="classid">
						<option value="1" selected>영화</option>
						<option value="2">애니</option>
						<option value="3">드라마</option>
						<option value="4">다큐</option>
						<option value="5">예능</option>
					</select>
				</div>
				<div class="col-md-2">
					CONTENTSTITLE</br> <input type="text" name="contentstitle"
						id="contentstitle" placeholder="영상 제목">
				</div>
			</div>
			<br /> <br /> <br />
			<div class="row">
				<div class="col-md-2">
					CONTENTSSUMMARY</br> <input type="text" name="contentssummary"
						id="contentssummary" placeholder="줄거리 요약">
				</div>
				<div class="col-md-2">
					CONTENTSSTART</br>
					<!-- <input type="date" max="9999-12-31" name="contentsstart"
						id="contentsstart" placeholder="DATE" format="yy/mm/dd" max="99-12-31"> -->
					<input type="text" name="contentsstart" id="contentsstart"
						placeholder="날짜 ? yy/mm/dd">
				</div>
				<div class="col-md-2">
					CONTENTSSEASON</br> <input type="text" name="contentsseason"
						id="contentsseason" placeholder="시즌이 몇개 ?">
				</div>
				<div class="col-md-2">
					CONTENTSEPISODE</br> <input type="text" name="contentsepisode"
						id="contentsepisode" placeholder="에피소드가 몇개 ?">
				</div>
				<div class="col-md-2">
					CONTENTSSCORE</br> <input type="text" name="contentsscore"
						id="contentsscore" placeholder="평점 ?">
				</div>
				<div class="col-md-2">
					CONTENTSDURATION</br> <input type="text" name="contentsduration"
						id="contentsduration" placeholder="러닝타임 ?">
				</div>
			</div>
			<button class="btn btn-success" type="submit" id="submit">Register</button>
			<a class="btn" id="list_btn" href="./selectmovie">목록 페이지</a>
		</form>
	</div>


</section>
<!-- Anime Section End -->
<%@ include file="../include/footer.jspf"%>
