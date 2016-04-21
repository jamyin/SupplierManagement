<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<title>模拟dialog效果</title>  
<!--引入jquery类库-->  
<script language="javascript" type="text/javascript" src="../js/jquery-1.8.3.js"></script>  
<!--引入Css样式类库文件-->  
<link rel="stylesheet" href="jquery-ui-1.8.18.custom.css" />  
<script language="javascript" type="text/javascript">  
$(function (){  
      
        $("#dialog").dialog({  
               autoOpen:false,  //设置对话框打开的方式 不是自动打开  
               show:"blind",    //打开时的动画效果  
               hide:"explode",    //关闭是的动画效果  
               modal:true,          //true代表运用遮罩效果  
/*             buttons:{        //添加按钮的操作  
                   "确定":function (){  
                            $(this).dialog("close");//关闭对话框  
                       },  
                    "取消":function (){  
                            $(this).dialog("close");  
                        }  
                     
                   },  
                   //上边是第一种方式  
                     
                   //下边是第二种方式  
                   */  
                buttons:[  
                    {  
                        text:"Ok",  
                        click:function (){  
                            $(this).dialog("close");//关闭对话框  
                        }  
                    },  
                        {  
                        text:"取消",  
                        click:function (){  
                            $(this).dialog("close");//关闭对话框  
                        }  
                    }],  
                draggable:false,   //是否可以拖动的效果  true可以拖动  默认值是true    ，false代表不可以拖动  
                closeOnEscape:false,   //是否采用esc键退出对话框，如果为false则不采用 ，true则采用  
                title:"添加用户操作",    //对话框的标题  
                position:"top",         //对话框打开的位置，默认center，有top、left、right、center、bottom  
                width:600,      //设置对话框的宽度  
                height:300,     //设置对话框的高度  
                resizable:false,   //是否可以改变对话框的尺寸的操作，默认true           
                zIndex:1000,    //层叠效果  
                drag:function(event,ui){  
                        //可以测试出 对话框当前的坐标位置  
                          
                    }  
            });  
          
        //触发连接的事件   当你点击 连接  打开一个对话框  
        $("#dialog_link").click(function (){  
              
            $("#dialog").dialog("open");  //open参数  作用  打开对话框  
            });  
          
        //我怎么获取 我设置的options中的参数值  
        var modalValue = $("#dialog").dialog("option","modal");  
        alert(modalValue);  
          
        //我怎么设置options中的参数值  
        $("#dialog").dialog("option","modal",false);  
    });  
  
  
  
</script>  
</head>  
  
<body>  
    <h2>模拟dialog效果</h2>  
    <!--创建一个连接-->  
    <a href="javascript:void(0)" id="dialog_link"><span></span>open dialog</a>  
      
    <!--注册一个div  $("#dialog").dialog(); 它就成了一个对话框 在页面中就会隐藏-->  
    <div id="dialog" title="hi!">  
            hello world!  
    </div>  
</body>
</html>
