<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<script>
	window.onload =function(){
		const formUser=document.getElementsByTagName('form')[0];
		const btnSubmit = formUser.submit;
		
		//전송버튼
		btnSubmit.onclick = (e) =>{
			e.preventDefault();
			
			const seq =formUser.seq.value;
			const name=formUser.name.value;
			const gender = formUser.gender.value;
			const age =formUser.age.value;
			const addr = formUser.addr.value;
			
			const jsonData={
					"seq":seq,
					"name":name,
					"gender":gender,
					"age":age,
					"addr":addr
			};
			
			$.ajax({
				method:'POST',
				url:'./proc/putUser5.jsp',
				data:jsonData,
				success:function(data){
					console.log(data);
					
					if(data.result>0){
						alert('수정완료');
						location.href='./list.jsp';
					}
				}
			});
		}
		
		//현재페이지 url에서 파라미터 추출
		const url = location.href;
		const params = url.split('?')[1];
		const params2 = params.split('=')[1];
		const value = params2.split('&')[0];
		
		console.log(value);
		
		//서버 요청
		const xhr = new XMLHttpRequest();
		xhr.open('GET','./proc/getUser5.jsp?seq='+value);
		xhr.send();
		//응답처리
		xhr.onreadystatechange = function(){
			//응답완료
			if(xhr.readyState==XMLHttpRequest.DONE){
				//요청성공
				if(xhr.status==200){
					const resData = JSON.parse(xhr.responseText);
					
					formUser.seq.value=resData.seq;
					formUser.name.value=resData.name;
					formUser.gender.value=resData.gender;
					formUser.age.value=resData.age;
					formUser.addr.value=resData.addr;
					
				}else{
					console.log('요청실패');
				}
			}
		}
	}
</script>
<body>
<h3>user5 수정</h3>
		<a href="./list.jsp">목록이동</a>
		<form action="#"> 
			<table border="1">
				<tr>
					<td>번호</td>
					<td><input type="text" name="seq" readonly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
					<label><input type="radio" name="gender" value="M">남</label>
					<label><input type="radio" name="gender" value="F">여</label>				
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age"></td>
				</tr>
				<tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" name="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>

</body>
</html>