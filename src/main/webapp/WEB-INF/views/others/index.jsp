<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>로그인</title>
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
		<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link rel="stylesheet" href="pages/css/style.css">
</head>
<body> 
<div class="container">
           
            <header>
                <h1>로그인을 해주세요</h1>
				
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="login" method="post"> 
                                <h1>로그인</h1> 
                                <p> 
                                    <label for="username" class="uname" > 아이디를 입력해주세요 </label>
                                    <input id="username" name="username" required="required" type="text" placeholder="아이디를 입력해주세요"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd"> 패스워드를 입력해주세요 </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="패스워드를 입력해주세요" /> 
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">로그인 상태를 유지하겠습니다</label>
								</p>
                                <p class="login button"> 
                                   <a href="http://cookingfoodsworld.blogspot.in/" target="_blank" ></a>
								</p>
                                 <p> 
									<input type="submit" value="로그인하기"/> 
								</p>
                                <p class="change_link">
									아직 회원가입을 안하셨나요?
									<a href="#toregister" class="to_register">가입하기</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                            <form action="signup"  autocomplete="off" onsubmit="return fregisterform_submit(this);"> 
                                <h1> 가입하기 </h1> 
                                <p> 
                                    <label for="usernamesignup" class="uname" >이름을 입력해주세요</label>
                                    <input id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="예)홍길동" />
                                </p>
                                <p> 
                                    <label for="emailsignup" class="youmail"  > 아이디를 입력해주세요</label>
                                    <input id="emailsignup" name="emailsignup" required="required" type="text" placeholder="아이디를 입력해주세요"/> 
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" >패스워드를 입력해주세요 </label>
                                    <input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="패스워드를 입력해주세요"/>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" >패스워드를 다시 입력해주세요 </label>
                                    <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="패스워드를 다시 입력해주세요"/>
                                </p>
                                <p class="signin button"> 
									<input type="submit" value="등록하기"/> 
								</p>
                                <p class="change_link">  
									이미 회원이신가요? ?
									<a href="#tologin" class="to_register"> 로그인 화면으로 </a>
								</p>
                            </form>
                        </div>
						
                    </div>
                </div>  
            </section>
        </div>	
		
		
		
<script>
	  function fregisterform_submit(f)
	  {
		if(f.passwordsignup.value != f.passwordsignup_confirm.value) {
			alert("패스워드가 같지 않습니다.")
			f.passwordsignup.focus();
			return false;
		}
		return true;
	     
	  }
</script>
</body>
</html>