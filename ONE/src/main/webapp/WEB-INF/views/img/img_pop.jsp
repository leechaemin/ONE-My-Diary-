<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/js/main.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row text-center">
				<div class="panel panel-default" style="width: 350px; margin: auto;">
					<div class="panel-body text-center" >
						<form id="formFile">
						<input type="text" id="date1" placeholder="년" size="5" maxlength="4" /> -
						<input type="text" id="date2"  placeholder="월" size="2" maxlength="2" /> -
						<input type="text" id="date3" placeholder="일" size="2" maxlength="2" />
						<br><br>
						<input type="text" id="img_title" name="img_title"  placeholder="제목" size="20"/>
						<br><br>
						<input type="file" id="popFileUp" name="popFileUp" accept="image/*" />
						<br><br>
						<input type="button" value="저장" id="img_pop_btn" name="img_pop_btn" />
						</form>
					</div>
				</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#img_pop_btn").click(function() {
				var img_date = $("#date1").val() +"-"+$("#date2").val()+"-"+$("#date3").val();
				var form1 = new FormData(document.getElementById("formFile"));
				form1.append('img_date',img_date);
				$.ajax({
					url:"./go_img_pop"
					, data:form1
					, dataType:'json'
					, processData:false
					, contentType:false
					, type:'POST'
					, success:function(result){
						if(result > 0){
							alert("글이 저장되었습니다.");
							opener.location.href="./img_brd";
							self.close();
							
						} else {
							alert("잠시 후, 다시 시도해 주세요.");
						}
					}
					, error:function(xhr){
						alert("시스템 관리자에게 문의 바랍니다.");
					}
				});//ajax
			});//click
		});//ready
		
	</script>

</body>
</html>