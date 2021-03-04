<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">

	.eheck_font
	{
		color: red;
	}


</style>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/bootstrap.min.css">

<script src="https://kit.fontawesome.com/5cdf4f755d.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/join.css">

<script type="text/javascript">

	//모든 공백 체크 정규식 
	var empJ = /\s/g; 
	//아이디 정규식 
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/; 
	// 비밀번호 정규식 
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	// 이름 정규식 
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
	// 이메일 검사 정규식 
	var mailJ = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
	// 휴대폰 번호 정규식 
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/ 
	
	
	$(document).ready(function() 
	{ 
		$('#id_check').css("display", "none");
		
		$("#submitBtn").click(function()
		{
			// 아이디 형식 검사
			if($('#id').val()=='')
			{ 
				$('#id_check').css("display", "inline");
				$('#id_check').text('아이디를 입력하세요.'); 
				$('#id_check').css('color', 'red'); 
			} 
			else if(idJ.test($('#id').val())!=true)
			{ 
				$('#id_check').css("display", "inline");
				$('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.'); 
				$('#id_check').css('color', 'red'); 
			} 
			
			var inval_Arr = new Array(5).fill(false); 
			if (idJ.test($('#id').val())) 
			{ 
				inval_Arr[0] = true; 
			} 
			else 
			{
				inval_Arr[0] = false; 
				alert('아이디를 확인하세요.'); 
				return false; 
			} 
			
			// 비밀번호가 같은 경우 && 비밀번호 정규식 
			if (($('#pw').val() == ($('#pw2').val())) 
					&& pwJ.test($('#pw').val())) 
			{ 
				inval_Arr[1] = true; 
			} 
			else 
			{ 
				inval_Arr[1] = false; 
				alert('비밀번호를 확인하세요.'); 
				return false; 
			} 
			
			// 이름 정규식 
			if (nameJ.test($('#name').val())) 
			{ 
				inval_Arr[2] = true; 
			} 
			else 
			{ 
				inval_Arr[2] = false; alert('이름을 확인하세요.'); 
				return false; 
			} 
			
			
			// 이메일 정규식 
			if (mailJ.test($('#email').val()))
			{ 
				console.log(mailJ.test($('#email').val())); 
				inval_Arr[3] = true; 
			} 
			else 
			{ 
				inval_Arr[3] = false; 
				alert('형식에 맞지 않는 이메일입니다.'); 
				return false; 
			} 
			
			// 휴대폰번호 정규식 
			if (phoneJ.test($('#phone').val())) 
			{ 
				console.log(phoneJ.test($('#phone').val())); 
				inval_Arr[4] = true; 
			} 
			else 
			{ 
				inval_Arr[4] = false; 
				alert('형식에 맞지 않는 전화번호입니다.'); 
				return false; 
			} 
			
			// 비밀번호 찾기 질문 선택
			if ($("#pwSrch").val() == '')
			{
				
			}
			
			//전체 유효성 검사 
			var validAll = true; 
			for(var i = 0; i < inval_Arr.length; i++)
			{ 
				if(inval_Arr[i] == false)
				{ 
					validAll = false; 
				} 
			} 
			
			if(validAll == true)
			{ 
				// 유효성 모두 통과 
				alert('Studyit 가입을 축하드립니다. \n로그인 후 이용해 주세요.'); 
			} 
			else
			{ 
				alert('정보를 다시 확인하세요.') 
			} 
			
			// sunmit 액션 처리 수행
			$("#usercheck").submit();
		});
		
		
		// 아이디 중복검사
		$('#check').click(function()
		{
			$.ajax({
				url: "idcheck.action",
				type: "GET",
				data:
				{
					"id":$('#id').val()
				},
				success: function(data)
				{
					if(data == 0 && $.trim($('#id').val()) != '' && idJ.test($('#id').val()))
					{
						idx=true;
						$('#id_check').css("display", "inline");
						$('#id_check').text('사용 가능한 아이디입니다.'); 
						$('#id_check').css('color', 'red'); 
					}
					else if(!idJ.test($('#id').val()))
					{
						$('#id_check').css("display", "inline");
						$('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.'); 
						$('#id_check').css('color', 'red'); 
					}
					else
					{
						$('#id_check').css("display", "inline");
						$('#id_check').text('이미 사용 중인 아이디입니다.'); 
						$('#id_check').css('color', 'red'); 
					}
				},
				error: function()
				{
					alert("서버에러");
				}
			});
		});
		
				
			$('#id').blur(function() 
			{ 
				if (idJ.test($('#id').val())) 
				{ 
					console.log('true'); 
					$('#id_check').text(''); 
				} 
				else 
				{ 
					console.log('false'); 
					$('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.'); 
					$('#id_check').css('color', 'red'); 
					} 
				}); 
	
			
			$('#pw').blur(function() 
			{ 
				if (pwJ.test($('#pw').val())) 
				{ 
					console.log('true'); $('#pw_check').text(''); 
				} 
				else 
				{ 
					console.log('false'); $('#pw_check').text('4~12자의 숫자, 문자로만 사용 가능합니다.'); 
					$('#pw_check').css('color', 'red'); 
				} 
			}); 
			
			//1~2 패스워드 일치 확인 
			$('#pw2').blur(function() 
			{ 
				if ($('#pw').val() != $(this).val()) 
				{ 
					$('#pw2_check').text('비밀번호가 일치하지 않습니다.'); 
					$('#pw2_check').css('color', 'red'); 
				} 
				else 
				{ 
					$('#pw2_check').text(''); 
				} 
			}); 
			
			//이름에 특수문자 들어가지 않도록 설정 
			$("#name").blur(function() 
			{ 
				if (nameJ.test($(this).val())) 
				{ 
					console.log(nameJ.test($(this).val())); 
					$("#name_check").text(''); 
				} 
				else 
				{ 
					$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)'); 
					$('#name_check').css('color', 'red'); 
				} 
			}); 
			
			// 휴대전화 
			$('#phone').blur(function()
			{ 
				if(phoneJ.test($(this).val()))
				{ 
					console.log(phoneJ.test($(this).val())); 
					$("#phone_check").text(''); 
				} 
				else 
				{ 
					$('#phone_check').text('형식에 맞지 않는 전화번호입니다.'); 
					$('#phone_check').css('color', 'red'); 
				} 
			}); 
			
			// 이메일
			$('#email').blur(function()
			{ 
				if(mailJ.test($(this).val()))
				{ 
					console.log(mailJ.test($(this).val())); 
					$("#email_check").text(''); 
				} 
				else 
				{ 
					$('#email_check').text('형식에 맞지 않는 이메일입니다.'); 
					$('#email_check').css('color', 'red'); 
				} 
			}); 
			
			// 지역대분류 선택시 중분류 나오게
			$("#regionGroup1").change(function(){
				
				// 중분류 보이기
				$("#regionGroup2").css("display","inline");
				// 넘길 대분류 코드
				var selectedLc = "loc_lc_code="+this.value;
				
				$.ajax(
				{
					type : "POST"
					, url : "joinregionajax.action"
					, data : selectedLc
					, dataType : "json"
					, success : function(jsonArr)
					{
						// 가져온 데이터들로 옵션 구성
						var out = "";
						out += "<option value=\"\">선택</option>";
						for(var idx=0; idx<jsonArr.length; idx++)
						{
							var value = jsonArr[idx].loc_mc_code;
							var name = jsonArr[idx].loc_mc;

							out += "<option value=\""+ value +"\">";
							out += name;
							out += "</option>";
						}
						// 출력
						$("#regionGroup2").html(out); 
					}
					, error:function(request,status,error){
			        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   	}
				});
			});
			
			// 직업대분류 선택시 중분류 나오게
			$("#job1").change(function(){
				
				// 중분류 보이기
				$("#job2").css("display","inline");
				// 넘길 대분류 코드
				var selectedLc = "job_lc_code="+this.value;
				
				$.ajax(
				{
					type : "POST"
					, url : "jobajax.action"
					, data : selectedLc
					, dataType : "json"
					, success : function(jsonArr)
					{
						// 가져온 데이터들로 옵션 구성
						var out = "";
						out += "<option value=\"\">선택</option>";
						for(var idx=0; idx<jsonArr.length; idx++)
						{
							var value = jsonArr[idx].job_mc_code;
							var name = jsonArr[idx].job_mc;

							out += "<option value=\""+ value +"\">";
							out += name;
							out += "</option>";
						}
						// 출력
						$("#job2").html(out); 
					}
					, error:function(request,status,error){
			        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   	}
				});
			});
			
	});



