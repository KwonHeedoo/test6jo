<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

	var studentArray=[];
	
	function makeStudent(){
		var name= document.getElementById("name").value;
		var grade= document.getElementById("grade").value;
		console.log(name+grade);
		
		var student={
			name: name,
			grade:  grade,
		}
		
		studentArray.push(student);
		
		document.getElementById("name").value="";
		document.getElementById("grade").value="";
	}
	
	function allstudent() {
		console.log(studentArray.length);
		var output="";
		for (var i=0; i<studentArray.length;i++) {
			output += '* name: '+studentArray[i].name+',\n'+ 'grade :'+studentArray[i].grade+'\n';
		}
		
		$("#std").text(output);
	}
	
	function getAgv(){
		var sum=0;
		for (var i=0; i<studentArray.length;i++) {
			sum+=Number(studentArray[i].grade);
		}
		var avg= sum/(studentArray.length);
		$("#aver").text("평균"+avg);
	}
	


</script>
</head>
<body>

<div>
	<form>
		이름 : <input type="text" id="name"> <br>
		점수 : <input type="text" id ="grade"> <br>
		<input type="button" id="register" value="등록" onclick="makeStudent()"> <br>
		<input type="button" id="allStudent" value="학생 전체 보기" onclick="allstudent()"> <br>
		<input type="button" id="average" value="전체 평균 내기" onclick="getAgv()">
	
	</form>
	<div>
		<p id="std">
		
		</p>
		<p id="aver">
		
		</p>
	
	</div>

</div>

</body>
</html>