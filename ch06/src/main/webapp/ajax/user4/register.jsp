<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<script>
	window.onload=function(){
		
		const btnSubmit = document.getElementsByName('submit')[0];
		const formUser4 = document.getElementsByTagName('form')[0];
		
		btnSubmit.onclick = (e) =>{
			e.preventDefault();
			
			const uid = formUser4.uid.value;
			const name = formUser4.name.value;
			const gender = formUser4.gender.value;
			const age = formUser4.age.value;
			const hp = formUser4.hp.value;
			const addr = formUser4.addr.value;
			
			//JSON 생성
			const jsonData = {//json형식에 맞게 자료를 넣어줌
					"uid":uid,
					"name":name,
					"gender":gender,
					"age":age,
					"hp":hp,
					"addr":addr
					
			};
			
			const strJson = JSON.stringify(jsonData);
			//jsonData에 들어있는 자바객체를 Json객체로 변환
			console.log('strJson : '+strJson);
			
			fetch('./proc/postUser4.jsp',{
				method : 'POST',
				headers : {
					"Content-Type" : "application/json"
				},
				body : strJson
			})
			.then(response=>response.json())
			.then((data)=>{
				console.log(data);
				
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
		<h3>user3 등록</h3>
		<form action="#"> 
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid"></td>
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
					<td>휴대폰</td>
					<td><input type="text" name="hp"></td>
				</tr>
				
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