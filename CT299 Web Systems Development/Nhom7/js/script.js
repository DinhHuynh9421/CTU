// Tìm kiếm

const suv = [
    "fortuner",
    "land cruiser",
    "corolla cross",
    "suv"
];

const sedan = [
    "camry",
    "vios",
    "altis",
    "sedan"
];
const hatchback = [
    "yaris",
    "hatchback"
];

const key = document.getElementById('key');
function tk() {
    
    const Value = key.value.trim();

    for (let i = 0; i < suv.length; i++) {
        if (Value.toLowerCase() === suv[i]) {
            alert('Đã tìm thấy thông tin bạn cần!');
            window.location = "SUV.html"
            return;
        }
    }
    
    for (let i = 0; i < sedan.length; i++) {
        if (Value.toLowerCase() === sedan[i]) {
            alert('Đã tìm thấy thông tin bạn cần!');
            window.location = "Sedan.html"
            return;
        }
    }
    for (let i = 0; i < hatchback.length; i++) {
        if (Value.toLowerCase() === hatchback[i]) {
            alert('Đã tìm thấy thông tin bạn cần!');
            window.location = "HatchBack.html"
            return;
        }
    }
    alert('Sản phẩm này cửa hàng hiện không có. Vui lòng nhập lại!');
    return;
}



/*Liên hệ*/

function lienhe(frm){
    
    var emailReg = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    var sdt = /[0-9]{9,12}$/;
    if (frm.hten.value.length < 4 ) {
        alert("Họ tên phải có độ dài tối thiểu là 4 ký tự");
        frm.hten.focus();
        return false;
    }
    if ( emailReg.test(frm.email.value) == false ){
        alert("Email không hợp lệ");
        frm.email.focus();
        return false;
    }
    if (sdt.test(frm.sdt.value) == false) {
        alert("Số điện thoại không hợp lệ");
        frm.sdt.focus();
        return false;
    }

    if (frm.nd.value.length < 10 ) {
        alert("Nội dung liên hệ phải có độ dài tối thiểu là 10 ký tự");
        frm.nd.focus();
        return false;
    }
    alert("Đã gửi dữ liệu");
    return true;
}

/*Đăng ký*/

function dangky(){
    var frm=document.forms['form'];
    var hten= frm.hten.value;
    var email=frm.email.value;
    var pw=frm.pw.value;

    var emailReg = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    
    if (hten.length < 4 ) {
        alert("Tên tài khoản phải có độ dài tối thiểu là 4 ký tự");
        return false;
    }
    if ( emailReg.test(email) == false ){
        alert("Email không hợp lệ");
        return false;
    }
    if(pw.length < 8){
        alert("Mật khẩu tối thiểu là 8 kí tự");
        return false;
    }
   
        var user= {
            hten: hten,
            email: email,
            pw: pw,
        };
        var json = JSON.stringify(user);
        localStorage.setItem(hten,json);
        alert("Đăng ký thành công");
        return true;
    
    
 
}


/*Đổi mật khẩu*/

function doimk(){
    var frm=document.forms['form'];
    var hten= frm.hten.value;
    var email=frm.email.value;
    var pw=frm.pw.value;
    var pw1=frm.pw1.value;
    var user1 = localStorage.getItem(hten);
    var data= JSON.parse(user1);
    if(hten.length == 0 || email.length == 0 || pw.length == 0 || pw1.length == 0){
        alert("Chưa nhập đủ nội dung");
        return;
    }
        
    if((hten == data.hten) && (email == data.email)){
        if(pw.length < 8){
            alert("Mật khẩu tối thiểu là 8 kí tự");
        }
        else if(pw1 != pw){
            alert("Mật khẩu không khớp");
        }
        else{
            alert("Đổi mật khẩu thành công");
            
            var user= {
                hten: hten,
                email: email,
                pw: pw,
            };
            var json = JSON.stringify(user);
            localStorage.setItem(hten,json);
        }
    }
    else{
        alert("Tài khoản chưa đăng ký");
    }       
   
}

/*Đăng ký nhận ưu đãi*/

function uudai(frm){
    var sdt = /[0-9]{9,12}$/;
    if (frm.hten.value.length < 4 ) {
        alert("Họ tên phải có độ dài tối thiểu là 4 ký tự");
        frm.hten.focus();
        return false;
    }
    if (sdt.test(frm.sdt.value) == false) {
        alert("Số điện thoại không hợp lệ");
        frm.sdt.focus();
        return false;
    }
}


