<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
<title>학생 정보 리스트</title>

<script type="text/javascript">
	$(document).ready(function(){
		fn_selectList();
	});

	function fn_selectList(){		
		$.ajax({
		    url: '/studentMng/selectStudentMngList.do',
		    method: 'post',
		    data : {},
		    dataType : 'json',
		    success: function (data, status, xhr) {
		        // console.log(data);
		        var innerHtml = '';
		        for(var i = 0; i < data.list.length; i++) {
		        	innerHtml += '<tr>';
		        	innerHtml += '<td style="border: 1px solid #444444;">';
		        	innerHtml += data.list[i].rNum;
		        	innerHtml += '</td>';
		        	innerHtml += '<td style="border: 1px solid #444444;">';
		        	innerHtml += '<a href="javascript:fn_detail('+data.list[i].studentId+')">';
		        	innerHtml += data.list[i].studentName;
		        	innerHtml += '</a>';
		        	innerHtml += '</td>';
		        	innerHtml += '<td style="border: 1px solid #444444;">';
		        	innerHtml += data.list[i].schoolName;
		        	innerHtml += '</td>';
		        	innerHtml += '<td style="border: 1px solid #444444;">';
		        	innerHtml += data.list[i].graduateYN;
		        	innerHtml += '</td>';
		        	innerHtml += '</tr>';
		        }
		        $("#bodyList").html(innerHtml);
		    },
		    error: function (data, status, err) {
		    }
		});
	}
	
	function fn_detail(studentId) {
		$("#studentId").val(studentId)
		var frm = $("#frm");
		frm.attr("method", "POST"); 
		frm.attr("action", "/studentMng/getStudentMngInfo.do"); 
		frm.submit();
	}
</script>

</head>
<body>
	<form id="frm" name="frm">
		<input type="hidden" id="studentId" name="studentId" value="${studentInfo.studentId}" />
	</form>
	<table style="border: 1px solid #444444;">
	<thead>
		<tr>
			<th style="border: 1px solid #444444;">순번</th>
			<th style="border: 1px solid #444444;">학생이름</th>
			<th style="border: 1px solid #444444;">학교명</th>
			<th style="border: 1px solid #444444;">졸업여부</th>
		</tr>
	</thead>
	<tbody id="bodyList">		
	</tbody>
	</table>
	<a href="/studentMng/registStudentMng.do">등록</a>
</body>
</html>