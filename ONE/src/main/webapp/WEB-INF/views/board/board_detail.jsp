<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>board_detail.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#del_brd").click(function() {
			var goYN = confirm("글을 삭제 하시겠습니까?");
			if(goYN == false){
				return;
				
			}
			
			$.get(
				"./del_brd"
				,{brd_no :$("#brd_no").val()}
				, function(data,status) {
					if(status == "success"){
						if(data > 0){
							alert("삭제가 되었습니다.");
							location.href="./board_list";
						}else {
							alert("잠시후, 다시 시도해주세요");
						}
					}
				}
			)//get
		})//click
		$("#upd_brd").click(function() {
			location.href="./board_update?brd_no="+$("#brd_no").val();
		})
		
		
		$("#brdLikeBtn").click(function(){
			$.get(
					"./brd_like_btn"
					,{no : $("#brd_no").val()}
					, function(data,status){
						if(status == "success"){
							if(data > 0){
								tmpCnt = 0;
								if($("#board_like_cnt").text() != ""){
									tmpCnt = parseInt($("#board_like_cnt").text())
								}
								$("#board_like_cnt").text(tmpCnt+1)

							}else {
								alert("잠시후, 다시 시도해주세요");
							}
						}
					})
		});
	})//ready
</script>

<%@ include file="../main/topmenu.jsp" %>
	<h2 align="center">§ Diary §</h2>
	<div class="row" >
	<div class="col-md-6 col-md-offset-3">
		<table border="1" class="table table-hover" >
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<tr>
					<th>NO</th>
					<td>${board_detail_vo.brd_no}</td>
			</tr>
			<tr>
					<th>제목</th>
					<td>${board_detail_vo.brd_title}</td>
			</tr>
			<tr>		
					<th>작성자</th>
					<td>${board_detail_vo.brd_writer}</td>
					
			</tr>
			<tr>
					<th>내용</th>
					<td>${board_detail_vo.brd_contents}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${board_detail_vo.brd_write_date}</td>
			</tr>
			<tr>
				<th>좋아요</th> 
				<td>
					<span id="board_like_cnt">${board_detail_vo.brd_like_cnt}</span>
					<font color="red"><span id="brdLikeBtn"> ♥ </span></font>
				</td>
			</tr>
		</table>
		</div>
		<input type="hidden" id="brd_no" value="${board_detail_vo.brd_no}" />
	</div>
	<br><br>
	
	<div align="center">
		<button class="btn btn-danger" id="upd_brd">게시글 수정</button>
		<button class="btn btn-danger" id="del_brd">게시글 삭제</button>
	</div>


<!-- footer -->
	<div class="footer">
		<p>COPYRIGHT ⒞ BY VOLG.CHAEMIN.COM.</p>
	</div>
</body>
</html>