<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>join_form</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<!-- gl -->
<script type="text/javascript">
	var idChkYN = 0;
	var checkedID = '';
	$(document).ready(function() {
		$("#join_id_chk").click(function(){
			if($.trim($("#join_id").val())== ''){
				alert("아이디를 입력해주세요.");
				$("#join_id").focus();
				return;
			}
			$.post(
					"./idCheck"
					,{
						mbr_id:$("#join_id").val()
					}
					,function(data,status){
						if(status == 'success'){
							if(data > 0){ 
								alert("이미 존재하는 아이디 입니다.");
							}else if(data == 0){
								alert("사용 가능한 아이디 입니다.");
								idChkYN = 1;
								checkedID = $("#join_id").val();
							}
						}else{
							alert("관리자에게 문의바랍니다.");
						}
					}
			);
		});//click

		$("#join_form_go").click(function() {
			if($.trim($("#join_id").val())== ''){
				alert("아이디를 입력해주세요.");
				$("#join_id").focus();
				return;
			}
			if(idChkYN == 0){
				alert("아이디를 체크해주세요.");
				$("#join_id").focus();
				return;
			}
			if($.trim($("#join_id").val()) != checkedID){
				alert("아이디를 다시 확인해주세요.");
				$("#join_id").focus();
				return;
			}
			if($.trim($("#join_nm").val()) == 0 ){
				alert("이름을 입력해 주세요.");
				$("#join_nm").focus();
				return;
			}
			if($.trim($("#join_pwd").val()) == 0 ){
				alert("비밀번호을 입력해 주세요.");
				$("#join_pwd").focus();
				return;
			}
			if($("#join_pwd").val() != $("#join_pwd_chk").val()){
				alert("비밀번호가 서로 다릅니다. 다시 확인해주세요.");
				$("#join_pwd").focus();
				return;
			} 
			if($.trim($("#join_tel1").val()) == 0 ){
				alert("전화번호를 입력해 주세요.");
				$("#join_tel1").focus();
				return;
			}
			if($.trim($("#join_tel2").val()) == 0 ){
				alert("전화번호를 입력해 주세요.");
				$("#join_tel2").focus();
				return;
			}
			if($.trim($("#join_tel3").val()) == 0 ){
				alert("전화번호를 입력해 주세요.");
				$("#join_tel3").focus();
				return;
			}
			if($.trim($("#join_email").val()) == 0 ){
				alert("이메일을 입력해 주세요.");
				$("#join_email").focus();
				return;
			}
			if($.trim($("#email_select").val()) == 0 ){
				alert("이메일 주소를 선택해 주세요.");
				$("#email_select").focus();
				return;
			}

			$.post( //44라인부터 99라인까지의 정보를 담아서 보내야함.
					"./joinins" //← JoinFormController에 만들어.
					,{
						mbr_id : $("#join_id").val()
						,mbr_nm : $("#join_nm").val()
						,mbr_pwd : $("#join_pwd").val()
						,mbr_tel : $("#join_tel1").val()+"-"+$("#join_tel2").val()+"-"+$("#join_tel3").val()
						,mbr_email : $("#join_email").val()
					}
					,function(data,status){
						if(status == "success"){
							if(data > 0){
								alert("회원가입이 되었습니다.");
							}else {
								alert("잠시후, 다시 시도해주세요.");
							}
						}else {
							alert("관리자에게 문의바랍니다.");
						}
					}
			);//post
		});//click
	});//ready
</script>

	<%@ include file="./topmenu.jsp" %>

	<div class="joinForm" align="center">
		<h2>회원가입</h2>	
		<div class="joinFormTable">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" id="join_id" name="join_id" placeholder="영문 30자이내" maxlength="30" /></td>
				</tr>
				<tr>
					<td>아이디 확인(*)</td>
					<td><input type="button" id="join_id_chk" value="아이디 확인(*)" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="join_nm" name="join_nm" placeholder="이름" maxlength="13" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="join_pwd" name="join_pwd" placeholder="영어숫자 8자리이상" maxlength="20"/></td>
				</tr>
				<tr>
					<td>비밀번호 재확인</td>
					<td><input type="password" id="join_pwd_chk" name="join_pwd_chk"  /></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="join_tel1" name="join_tel1" size="5" maxlength="3" />-
					<input type="text" id="join_tel2" name="join_tel2" size="5" maxlength="4" />-
					<input type="text" id="join_tel3" name="join_tel3" size="5" maxlength="4" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="join_email" name="join_email" size="10" placeholder="이메일" /> @
					 <select id="email_select" title="이메일을 선택하세요">
	                            <option value="">선택</option>
	                            <option value="1">naver.com</option>
	                            <option value="2">daum.net</option>
	                            <option value="3">google.com</option>             
	                        </select>
	                </td>
				</tr>
			</table>
			<br><br>
			<div class="goBtn" >
				<button id="join_form_go">회원가입</button>
			</div><!-- goBtn -->
		</div><!-- joinFormTable -->
	</div> <!-- joinForm -->
<!-- footer -->
	<div class="footer">
		<p>COPYRIGHT ⒞ BY VOLG.CHAEMIN.COM.</p>
	</div>
</body>
</html>