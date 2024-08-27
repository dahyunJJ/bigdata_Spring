<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 상세페이지</title>
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>  
  
</head>
<body>
	<form id="frm" name="frm">
		<input type="hidden" id="studentId" name="studentId" value="${studentInfo.studentId}" />
	</form>
	<table style="border: 1px solid #444444;">
		<tr>
			<th style="border: 1px solid #444444;">학생 이름</th>
			<td style="border: 1px solid #444444;">${studentInfo.studentName}</td>
		</tr>
		<tr>
			<th style="border: 1px solid #444444;">학교명</th>
			<td style="border: 1px solid #444444;">${studentInfo.schoolName}</td>			
		</tr>
		<tr>
			<th style="border: 1px solid #444444;">졸업 여부</th>
			<td style="border: 1px solid #444444;">${studentInfo.graduateYN}</td>
		</tr>
		
	</table>
	<!-- <input type="button" id="btn_delete" name="btn_delete" value="삭제"/>	 -->
	<!-- <input type="button" id="btn_udpate" name="btn_udpate" value="수정" onClick="javascript:fn_update();"/> -->
	
	<a href="/studentMng/getStudentMngList.do">목록으로</a>
</body>
</html>