<%@page contentType = "text/html;charset=UTF-8" %>

 <!DOCTYPE html>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("select[name=item]>option[value='${param.item}']").prop('selected', 'selected');
		$("input[type=search]").val('${param.value}');
		
		//submit버튼이 클릭되면 form태그에서 submit이벤트가 발생된다. 
		//submit이벤트발생시 할 일 1)기본이벤트 제거(요청) 2) ajax로 요청 구현
		$("form").submit(function(event){
			event.preventDefault();
			var url="boardlistview.do";
			var itemVal = $("select[name=item]").val();
			var valueVal = $("input[name=value]").val();
			
			$.get(url, {"item": itemVal, "value": valueVal}, successFunction);
		});	
	
	});

</script>
<!-- form태그에  action속성이 생략된경우 submit버튼이 클릭되면 현재사용중인 URL을 요청함 -->
<form class="text-right">
	<select name="item">
		<option value="e_mail">작성자로검색</option>
		<option value="subject">제목으로검색</option>
	</select>
	<input type="search" name="value">
	<input type="submit" value="검색">
</form>
