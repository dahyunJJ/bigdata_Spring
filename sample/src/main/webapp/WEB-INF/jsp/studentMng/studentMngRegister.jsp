<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
<title>학생 등록하기</title>
<script type="text/javascript">
	$(document).ready(function(){
			
	});
	
	function fn_regist() {
		var frm = $("#frm").serialize();
		console.log(frm); 
		
		$.ajax({
			type : 'POST',
			url : '/studentMng/registStudentMngInfo.do',
			data : frm,
			dataType : 'json',
			beforeSend: function(jqXHR, settings){
				console.log("beforeSend");
			},
			success : function(data, textStatus, jqXHR){
				if(data.resultChk > 0){
					alert("등록되었습니다.");
					window.location.href = '/studentMng/getStudentMngList.do';
				}
				
			},  				
			error: function(jqXHR, textStatus, errorThrown){
				console.log("error");
			},
			complete : function(jqXHR, textStatus){
				console.log("complete");
			}
		});
	}
	
</script>
</head>
<body>
	<form id="frm" name="frm">
		<table>
			<tr>
				<th>학생 이름</th>
				<td>
					<input type="text" id="studentName" name="studentName" value="${studentInfo.studentName}"/>
				</td>
			</tr>
			<tr>
				<th>학교명</th>
				<td>
					<select id="schoolId" name="schoolId">
						<option value="${studentInfo.schoolId}">--학교를 선택하세요--</option>
						<c:forEach var="schoolList" items="${schoolList}">
							<option value="${schoolList.schoolId}">${schoolList.schoolName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>졸업여부</th>
				<td>
					<input type="text" id="graduateYN" name="graduateYN" value="${studentInfo.graduateYN}"/>
				</td>
			</tr>
		</table>
		<a href="javascript:fn_regist();">등록</a>
	</form>
</body>
</html>