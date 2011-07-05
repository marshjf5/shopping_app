// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function get_package(commodity_id) {
    var num = document.getElementById("num"+commodity_id).value;
    var n = $("amount"+commodity_id).value;
    if(parseInt(n)<parseInt(num)){
        alert ("库存不足，请重新输入购买数量");
//        document.getElementById("emailErr").innerHTML="<font color = 'red'>库存不足，请重新输入购买数量</font>";
        return false;
    }

        window.location.href = "/suppliers/"+ commodity_id +"/package?num=" + num;
}