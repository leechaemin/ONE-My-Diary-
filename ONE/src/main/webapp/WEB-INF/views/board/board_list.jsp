<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>board_list</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/js/main.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<%@ include file="../main/topmenu.jsp" %>
	<h2 align="center">§ Diary §</h2>
	<form class="board_list" >
		<div align="center">
			<table border="1" class="board table table-hover" >
			<colgroup>
				<col width="50px">
				<col width="200px">
				<col width="100px">
				<col width="200px">
				<col width="100px">
				<col width="60px">	
				<col width="50px">	
			</colgroup>
			<thead>
				<tr align="center">
					<th>NO</th>
					<th>제목</th>
					<th>작성자</th>
					<th>내용</th>
					<th>작성일</th>	
					<th>조회수</th>
					<th><font color="red">♥</th>	
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vv" items="${brd_free_list}" varStatus="status" >
					<tr>
					 	<td align="center">${vv.brd_no}</td>
<%-- 					 	<td align="center">${status.index}</td> --%>
						<td><a href="./board_detail?brd_no=${vv.brd_no}">${vv.brd_title}</a></td>
						<td>${vv.brd_writer}</td>
						<td>${vv.brd_contents}</td>
						<td>${vv.brd_write_date}</td>
						<td>${vv.brd_view_cnt}</td>
						<td>${vv.brd_like_cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
	</form>
	<div align="center">
		<c:forEach begin="1" end="${pagingEnd}" step="1" varStatus="pages" >  
			<a href="./board_list?page=${pages.index}">${pages.index}</a>
		</c:forEach>	
	</div>
	<div class="go_board_write" align="center">
		<a href="./board_write"><button class="btn btn-danger">글 작성</button></a>
	</div>
	<!-- footer -->
	<div class="footer">
		<p>COPYRIGHT ⒞ BY VOLG.CHAEMIN.COM.</p>
	</div>
</body>
</html>