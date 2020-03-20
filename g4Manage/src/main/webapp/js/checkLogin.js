function checkLogin(uId){
            if(uId==null||uId==""){
                alert("当前未登录，请登录后再尝试");
                window.location.href="http://localhost:8080/";
                return false;
            }
    };


