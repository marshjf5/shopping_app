// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function check(id){
    for(i=1;i<=id;i++){
        var amount = $("num"+i).value;
        var order_sum = $("value"+i).value;
        if (parseInt(amount)<parseInt(order_sum)){
            alert("第"+i+"件商品库存不足啦~请重新输入一下数量哦~~(剩余库存： "+amount+" )");
            return false;
        }
    }
    return true;
}              