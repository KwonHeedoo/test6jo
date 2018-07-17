<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	function event(num1, num2) {
		var result = 1;

		for (var i = 0; i < num2; i++) {
			result *= num1;
		}
		return result;
	}
	
	function sum(...num){
		var array= num;
		var result = 0;
		for (var i = 0; i < array.length; i++) {
			result+=array[i];
		}

		return result;
	}
	
	function odd_even(...num){
		var array= num;
		for (var i = 0; i < array.length; i++) {
			if(array[i]%2==0){//짝수
				alert(array[i]+"는 짝수입니다.");
			}else{
				alert(array[i]+"는 홀수입니다.");				
			}
		}
	}

	function pitagoras(num1, num2){
		function double(num){
			return num*num;
		}
		return Math.sqrt(double(num1)+double(num2));
	}
	
	/* window.onload = function click() {
		//alert(sum(1,2,3,4,5));
		//odd_even(2,4,1,5,8);
		alert(pitagoras(3,4));
	} */
	
	//<-- 함수라서.. $(function안써도됨)<-페이지를 다 구현한 다음에 이 함수를 실행해라...body.onload 와 같은 뜻...
		setInterval(function() {
			$.ajax({
				url: "getTime",
				type: "post", // 데이타는 없어도 됨... 
				success: function(data){
					//document.getElementById("viewTime").innerHTML =data;
					$("#viewTime").text(data);
					// document.getElementById("viewTime").innerHTML = data;
					},
				error:function(data){
					alert("통신에러");
				}
			});
		},1000);
	
	
</script>
</head>

<body>
	<div id ="viewTime">
	
	</div>

</body>
</html>