<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Jquery弹出层插件 - Jquery-school</title>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../jsp/manhuaDialog.1.0.js"></script>
<script type="text/javascript">
	/* $(document).ready(function(){
	  $("#hide").click(function(){
	  $("p").hide(1000);
	  });
	  $("#show").click(function(){	
	  $("p").show(1000);
	  });
	}); */

$(document).ready(function(){
  $("button").click(function(){
  $("p").toggle();
  });
});

$(document).ready(function(){
$(".flip").click(function(){
    $(".panel").slideToggle("slow");
  });
});

/* $(document).ready(function(){
  $("h3").click(function(){
    $("div").animate({left:'250px'});
  });
}); */

$(document).ready(function(){
$("h3").click(function(){
  $("div").animate({
    left:'250px',
    opacity:'0.5',
    height:'+=150px',
    width:'+=150px'
  });
}); 
});

$(document).ready(function(){
  $("#first").click(function(){
    var div=$("a");  
    div.animate({left:'100px'},"slow");
    div.animate({fontSize:'3em'},"slow");
  });
});
</script>
 
<style type="text/css"> 
div.panel,p.flip
{
margin:0px;
padding:5px;
text-align:center;
background:#e5eecc;
border:solid 1px #c3c3c3;
}
div.panel
{
height:120px;
display:none;
}
</style>
</head>
<body>
<!-- <button type="button" id="hide">隐藏</button><button type="button" id="show">显示</button>
<p>这是一个段落。</p>
<p>这是另一个段落。</p>
<p>这个片段，我们需要你自动实现</p> -->

<button type="button">切换</button>
<p>这是一个段落。</p>
<p>这是另一个段落。</p>

<div class="panel">
<p>W3School - 领先的 Web 技术教程站点</p>
<p>在 W3School，你可以找到你所需要的所有网站建设教程。</p>
</div>

<p class="flip">请点击这里</p>

<h3>点击这里，开始动画</h3>
<p>默认情况下，所有 HTML 元素的位置都是静态的，并且无法移动。如需对位置进行操作，记得首先把元素的 CSS position 属性设置为 relative、fixed 或 absolute。</p>
<div style="background:#98bf21;height:100px;width:100px;position:absolute;">
</div>
<br /><br /><br /><br /><br /><br />
<p><button id="first">开始动画</button></p>
<p>默认情况下，所有 HTML 元素的位置都是静态的，并且无法移动。如需对位置进行操作，记得首先把元素的 CSS position 属性设置为 relative、fixed 或 absolute。</p>
<a style="background:#98bf21;height:100px;width:200px;position:absolute;">HELLO</a>
</body>
</html>