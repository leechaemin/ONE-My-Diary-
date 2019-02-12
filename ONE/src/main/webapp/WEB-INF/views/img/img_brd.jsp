<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>img_brd.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="./resources/ckeditor/ckeditor.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<%@ include file="../main/topmenu.jsp" %>
	<div class="row " align="center">
		<input type="button" class="btn btn-danger" value="업로드" id="goImgPop" name="goImgPop"/>
	</div>
<br><br>
<div class="container">
	<div class="row">
		<c:forEach var="vv" items="${img_brd_list}">
			<div class="col-md-3">
				<div class="panel panel-default" style="height: 500px;">
					<div class="panel-body text-center" >
						<h4><strong>${vv.img_date}<strong></h4>
						<h4>${vv.img_title}</h4>
						<img src="${vv.img}" class="img-responsive img-rounded">
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#goImgPop").click(function() {
				 window.open("./img_pop","", "width=400,height=400,left=600");
			});
		});
	</script>




<!-- footer -->
	<div class="footer">
		<p>COPYRIGHT ⒞ BY VOLG.CHAEMIN.COM.</p>
	</div>
</body>
</html>