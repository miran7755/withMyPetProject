<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>report.jsp</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#report").click(function(){
			alert("사유버튼클릭");
			var url = "report.do";
			var report_kind = $("#report_kind").val();
			var reply_no = ${param.reply_no};
			var post_no = ${param.post_no};
			var reported_email = "${param.reported_email}";
			var reporter_email = "${param.reporter_email}";
		
			$.post(url, {"report_kind":report_kind, "reply_no":reply_no, "post_no":post_no, "reported_email":reported_email, "reporter_email":reporter_email, "report_kind":report_kind});		
		});
	}); 
</script>
</head>
<body>
<div>
	<form>
 		<input type="text" id="report_kind" placeholder="신고사유를 적어주세요.">
		<input type="button" id="report" value="신고하기" onClick="window.close()">
	</form>
</div>
</body>
</html>