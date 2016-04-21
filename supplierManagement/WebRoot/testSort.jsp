<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'testSort.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
			$(function(){
				$(".pclass").bind('click',function(){
					var proVal = $(this).children(":selected").text();
					var cityVal = $(this).next().children(":selected").text();
				});
				$(".cclass").bind('click',function(){
					var proVal = $(this).prev().children(":selected").text();
					var cityVal = $(this).children(":selected").text();
				});
			});
		</script>
	<script type="text/javascript">
		$(function()){
			$(".bigSort").bind('click',function(){
					var proVal = $(this).children(":selected").text();
					var cityVal = $(this).next().children(":selected").text();
				});
			$(".sort").bind('click',function(){
					var proVal = $(this).prev().children(":selected").text();
					var cityVal = $(this).children(":selected").text();
				});
		}
		
		var bigSort = {
			'服务':['筹划','外烩','场地','摄影'],
			'礼品':['大礼品','小礼品'],
			'食品':['熟食','冷冻'],
			'公共关系':['媒体','政府机构','民间组织','赞助商']
		};
		
		
		$(function(){
			for(var p in bigSort){
				$("<option />",{value:p, text:p}).appendTo("#bigSort");
			};
			$(bigSort['服务']).each(function(i){
				$("<option />",{value:this, text:this}).appendTo("#sort");
			});
			$("#bigSort").change(function(){
				$("#sort").html('');
				$(bigSort[this.value]).each(function(j){
					$("<option />",{value:this, text:this}).appendTo("#sort");
				});
			});
		});
		
		var province={
			'北京':['北京'],'天津':['天津'],
			'上海':['上海'],'重庆':['重庆']};
			
		$(function(){
			//all provinces
			for(var p in province){
				$("<option />",{value:p, text:p}).appendTo("#provinces");
			};
			//default city
			$(province['北京']).each(function(i){
				$("<option />",{value:this, text:this}).appendTo("#cities");
			});
			//change province
			$("#provinces").change(function(){
				$("#cities").html('');//clear city's select
				//get this province's cities
				$(province[this.value]).each(function(j){
					$("<option />",{value:this, text:this}).appendTo("#cities");
				});
			});
		});
	</script>
	<style type="text/css">
		select {width:100px;}
	</style>

  </head>
  <body>
  	供应商类别：<select id="bigSort" class="bigSort"></select> <select id="sort" class="sort"></select>&nbsp;&nbsp;&nbsp;&nbsp;<label></label><br>
  	<select id='provinces' class="pclass"></select> 省 <select id='cities' class="cclass"></select> 市 &nbsp;&nbsp;&nbsp;&nbsp;<br>
  </body>
</html>
