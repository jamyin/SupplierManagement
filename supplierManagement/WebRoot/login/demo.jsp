<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<title>Jquery弹出层插件 - Jquery-school</title>
<!-- <link rel="stylesheet" type="text/css" href="../cs/manhuaDialog.1.0.css"/> -->
<style type="text/css">
	div.ex
{
background-color:#e5eecc;
padding:7px;
border:solid 1px #c3c3c3;
}
</style>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../jsp/manhuaDialog.1.0.js"></script>
<script type="text/javascript">
$(function (){
	$("#test").manhuaDialog({					       
		Event : "click",								//触发响应事件
		title : "用户注册",								//弹出层的标题
		type : "id",									//弹出层类型(text、容器ID、URL、Iframe)
		content : "detail",								//弹出层的内容获取(text文本、容器ID名称、URL地址、Iframe的地址)
		width : 500,									//弹出层的宽度
		height : 300,									//弹出层的高度	
		scrollTop : 200,								//层滑动的高度也就是弹出层时离顶部滑动的距离
		isAuto : false,									//是否自动弹出
		time : 2000,									//设置弹出层时间，前提是isAuto=true
		isClose : false,  								//是否自动关闭		
		timeOut : 5000									//设置自动关闭时间，前提是isClose=true	
	});
});

/* $(document).ready(function(){
  $("button").click(function(){
    $("#test1").hide();
  });
}); */

/* $(document).ready(function(){
  $("button").click(function(){
    $("#div1").fadeOut();
    $("#div2").fadeOut("slow");
    $("#div3").fadeOut(3000);
  });
});

$(document).ready(function(){
  $("button").click(function(){
    $("#div1").fadeIn();
    $("#div2").fadeIn("slow");
    $("#div3").fadeIn(3000);
  });
});
//自动识别并切换
$(document).ready(function(){
  $("button").click(function(){
    $("#div1").fadeToggle();
    $("#div2").fadeToggle("slow");
    $("#div3").fadeToggle(3000);
  });
});
//改变颜色，到达某一个颜色
$(document).ready(function(){
  $("button").click(function(){
    $("#div1").fadeTo("slow",0.15);
    $("#div2").fadeTo("slow",0.4);
    $("#div3").fadeTo("slow",0.7);
  });
});

$(document).ready(function(){
  $(".ex .hide").click(function(){
    $(this).parents(".ex").hide("slow");
  });
});

$(document).ready(function(){
  $("#btn1").click(function(){
    $("p").append(" <b>Appended text</b>.");
    $("p").css("background-color","green");
  });

  $("#btn2").click(function(){
    $("ol").append("<li>Appended item</li>");
  });
});

$(document).ready(function(){
  $("#b01").click(function(){
  $('#myDiv').load('../jquery/test1.txt');
  });
});

$(document).ready(function(){
  $("#hide").click(function(){
  $("p").hide();
  });
  $("#show").click(function(){
  $("p").show();
  });
}); */

$(document).ready(function(){
  $("#hide").click(function(){
  $("p").hide(1000);
  });
  $("#show").click(function(){
  $("p").show(1000);
  });
});
</script>

</head>
<body>
 
<center>
<a href="javascript:void(0)" id="test">弹出层插件测试</a>
</center>
<h2>This is a heading</h2>
	<p>This is a paragraph.</p>
	<p id="test1">This is another paragraph.</p>
	<button type="button">Click me</button>
<div id="detail" style="display:none;">
欢迎各位网友使用漫画弹出层插件<br/>
你需要很努力的工作，才能生存！
<form action="">
	帐号：<input type="text" name="user.userName"/><br/>
	密码：<input type="text" name="user.password"/><br />
	创建日期：<input type="text" name="user.careteDate"/><br/>
	用户权限：<input type="text" name="user.flag0"/><br/>
	<input type="submit" name="提交"/>
</form>

</div>

	<p>演示带有不同参数的 fadeOut() 方法。</p>
<button>点击这里，使三个矩形淡出</button>
<br><br>
<!-- <div id="div1" style="width:80px;height:80px;background-color:red;"></div>
<br>
<div id="div2" style="width:80px;height:80px;background-color:green;"></div>
<br>
<div id="div3" style="width:80px;height:80px;background-color:blue;"></div> -->

<!-- <h3>中国办事处</h3>
<div class="ex">
<button class="hide" type="button">隐藏</button>
<p>联系人：张先生<br /> 
北三环中路 100 号<br />
北京</p>
</div>

<h3>美国办事处</h3>
<div class="ex">
<button class="hide" type="button">隐藏</button>
<p>联系人：David<br /> 
第五大街 200 号<br />
纽约</p>
</div> -->


<!-- <p>This is a paragraph.</p>
<p>This is another paragraph.</p>
<ol>
<li>List item 1</li>
<li>List item 2</li>
<li>List item 3</li>
</ol>
<button id="btn1">追加文本</button>
<button id="btn2">追加列表项</button>

<div id="myDiv"><h2>通过 AJAX 改变文本</h2></div>
<button id="b01" type="button">改变内容</button>

<p id="p1">如果点击“隐藏”按钮，我就会消失。</p>
<button id="hide" type="button">隐藏</button>
<button id="show" type="button">显示</button> -->

<button type="button" id="hide">隐藏</button><button type="button" id="show">显示</button>
<p>这是一个段落。</p>
<p>这是另一个段落。</p>
</body>
</html>
