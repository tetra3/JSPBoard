  function fregisterform_submit(f)
  {

      if (f.w.value == "") {
          if (f.passwordsignup.value.length < 3) {
              alert("비밀번호를 3글자 이상 입력하십시오.");
              f.passwordsignup.focus();
              return false;
          }
      }

      if (f.passwordsignup.value != f.passwordsignup_confirm.value) {
          alert("비밀번호가 같지 않습니다.");
          f.passwordsignup_confirm.focus();
          return false;
      }

      if (f.mb_password.value.length > 0) {
          if (f.passwordsignup_confrim.value.length < 3) {
              alert("비밀번호를 3글자 이상 입력하십시오.");
              passwordsignup_confrim.focus();
              return false;
          }
      }

      // 이름 검사
      if (f.w.value=="") {
          if (f.usernamesignup.value.length < 1) {
              alert("이름을 입력하십시오.");
              f.usernamesignup.focus();
              return false;
          }

      }

  }