</script>
</head>
<body>
<div class="wrapper">
<jsp:include page="header.jsp" flush="false" />
	<div class="main-content text-center">

		<div id="Join_title">
		회원가입
		</div>

		<div class="main">
		<form class="form-control" name="newMem"  id="usercheck" action="memberjoin.action" method="get">
		
		<p class="header_left">회원 정보 입력</p>
		
			<table cellspacing=20 class="table table-striped" id="table1" >
				<tr>
					<div class="form group">
					<th>아이디</th>
					<td>
						<input type="text" name="id" id="id" class="form-control" style="display:inline-block"
						required>
						<button type="button" id="check" name="check"
						class=" btn btn-outline-primary btn-sm ">중복검사</button> 
						<div class="eheck_font" id="id_check"></div>
					</td>
					</div>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" id="pw" name="pw" class="form-control">
						<div class="eheck_font" id="pw_check"></div>
					</td>
				</tr>

				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="pw2" id="pw2"
						class="form-control">
						<div class="eheck_font" id="pw2_check"></div>
					</td>
				</tr>

				<tr>
					<th>비밀번호 찾기 질문</th>
					<td>
						<select name="pw_srch_que_code" id="pwSrch" class="form-control">
								<option value="">선택</option>
								<c:forEach var="pwque" items="${pqList }">
									 <option value="${pwque.pw_srch_que_code }">
									 	${pwque.pw_srch_que}
									 </option>
								 </c:forEach>
						</select>
						<div class="eheck_font" id="pwSrch_check"></div>
					</td>
				</tr>

				<tr>
					<th>비밀번호 찾기 답변</th>
					<td>
						<input type="text" name="pw_srch_que_ans" id="pwSrchCheck" class="form-control">
						<div class="eheck_font" id="pwSrchCk_check"></div>
					</td>
				</tr>

				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" id="name" class="form-control">
						<div class="eheck_font" id="name_check"></div>
					</td>
				</tr>

				<tr>
					<th>주민등록번호</th>
					
					<td>
					<div class="form group">
						<input type="text" id="ssn" name="ssn"class="form-control" style="display:inline-block"> 
						
					</div>
					</td>
					
				</tr>

				<tr>
					<th>지역</th>
					<td>
						<div class="form group">
						<select name="loc_lc_code" id="regionGroup1" class="form-control" style="display:inline-block"
						required>
							<option value="">선택</option>
							 <c:forEach var="loclc" items="${llList }">
								 <option value="${loclc.loc_lc_code }">
								 	${loclc.loc_lc }
								 </option>
							 </c:forEach>
						</select>
						<select name="loc_mc_code" id="regionGroup2" class="form-control" style="display:none;" required>
							<option value="">선택</option>
							 <c:forEach var="locmc" items="${lmList }">
								 <option value="${locmc.loc_mc_code }">
								 	${locmc.loc_mc }
								 </option>
							 </c:forEach>
						</select>
						</div>
					</td>
				</tr>

				<tr>
					<th>직업</th>
					<td>
						<div class="form group">
						<select name="job_lc_code" id="job1" class="form-control" style="display:inline-block"
						required>
								<option value="">선택</option>
								<c:forEach var="joblc" items="${jblList }">
									 <option value="${joblc.job_lc_code}">
									 	${joblc.job_lc }
									 </option>
								 </c:forEach>
						</select> 
						<select name="job_mc_code" id="job2" class="form-control" style="display: none;" required>
								<option value="">선택</option>
								<c:forEach var="jobmc" items="${jbmList }">
									 <option value="${jobmc.job_mc_code }">
									 	${jobmc.job_mc }
									 </option>
								 </c:forEach>
						</select>
						</div>
					</td>
				</tr>

				<tr>
					<th>관심분야</th>
					<td>
						<select name="interest_mc_code" id="interest" class="form-control">
							<option value="">선택</option>
							<c:forEach var="interest" items="${imList }">
								 <option value="${interest.interest_mc_code }">
								 	${interest.interest_mc }
								 </option>
							 </c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>스터디 타입</th>
					<td>
						<select name="study_type_code" id="studyType" class="form-control">
							<option value="">선택</option>
							<c:forEach var="studyType" items="${stList }">
								 <option value="${studyType.study_type_code }">
								 	${studyType.study_type }
								 </option>
							 </c:forEach>
						</select>
					</td>
				</tr>

				<tr>
					<th>핸드폰번호</th>

					<td>
						<div class="form group">
							<input type="text" name="phone" id="phone" class="form-control"  placeholder="'-' 없이 번호만 입력하세요."> 
							<div class="eheck_font" id="phone_check"></div>
						</div>
					</td>
				</tr>

				<tr>
					<th>이메일 주소</th>

					<td>
					<div class="form group">
						<input type="text" name="email" id="email" class="form-control"  placeholder="ex) studyit@test.com"> 
						<div class="eheck_font" id="email_check"></div>
					</div>
					</td>
				</tr>

			</table>
		</form>
		
			<div id="footer">
				<button type="submit" id="submitBtn" class="btn btn-outline-primary">회원가입</button>
				<button type="button" di="resetBtn" class="btn btn-outline-primary">취소</button>
			</div>
		<br>
	</div>
		

	</div>
		<jsp:include page="footer.jsp" flush="false" />
</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>






