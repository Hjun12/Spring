<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!-- Css Styles -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/plyr.css" type="text/css">
<link rel="stylesheet" href="../resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css">
</head>

<body>

	<!-- Search model Begin -->
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">
				<a href="../main/home" class="icon_close"></a>
			</div>
			<form action="/search/result" class="search-model-form" method="get">
				<input onkeyup="enterkey();" type="text" name='keyword' id="search-input" placeholder="Search here....."value='${cri.keyword}'>
			</form>	
		</div>
	<!-- Search model end -->

	<!-- 서치버튼 -->
	<script>
	$(document).ready(function() {
				
		function enterkey() {
	  	      if (window.event.keyCode == 13) {
	             // 엔터키가 눌렸을 때 실행하는 반응
	  	           $("#search-model-form").submit();
	  	      }
		}

		$('#searchBtn').on( "click", function(event) {
						self.location = "/search/result?"
								+ '${pageMaker.makeQuery(1)}'
								+ "&keyword=" + $('#search-input').val();
		});

	});
	
	<!-- 서치버튼 -->
</script>
