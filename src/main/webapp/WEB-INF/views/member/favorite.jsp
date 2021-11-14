<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/js/jquery-3.3.1.min.js"></script>

<style>
* {
	box-sizing: border-box;
}

#myInput {
	background-image: url('/css/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myTable {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable th, #myTable td {
	text-align: left;
	padding: 12px;
}

#myTable tr {
	border-bottom: 1px solid #ddd;
}

#signup spad {
	background-color: #f1f1f1;
}

#myTable tr.header, #myTable tr:hover {
	background-color: #f1f1f1;
}

/* 감독 선택 */
#myInput2 {
	background-image: url('/css/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myTable2 {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable2 th, #myTable2 td {
	text-align: left;
	padding: 12px;
}

#myTable2 tr {
	border-bottom: 1px solid #ddd;
}

#myTable2 tr.header, #myTable2 tr:hover {
	background-color: #f1f1f1;
}



</style>

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg"
	data-setbg="../resources/img/normal-breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="normal__breadcrumb__text">
					<h2>선호 항목 입력</h2>
					<p>선호하는 장르를 선택해주세요.</p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Normal Breadcrumb End -->

<!-- Signup Section Begin -->
<section class="signup spad">

	<div class="blog__details__title">
		<h2>선호하는 장르를 선택하세요.</h2>
		</br>
		<h5>
			<font color="white"> <textarea id="genreresult"
					name="genretext" rows="5" cols="33">여기에 장르가 표시됩니다.</textarea>
				<table>
					<tr>
						<c:forEach var="genreservice" items="${genreservice}"
							varStatus="status">
							<c:if test="${status.index%5==0}">
					</tr>
					<tr>
						</c:if>
						<td><font color="white"> 
						<input type="checkbox" name="chBox" class="chBox" 
						id="${genreservice.genrename}" onclick='getGenreValue()' 
						data-genrevalue="genre" data-genrename="${genreservice.genrename}">
						${genreservice.genrename}
						</font></td>
						</c:forEach>
					</tr>
				</table>
			</font>
		</h5>
		<div class="insert">
 <button type="button" class="insert_${genreserive.genrename}_btn" data-genrename="${genreserive.genrename}">등록</button>
 
 <script>
  $(".insert_${genreserive.genrename}_btn").click(function(){
   var confirm_val = confirm("장르를 등록하시겠습니까?");
   console.log("장르 콘솔");
   if(confirm_val) {
	   var checkArr = new Array();
	   $("input[class='chBox']:checked").each(function(){
		    checkArr.push($(this).attr("data-genrename"));
		   });
               
    $.ajax({
     url : "/member/insertfavorite",
     type : "post",
     data : { chbox : checkArr , subject : "genre" , usernum : ${login.usernum} },
     success : function(result){
      if(result == 1) {     
       location.href = "/member/favorite2";
      } else {
       alert("등록 실패");
      }
     }
    });
   } 
  });
 </script>
</div>
	</div>




	

</section>

<script>
function getGenreValue()  {
    // 선택된 목록 가져오기
    const query = 'input[data-genrevalue="genre"]:checked';
    const selectedEls = 
        document.querySelectorAll(query);

    // 선택된 목록에서 value 찾기

    let genreresult = '';
    selectedEls.forEach((el) => {
    	genreresult += el.id + ' ';
    });
    // 출력

    document.getElementById('genreresult').innerText

      = genreresult;

  }

	//체크박스 3개 초과시 알러트
	/* function count_ck(obj) {

		var chkbox = document.getElementsByName("chk");

		var chkCnt = 0;

		for (var i = 0; i < chkbox.length; i++) {

			if (chkbox[i].checked) {

				chkCnt++;

			}

		}

		if (chkCnt > 3) {

			alert("최대 3명까지 가능합니다.");

			obj.checked = false;

			return false;
	
		}
		
		 
		
		
	}*/
</script>
<!-- Signup Section End -->
<%@ include file="../include/footer.jspf"%>