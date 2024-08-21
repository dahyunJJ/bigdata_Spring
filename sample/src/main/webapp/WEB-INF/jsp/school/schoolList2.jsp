<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 학교 리스트</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<script type="text/javascript">
	function fn_detail(schoolIdx) {
		$("#schoolId").val(schoolIdx);
		var frm = $("#frm").serialize();
		console.log(frm);
		$.ajax({
			type: 'POST',
			url: '/school/getSchoolInfo.do',
			data: frm, //{ 'schoolIdx' : schoolIdx},
			dataType: 'json',
			beforeSend: function(jqXHR, settings) {
				console.log("beforeSend");
			},
			success: function(data, textStatus, jqXHR) {
				console.log("success");
				console.log(data);
				var innerHtml = '';
				innerHtml += '<tr>';
				innerHtml += '<th>학교명</th>';
				innerHtml += '<td>';
				innerHtml += data.schoolInfo.schoolName;
				innerHtml += '</td>';
				innerHtml += '</tr>';

				$("#schoolTb").html(innerHtml);
				
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log("error");
				
			},
			complete: function(jqXHR, textStatus) {
				console.log("complete");
				
			}
		})
	}	
</script>

</head>
<body>
	<form id="frm" name="frm">
		<input type="hidden" id="schoolId" name="schoolId" value=""/>
	</form>
	<table id="schoolTb">
		<tr>
			<th style="border: 1px solid #444444;">학교명</th>
			<th style="border: 1px solid #444444;">지역구</th>
			<th style="border: 1px solid #444444;">주소</th>
			<th style="border: 1px solid #444444;">연락처</th>
		</tr>
		<c:forEach var="school" items="${schoolList}">
			<tr>
				<!-- [get방식]url?파라미터명=파라미터값&파라미터명1=파라미터값1 -->
				<td style="border: 1px solid #444444;"><a href="/school/getSchoolInfo.do?schoolIdx=${school.schoolId}">${school.schoolName}</a></td>
				<!-- <td style="border: 1px solid #444444;"><a href="javascript:fn_detail(${school.schoolId});">${school.schoolName}</a></td> -->
				<td style="border: 1px solid #444444;">${school.schoolArea}</td>
				<td style="border: 1px solid #444444;">${school.schoolAddr}</td>
				<td style="border: 1px solid #444444;">${school.schoolPhone}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>