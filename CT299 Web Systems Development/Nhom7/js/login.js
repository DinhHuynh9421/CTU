/*Đăng nhập*/

function dangnhap(){
    var frm=document.forms['form'];
    var hten= frm.hten.value;
    var pw=frm.pw.value;
    var user = localStorage.getItem(hten);
    var data= JSON.parse(user);

    if(hten.length <= 0 ||  pw.lenght <= 0){
        alert("Vui lòng nhập tên tài khoản và mật khẩu");
        
    }
    else if(hten==data.hten && pw==data.pw){
        alert("Đăng nhập thành công");
        frm.action = "user.html";
    }
    else {
        alert("Đăng nhập thất bại");
        
    }   

}
