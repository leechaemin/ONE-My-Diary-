<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mainPage</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="./resources/ckeditor/ckeditor.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="./topmenu.jsp" %>
<br><br>
<div class="main_brd">
	<div class="row">
		<div class="top col-md-8">
			<c:forEach var="fv" items="${main_img_list}">
			<div class="col-md-4">
				<div class="panel panel-default" style="height: 500px;">
					<div class="panel-body text-center" >
						<h4><strong>${fv.img_date}</strong></h4>
						<h4>${fv.img_title}<h4>
						
						<img src="${fv.img}" class="img-responsive img-rounded">
					</div>
				</div>
			</div>
			</c:forEach>	
		</div>
		<div class="col-md-4">
	  		<%@ include file="./login.jsp" %> 
		</div>  
	</div>
</div>	
	<div class="footer">
		<p>COPYRIGHT ⒞ BY VOLG.CHAEMIN.COM.</p>
	</div>
	
</body>
</html>