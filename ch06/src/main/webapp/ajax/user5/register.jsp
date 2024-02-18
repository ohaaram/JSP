<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user5::등록</title>
</head>
<script>
	window.onload = function(){
		const btnSubmit = document.getElementsByName('submit')[0];
		const formUser5 = document.getElementsByTagName('form')[0];
		
		btnSubmit.onclick = (e)=>{
			e.preventDefault();
			
			const name = formUser5.name.value;
			const gender = formUser5.gender.value;
			const age = formUser5.age.value;
			const addr = formUser5.addr.value;
			
			//JSON 생성
			const jsonData={
					"name":name,
					"gender":gender,
					"age":age,
					"addr":addr
			};
			
			const strJson = JSON.stringify(jsonData);
			//jsonData에 들어있는 자바객체를 Json객체로 변환
			
			fetch('./proc/postUser5.jsp',{
				method : 'POST',
				headers:{
					"Content-Type" :"application/json"
				},
				body : strJson
				
			})
			.then(response=>response.json())
			.then((data)=>{
				if(data.result>0){
					alert('등록 성공!');
					
					location.href='./list.jsp';
				}else{
					alert('등록 실패');
				}
			})
			.catch((err)=>{
				console.log(err);
			});
		}
	}
	
</script>

<body>
<h3>user5 등록</h3>
		<form action="#"> 
			<table border="1">
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
						<input type="submit" name="submit" value="등록하기">
					</td>
				</tr>
			</table>
		</form>

</body>
</html>