<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>수정::user2</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script>
			window.onload = function(){
				
				//문서 객체 생성				
				const formUser = document.getElementsByTagName('form')[0];
				const btnSubmit = formUser.submit;
				
				//전송버튼
				btnSubmit.onclick=(e)=>{
					e.preventDefault();//기본 폼 전송 취소
					
					const uid= formUser.uid.value;
					const name= formUser.name.value;
					const birth= formUser.birth.value;
					const addr= formUser.addr.value;
					
					const jsonData={
							"uid":uid,
							"name":name,
							"birth":birth,
							"addr":addr
					};
					
					$.ajax({
						method:'POST',
						url:'./proc/putUser2.jsp',
						data: jsonData,
						success : function(data){							
							//자동으로 객체 변환되어 들어옴
							console.log('Ajax Request:', data); // 확인용 로그
							console.log(data);
							console.log('data.result : '+ data.result);
							
							if(data.result>0){
								alert('수정완료');
								location.href='./list.jsp';
							}
						}
					});				
				}
				//현재 페이지 url에서 파라미터 추출(결국에는 value값을 얻기위해)
				const url = location.href;
				const params = url.split('?')[1];
				const value = params.split('=')[1];
				
				console.log(value);
				
				//서버 요청
				const xhr = new XMLHttpRequest();
				xhr.open('GET','./proc/getUser2.jsp?uid='+value);
				xhr.send();
				
				//응답처리
				xhr.onreadystatechange=function(){
					
					///응답완료
					if(xhr.readyState ==XMLHttpRequest.DONE){
						//요청 성공
						if(xhr.status==200){
							const resData = JSON.parse(xhr.responseText);
							console.log(resData);
							
							formUser.uid.value = resData.uid;
							formUser.name.value = resData.name;
							formUser.birth.value = resData.birth;
							formUser.addr.value = resData.addr;
						}else{
							//요청 실패
							console.log('요청 실패');
						}
					}
				}				
			}
		</script>
	</head>
	<body>
	<h3>user2 수정</h3>
	<a href="./list.jsp">목록이동</a>
	<form action="#">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" readonly></td>
			</tr>
			<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" name="birth"></td>
				</tr>
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