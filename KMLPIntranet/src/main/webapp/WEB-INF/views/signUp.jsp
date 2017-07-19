<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Sign Up</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Frijole" rel="stylesheet">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

        <script type="text/javascript">
        //id,password 유효성 검사
        jQuery( function($) { 

        var re_id = /[0-9a-zA-Z]{4,10}$/; // 아이디 검사식
        var re_pw = /[0-9a-zA-Z]{6,10}$/; // 비밀번호 검사식

        var 
            form = $('.form'), 
            id = $('#id'), 
            password = $('#password'), 
        
	        id = $('#id').after('&nbsp;<strong></strong>');
	        password = $('#password').after('&nbsp;<strong></strong>');
	        
	        
	        id.keyup(function() {
	            var s = $(this).next('strong'); 
	            if (id.val().length == 0) { 
	                s.text(''); 
	            } else if (id.val().length < 4) { 
	                s.text('너무 짧아요!'); 
	            } else if (id.val().length > 10) { 
	                s.text('너무 길어요!');
	            } else if (re_id.test(id.val()) != true ) { 
	                s.text('유효한 문자를 입력해 주세요.'); 
	            } else { 
	                s.text('적당해요^^'); 
	            }
	        });
	        
	        password.keyup(function() {
	            var s = $(this).next('strong'); 
	            if (password.val().length == 0) { 
	                s.text(''); 
	            } else if (password.val().length < 6) { 
	                s.text('너무 짧아요!'); 
	            } else if (password.val().length > 10) { 
	                s.text('너무 길어요!'); 
	            } else { 
	                s.text('적당해요^^'); 
	            }
	        });
	    });
        
        
        //id 중복확인
        function idCheck(){
        	
        }
    	</script>

        <script type="text/javascript">
		
		// 이메일 종류 선택 
		function emailChoice(obj, str) {
		   if (obj == '') {
		      str.readonly = false;
		      str.value = '';
		      str.focus();
		   } else {
		      str.readonly = true;
		      str.value = obj;
		   }
		}
		
		</script>
     
		<script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue(){
            if(!document.login.id.value){
                alert("아이디를 입력하세요.");
                id.focus();
                return false;
            }
            
            if(!document.login.password.value){
                alert("비밀번호를 입력하세요.");
                password.focus();
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.login.password.value != document.login.passwordchk.value){
                alert("비밀번호를 동일하게 입력하세요.");
                passwordchk.focus();
                return false;
            }
            
            if(!document.login.name_kr.value){
                alert("고객명을 입력하세요.");
                name_kr.focus();
                return false;
            }
            
            if(!document.login.name_enf.value){
                alert("영문명을 입력하세요.");
                name_enf.focus();
                return false;
            }
            
            if(!document.login.name_ens.value){
                alert("영문명을 입력하세요.");
                name_ens.focus();
                return false;
            }
            
            if(!document.login.email1.value){
                alert("이메일을 입력하세요.");
                email1.focus();
                return false;
            }
            
            if(!document.login.email2.value){
                alert("이메일 도메인을 선택하세요.");
                return false;
            }

            if(!document.login.tell2.value){
                alert("전화번호를 입력하세요.")
				tell2.focus();
                return false;
            }
            
            if(!document.login.tell3.value){
                alert("전화번호를 입력하세요.");
                tell3.focus();
                return false;
            }
            
            if(!document.login.cell2.value){
                alert("휴대폰번호를 입력하세요.");
                cell2.focus();
                return false;
            }
            
            if(!document.login.cell3.value){
                alert("휴대폰번호를 입력하세요.");
                cell3.focus();
                return false;
            }
            
            alert("회원가입이 완료되었습니다!");
            return true;
        }
    	</script>

        <style>
        #nav {
            font-size: 18px;
            font-family: 'Frijole', cursive;
        }

        a:hover {
            text-decoration: none;
        }

        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        a:active {
            text-decoration: none;
        }

        #top {
            margin-top: 35px
            }

        th{
            width: 150px;
            background-color:beige;
            
        }

        td{
            width: 780px;
            
        }       

        strong{
            color: #FF4500;
            font-size: 0.9em;
        }
        #sign{
            margin-top: 20px;
        }

        h5{
           margin-left: 105px;
        }

        table{
           border-collapse: collapse;
           color: dimgray;
        }

        th, td{
            padding: 10px;
            border-bottom: 1px solid lightgray;
            border-top: 1px solid lightgray;
        }

        input{
           border: 1px solid lightgray; 
        }

        select{
            border: 1px solid lightgray;
        }

        p{
            font-size: 0.875em;
            margin-left: 270px;
        }

        span{
            font-size: 0.875em;
        }
        
        #reset{
            width: 120px; 
            background-color: peru;
            color: white;
        }
        
        </style>
        
       
		
    </head>
     <body>
 <!-- navbar (sit on top) -->
	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card-2">
			<a href="/" class="w3-bar-item w3-button w3-hover-none" id="nav">KMLP</a>
		</div>
	</div>
