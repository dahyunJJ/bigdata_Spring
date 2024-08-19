<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table style="border: 1px solid #444444;">
		<tr>
			<th style="border: 1px solid #444444;">학교명</th>
			<th style="border: 1px solid #444444;">${schoolInfo.schoolName}</th>
		</tr>
		<tr>
			<th style="border: 1px solid #444444;">지역구</th>
			<th style="border: 1px solid #444444;">${schoolInfo.schoolArea}</th>
		</tr>
		<tr>
			<th style="border: 1px solid #444444;">학교주소</th>
			<th style="border: 1px solid #444444;">${schoolInfo.schoolAddr}</th>
		</tr>
		<tr>
			<th style="border: 1px solid #444444;">학교 연락처</th>
			<th style="border: 1px solid #444444;">${schoolInfo.schoolPhone}</th>
		</tr>	
	</table>
	<a href="/school/getSchoolList.do">목록으로</a>
</body>
</html>