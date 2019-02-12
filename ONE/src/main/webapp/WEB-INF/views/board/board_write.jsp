<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>board_write.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="./resources/ckeditor/ckeditor.js"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<%@ include file="../main/topmenu.jsp" %>

<script type="text/javascript">	 
	$(document).ready(function() {
		$("#go_ins").click(function() {
			if($.trim($("#title").val())==""){
				alert("제목을 입력하세요.");
				$("#title").focus();
				return;
			}
			if($.trim($("#weather").val()) == ""){
				alert("작성자를 입력하세요.");
				$("#weather").focus();
				return;
			}
			var cnts = CKEDITOR.instances.contents;
			if(cnts.getData() == ""){
				alert("내용를 입력하세요.");
				$("#contents").focus();
				return;
			}
			var goYN = confirm("글을 입력 하시겠습니까?");
			if(goYN == false){
				return;
			}
			
			$.post(
					"./insBoard"
					,{ brd_title : $("#title").val()
						,brd_writer : $("#weather").val()
						,brd_contents : cnts.getData()
					}
					,function(data,status) {
						if(status == "success"){
							if(data > 0){
								alert("글이 저장되었습니다.");
								location.href="./board_list";
								
							}else{
								alert("잠시후, 다시 시도해주세요.");
							}
						} else {
							alert("시스템 관리자에게 문의하세요.");
						}
					}
					
			);//post
					
		})//click
	})//ready

</script>
<h2 align="center">§ Diary §</h2>
	<form action="board_write" >
		<div align="center">
			<table border="1" class="table table-bordered"> 
				<colgroup>
					<col width="200px">
					<col width="700px">
				</colgroup>
				<tr>
					<th>제목</th>
					<td><input type="text" size="90" maxlength="50" id="title" name="title"/></td>
				</tr>
				<tr>
					<th>날씨</th>
					<td><input type="text" size="90" maxlength="10" id="weather" name="weather"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="90" maxlength="1000" id="contents" name="contents"></textarea></td>
					
				</tr>
			</table>
		</div>
	</form>
		<script>
			CKEDITOR.replace('contents',{
				filebrowserUploadUrl:'./ckupload?pgfrm=free'
			});
		</script>
	<br><br>
	<div align="center">
		<button id="go_ins">글 저장</button>	
	</div>
	<div class="footer">
		<p>COPYRIGHT ⒞ BY VOLG.CHAEMIN.COM.</p>
	</div>
</body>
</html>