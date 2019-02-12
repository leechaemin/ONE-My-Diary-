<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<c:choose>
	<c:when test="${usrSesn != null && usrSesn.mbr_no != '' }">
		<h2>${usrSesn.mbr_nm}님 환영합니다.</h2>
		<button id="logOutBtn">로그아웃</button>
	</c:when>
	<c:when test="${usrSesn == null || usrSesn.mbr_no == '' }">
			<h2 align="center" style="font-family:  Comic Sans MS, cursive, sans-serif">LOGIN</h2>
			<div align="center">
				<form id="loginForm" name="loginForm" method="post" >
				<table>
					<tr>
						<td>I D</td>
						<td><input type="text" id="mbr_id" name="mbr_id" /></td>
					</tr>
					<tr>
						<td>P W</td>
						<td><input type="password" id="mbr_pwd" name="mbr_pwd" /></td>
						<td><input type="button" value="로그인"
									onclick="goLogin();" /></td>		
					</tr>
				</table>
				</form>
				
				<hr width="90%" align="center">
				<table>
					<tr>
						<td>아이디 찾기 | </td>
						<td>비밀번호 찾기 | </td>
						<td><a href="./join_form">회원 가입</a></td>
					</tr>
				</table>
			</div>
	</c:when>
</c:choose>

<script type="text/javascript">
	$(document).ready(function(){
		$("#logOutBtn").click(function(){
			$.post(
					"./logout"
					,{}
					,function(data, status){
						if(status == 'success'){
							
							if(data > 0){
								alert("logout complete.");
								location.href = "./";
							}else{
								alert("잠시 후 다시 시도해 주세요.");
							}
						}else{
							alert("시스템 관리자에게 문의 바랍니다.");
						}
					}
			);//post
		});//click
	});//ready

	function goLogin() {
		if(loginForm.mbr_id.value.trim() == ""){
			alert("아이디를 확인하세요.");
			loginForm.mbr_id.focus();
			return;
		}
		if(loginForm.mbr_pwd.value.trim() == ""){
			alert("비밀번호를 확인하세요.");
			loginForm.mbr_pwd.focus();
			return;
		}
		loginForm.action = "./login";
		loginForm.submit();
	}//goLogin
</script>
	
			