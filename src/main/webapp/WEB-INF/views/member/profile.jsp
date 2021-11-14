<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cancle").on("click", function() {

			location.href = "/";

		})
		
		
		$("#submit").on("click", function() {
			
			if ($("#userpassword").val() == "") {
				alert("변경할 비밀번호를 입력해주세요.");
				$("#userpassword").focus();				
				return false;			
			}		 
			else{
				alert("변경 되었습니다.");
			}
		})
		
		$("#farewell").on("click", function() {
			if ($("#userpassword1").val() == "") {
				alert("기존 비밀번호를 입력해주세요.");
				$("#userpassword1").focus();
				return false;
			}
			$.ajax({
				url : "/member/passChk",
				type : "POST",
				dateType : "json",
				data : $("#delForm").serializeArray(),
				success : function(data) {

					if (data == true) {
						if (confirm("탈퇴 하시겠습니까?")) {
							alert("탈퇴 되었습니다.");
							$("#delForm").submit();
						}
					} else {
						alert("패스워드가 틀렸습니다.");
						return;
					}
				}
			})

		});

	})
</script>
<body>
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="../resources/img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>회원 정보.</h2>
						<p>회원 정보를 수정합니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<!-- Login Section Begin -->
	<section class="login spad" id="container">
		<div class="container-fulid">
			<div class="row">
				<div class="col-lg-6">
					<div class="login__form">
						<h3>비밀번호 변경</h3>
						<!-- <section id="container"> -->
						<form action="/member/memberUpdate" method="post">
							<div class="input__item">
								<input class="form-control" type="text" id="useremail"
									name="useremail" readonly value="${ login.useremail }" /> <span
									class="icon_mail"></span>
							</div>
							<div class="input__item">
								<input class="form-control" type="password" id="userpassword"
									name="userpassword" placeholder="Enter New Password" /> <span
									class="icon_lock"></span>
							</div>
							<div class="form-group has-feedback">
							<button class="btn btn-success"  id="submit">회원정보수정</button>
							<button class="btn btn-success" type="button">취소</button>
						</div>							
						</form>
						
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login__register">
						<!-- <h3>비밀번호를 잊으셨나요 ?</h3>
						<a href="#" class="primary-btn">비밀번호 찾기</a>
					</div>
					<section class="login spad" id="container">
						<div class="container-fulid">
							<div class="row">
								<div class="col-lg-6"> -->
						<div class="login__form">							
							<form id="delForm" action="/member/memberDelete" method="post">
								<div class="login__register">
									<h3>회원 탈퇴하기</h3>
								</div>
								<div class="input__item">
									<input class="form-control" type="text" id="useremail"
										name="useremail" readonly value="${ login.useremail }" /> <span
										class="icon_mail"></span>
								</div>
								<div class="input__item">
									<input class="form-control" type="password" id="userpassword1"
										name="userpassword" placeholder="Enter Current Password" /> <span
										class="icon_lock"></span>
								</div>
								<div class="login__register">

									<button class="primary-btn" type="button" id="farewell">
										회원 탈퇴하기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- 
				</div>
			</div>
		</div>
	</section> -->
	<!-- Login Section End -->


	<%@ include file="../include/footer.jspf"%>