<!-- navbar end -->

<!-- page content -->
	<div class="w3-main w3-mobile" style="margin-left: 50px; margin-right: 50px">
	
<!-- top start -->
	<div class="w3-container w3-padding-24 w3-border-bottom w3-border-light-grey" id="top"><br>
		<h2 style="color: #4D4D4D">
			<b>Sign Up</b>
		</h2>
	</div>
<!-- top end -->

<!-- body start -->
<div class="container" id="sign">
	<form id="login" name="login" method="post" action="login" onsubmit="return checkValue()">
    <h5><b><i class="fa fa-edit" style="font-size:24px; color:sienna;"></i>&nbsp;사원가입</b></h5>
	<table align="center">
                   <tr>
			<th>부 서 명</th>
			<td><input type="text" id=" m_dept " name=" m_dept " style="width:150px; height:32px"></td>
		</tr>
        <th>직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</th>
			<td><input type="text" id=" m_dept " name=" m_dept " style="width:150px; height:32px"></td>
		</tr>
        <tr>
			<th>사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번</th>
			<td><input type="text" id="m_posit" name="m_posit" style="width:150px; height:32px"></td>
		</tr>
 
        	<tr>
			<th>사 원 명</th>
			<td><input type="text" id="m_name" name="m_name" style="width:150px; height:32px"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="m_pwd " name="m_pwd " style="width:150px; height:32px" maxlength="10">
            &nbsp;&nbsp;<span>(“영문+숫자+특수문자” 조합으로 2종류 이상은 10자리, 3종류 이상은 9자리 이상)</span></td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td><input type="password" id="m_pwd_chk" name="m_pwd_chk" style="width:150px; height:32px" maxlength="10"></td>
		</tr>

		<tr>
			<th>입사년도</th>
			<td><select id="m_com_year" name="m_com_year" style="width:120px; height:32px">
                <option value="1900" >1900년</option>
		                    <option value="1901" >1901년</option>
		                    <option value="1902" >1902년</option>
		                    <option value="1903" >1903년</option>
		                    <option value="1904" >1904년</option>
		                    <option value="1905" >1905년</option>
		                    <option value="1906" >1906년</option>
		                    <option value="1907" >1907년</option>
		                    <option value="1908" >1908년</option>
		                    <option value="1909" >1909년</option>
		                    <option value="1910" >1910년</option>
		                    <option value="1911" >1911년</option>
		                    <option value="1912" >1912년</option>
		                    <option value="1913" >1913년</option>
		                    <option value="1914" >1914년</option>
		                    <option value="1915" >1915년</option>
		                    <option value="1916" >1916년</option>
		                    <option value="1917" >1917년</option>
		                    <option value="1918" >1918년</option>
		                  
		                    <option value="1919" >1919년</option>
		                  
		                    <option value="1920" >1920년</option>
		                  
		                    <option value="1921" >1921년</option>
		                  
		                    <option value="1922" >1922년</option>
		                  
		                    <option value="1923" >1923년</option>
		                  
		                    <option value="1924" >1924년</option>
		                  
		                    <option value="1925" >1925년</option>
		                  
		                    <option value="1926" >1926년</option>
		                  
		                    <option value="1927" >1927년</option>
		                  
		                    <option value="1928" >1928년</option>
		                  
		                    <option value="1929" >1929년</option>
		                  
		                    <option value="1930" >1930년</option>
		                  
		                    <option value="1931" >1931년</option>
		                  
		                    <option value="1932" >1932년</option>
		                  
		                    <option value="1933" >1933년</option>
		                  
		                    <option value="1934" >1934년</option>
		                  
		                    <option value="1935" >1935년</option>
		                  
		                    <option value="1936" >1936년</option>
		                  
		                    <option value="1937" >1937년</option>
		                  
		                    <option value="1938" >1938년</option>
		                  
		                    <option value="1939" >1939년</option>
		                  
		                    <option value="1940" >1940년</option>
		                  
		                    <option value="1941" >1941년</option>
		                  
		                    <option value="1942" >1942년</option>
		                  
		                    <option value="1943" >1943년</option>
		                  
		                    <option value="1944" >1944년</option>
		                  
		                    <option value="1945" >1945년</option>
		                  
		                    <option value="1946" >1946년</option>
		                  
		                    <option value="1947" >1947년</option>
		                  
		                    <option value="1948" >1948년</option>
		                  
		                    <option value="1949" >1949년</option>
		                  
		                    <option value="1950" >1950년</option>
		                  
		                    <option value="1951" >1951년</option>
		                  
		                    <option value="1952" >1952년</option>
		                  
		                    <option value="1953" >1953년</option>
		                  
		                    <option value="1954" >1954년</option>
		                  
		                    <option value="1955" >1955년</option>
		                  
		                    <option value="1956" >1956년</option>
		                  
		                    <option value="1957" >1957년</option>
		                  
		                    <option value="1958" >1958년</option>
		                  
		                    <option value="1959" >1959년</option>
		                  
		                    <option value="1960" >1960년</option>
		                  
		                    <option value="1961" >1961년</option>
		                  
		                    <option value="1962" >1962년</option>
		                  
		                    <option value="1963" >1963년</option>
		                  
		                    <option value="1964" >1964년</option>
		                  
		                    <option value="1965" >1965년</option>
		                  
		                    <option value="1966" >1966년</option>
		                  
		                    <option value="1967" >1967년</option>
		                  
		                    <option value="1968" >1968년</option>
		                  
		                    <option value="1969" >1969년</option>
		                  
		                    <option value="1970" >1970년</option>
		                  
		                    <option value="1971" >1971년</option>
		                  
		                    <option value="1972" >1972년</option>
		                  
		                    <option value="1973" >1973년</option>
		                  
		                    <option value="1974" >1974년</option>
		                  
		                    <option value="1975" >1975년</option>
		                  
		                    <option value="1976" >1976년</option>
		                  
		                    <option value="1977" >1977년</option>
		                  
		                    <option value="1978" >1978년</option>
		                  
		                    <option value="1979" >1979년</option>
		                  
		                    <option value="1980" >1980년</option>
		                  
		                    <option value="1981" >1981년</option>
		                  
		                    <option value="1982" >1982년</option>
		                  
		                    <option value="1983" >1983년</option>
		                  
		                    <option value="1984" >1984년</option>
		                  
		                    <option value="1985" >1985년</option>
		                  
		                    <option value="1986" >1986년</option>
		                  
		                    <option value="1987" >1987년</option>
		                  
		                    <option value="1988" >1988년</option>
		                  
		                    <option value="1989" >1989년</option>
		                  
		                    <option value="1990" >1990년</option>
		                  
		                    <option value="1991" >1991년</option>
		                  
		                    <option value="1992" >1992년</option>
		                  
		                    <option value="1993" >1993년</option>
		                  
		                    <option value="1994" >1994년</option>
		                  
		                    <option value="1995" >1995년</option>
		                  
		                    <option value="1996" >1996년</option>
		                  
		                    <option value="1997" >1997년</option>
		                  
		                    <option value="1998" >1998년</option>
		                  
		                    <option value="1999" >1999년</option>
		                  
		                    <option value="2000" selected="selected">2000년</option>
		                  
		                    <option value="2001" >2001년</option>
		                  
		                    <option value="2002" >2002년</option>
		                  
		                    <option value="2003" >2003년</option>
		                  
		                    <option value="2004" >2004년</option>
		                  
		                    <option value="2005" >2005년</option>
		                  
		                    <option value="2006" >2006년</option>
		                  
		                    <option value="2007" >2007년</option>
		                  
		                    <option value="2008" >2008년</option>
		                  
		                    <option value="2009" >2009년</option>
		                  
		                    <option value="2010" >2010년</option>
		                  
		                    <option value="2011" >2011년</option>
		                  
		                    <option value="2012" >2012년</option>
		                  
		                    <option value="2013" >2013년</option>
		                  
		                    <option value="2014" >2014년</option>
		                    <option value="2015" >2015년</option>
		                    <option value="2016" >2016년</option>
		                    <option value="2017" >2017년</option>
            </select>&nbsp;
            <select id="m_com_month" name="m_com_month" style="width:120px; height:32px">
                <option value="1" selected>1월</option>
                <option value="2">2월</option>
                <option value="3">3월</option>
                <option value="4">4월</option>
                <option value="5">5월</option>
                <option value="6">6월</option>
                <option value="7">7월</option>
                <option value="8">8월</option>
                <option value="9">9월</option>
                <option value="10">10월</option>
                <option value="11">11월</option>
                <option value="12">12월</option>
            </select>&nbsp;
            <select id="m_com_date" name="m_com_date" style="width:120px; height:32px">
                <option value="1" selected>1일</option>
                <option value="2">2일</option>
                <option value="3">3일</option>
                <option value="4">4일</option>
                <option value="5">5일</option>
                <option value="6">6일</option>
                <option value="7">7일</option>
                <option value="8">8일</option>
                <option value="9">9일</option>
                <option value="10">10일</option>
                <option value="11">11일</option>
                <option value="12">12일</option>
                <option value="13">13일</option>
                <option value="14">14일</option>
                <option value="15">15일</option>
                <option value="16">16일</option>
                <option value="17">17일</option>
                <option value="18">18일</option>
                <option value="19">19일</option>
                <option value="20">20일</option>
                <option value="21">21일</option>
                <option value="22">22일</option>
                <option value="23">23일</option>
                <option value="24">24일</option>
                <option value="25">25일</option>
                <option value="26">26일</option>
                <option value="27">27일</option>
                <option value="28">28일</option>
                <option value="29">29일</option>
                <option value="30">30일</option>
                <option value="31">31일</option>
            </select>
            </td>
		</tr>
        
		<tr>
			<th>이 메 일</th>
			<td>
                <input type="text" id="m_email_id" name="m_email_id" style="width:150px; height:32px">&nbsp;@&nbsp;
	            <input type="text" id=" m_email_do" name=" m_email_do" style="width:150px; height:32px">&nbsp;
	            <select id="email_select" name="email_select" style="width:150px; height:32px" onChange="emailChoice(this.value, this.form.email2);">
	                <option value="" selected>선택하세요</option>
	                <option value="hotmail.com">hotmail.com</option>
	                <option value="nate.com">nate.com</option>
	                <option value="naver.com">naver.com</option>
	                <option value="hanmail.net">hanmail.net</option>
	                <option value="daum.net">daum.net</option>
	                <option value="chollian.net">chollian.net</option>
	                <option value="dreamwiz.com">dreamwiz.com</option>
	                <option value="yahoo.co.kr">yahoo.co.kr</option>
	                <option value="gmail.com">gmail.com</option>
	                <option value="">직접입력</option>
	            </select>
            
                </td>
		</tr>
		
		<tr>
			<th>휴 대 폰</th>
			<td><select id="m_cell" name="m_cell" style="width:110px; height:32px">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                </select>
                &nbsp;-&nbsp;<input type="text" id="cell2" name="cell2" style="width:110px; height:32px">
                &nbsp;-&nbsp;<input type="text" id="cell3" name="cell3" style="width:110px; height:32px"></td>
		</tr>
	</table>
    <br>
      
       
        <br>
        
	        <div align="center">
		        <input type="submit" id="submit" class="w3-button w3-blue-grey" value="확 인" style="width:120px;">
		        &nbsp;&nbsp;&nbsp;&nbsp;
		        <input type="reset" id="reset" class="w3-button" value="초기화" >
	        </div>
	 </form>
</div>      
<!-- body end -->
</div>
<br><br>	
</body>
</html>