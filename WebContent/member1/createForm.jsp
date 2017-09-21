<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">
function inputCheck(f){
	if(f.id.value==""){
		alert("ID 체크하십시요")
		f.id.focus();
		return false;
	}

	if(f.passwd.value==""){
		alert("PASSWD 체크하십시요")
		f.passwd.focus();
		return false;
	}
	
	if(f.repasswd.value==""){
		alert("PASSWD 체크하십시요")
		f.repasswd.focus();
		return false;
	}
			
	if(f.email.value==""){
		alert("EMAIL 체크하십시요")
		f.email.focus();
		return false;
	}
}
	function idCheck(id){
		if(id==""){
			alert("ID를 입력하세요");
			document.frm.id.focus();
			}else{
			var url ="id_Proc.jsp";
			url +="?id="+id;
						
			wr = window.open(url,"ID검색","width=500,height=500");
			wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
			}
		}
				
	function emailCheck(email){
		if(email==""){
			alert("EMAil 입력하세요");
			document.frm.email.focus();
		}else{
			var url ="email_Proc.jsp";
			url +="?email="+email;
							
			wr = window.open(url,"EMAIL검색","width=500,height=500");
			wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
		}
	}

</script>
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">★SK 회원가입★</DIV>

	<FORM name='frm' method='POST' action='./prcreateProc.jsp'
		enctype="multipart/form-data" onsubmit="return inputCheck(this)">
		<TABLE>
			<TR>
				<TH>사진</TH>
				<TD><input type="file" name="fname" accept=".jpg,.png,.gif"></TD>
				<TD>JPG, PNG, GIF파일만 올려주세요</TD>
			</TR>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" size="16">
					<button type="button"class="btn btn-info" onclick="idCheck(document.frm.id.value)">ID
						중복확인</button></td>
				<td></td>
			</tr>
			<tr>
				<th>PASSWD</th>
				<td><input type="password" name="passwd" size="16"></td>
				<td>정확히 입력해주세요</td>
			</tr>
			<tr>
				<th>PASSWD 확인</th>
				<td><input type="password" name="repasswd" size="16"></td>
				<td>정확히 입력해주세요</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="mname" size="16"></td>
				<td>이름을 정확히 입력해주세요</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" size="16"></td>
				<td>정확히 입력해주세요</td>
			</tr>

			<tr>
				<th>EAMIL</th>
				<td><input type="text" name="email" size="26">
					<button type="button"class="btn btn-info" onclick="emailCheck(document.frm.email.value)">EMAIL
						중복확인</button></td>
				<td></td>
			</tr>
			<tr>
				<TH>우편번호</TH>
				<TD><input type="text" name="zipcode" id="sample6_postcode"
					size="7" placeholder="우편번호">
					<button type="button" onclick="sample6_execDaumPostcode()">우편번호
						찾기</button></TD>
				<TD></TD>
			</TR>
			<TR>
				<TH>주소</TH>
				<TD><input type="text" name="address1" size="40"
					placeholder="주소" id="sample6_address"> <input type="text"
					name="address2" size="40" placeholder="상세주소" id="sample6_address2">

				</TD>
				<TD></TD>
			</TR>






		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='회원가입' class="btn btn-primary"> <input type='reset'
				value='취소' onclick="history.back()" class="btn btn-primary">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
