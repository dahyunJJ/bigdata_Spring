<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<script type="text/javascript">	
	$( document ).ready(function() {
		  $("#btn_delete").on('click', function(){
			  fn_deleteSchool();
		  })
		});
	
		// delete	
		function fn_deleteSchool(){
			
			var frm = $("#frm").serialize();
			console.log(frm); 
			
			$.ajax({
				type : 'POST',
				url : '/school/deleteSchoolInfo.do',
				data : frm,
				dataType : 'json',
				beforeSend: function(jqXHR, settings){
					console.log("beforeSend");
				},
				success : function(data, textStatus, jqXHR){
					if(data.resultChk > 0){
						alert("삭제되었습니다.");
						window.location.href = '/school/getSchoolList.do';
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
		<input type="hidden" id="schoolId" name="schoolId" value="${schoolInfo.schoolId}" />
	</form>
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
	<input type="button" id="btn_delete" name="btn_delete" value="삭제"/>
</body>
</html>