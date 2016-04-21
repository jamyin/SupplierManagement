<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'rightPage.jsp' starting page</title>
    <style type="text/css">
    	.current {
			padding-right: 5px;  
			padding-left: 5px; 
			font-weight: bold; 
			padding-bottom: 2px; 
			color: #fff; 
			margin-right: 2px; 
			padding-top: 2px;
			background-color: #2e6ab1;
		}
	
		a {
			text-decoration :none;
		}
    </style>
    <script type="text/javascript">
    	function showPages() {
		
			var totalPage = document.getElementById("totalPage").value;
			var currentPage = document.getElementById("currentPage").value;
			
			for(var i=0; i < totalPage.length; i++) {
			
				var aChart = totalPage.substring(i,i+1);
				
				//判断一下输入的totalPage有没有空格
				if(aChart == " ") {
					alert("请去除空格！");
					document.getElementById("totalPage").focus();
					return false;
				}
				
				//判断输入的有没有不是数字
				if(isNaN(aChart)) {
					//当aChart不是数字时，返回true
					alert("请输入数字");
					document.getElementById("totalPage").focus();
					//document.getElementById("totalPage").value = " ";
					return false;
				} 
			}
			
			for(var i=0; i < currentPage.length; i++) {
				var aChart = currentPage.substring(i,i+1);
				
				//判断一下输入的currentPage有没有空格
				if(aChart == " ") {
					alert("请去除空格");
					document.getElementById("currentPage").focus();
					return false;
				}
				
				//判断一下输入的字符有没有非数字
				if(isNaN(aChart)) {
					alert("请输入数字");
					document.getElementById("currentPage").focus();
					return false;
				}
			}
			
			//判断一下totalPage和currentPage的大小
			if(parseInt(totalPage) < parseInt(currentPage)) {
				alert("当前页必须不能大于总的页数！！");
				//document.getElementById("totalPage").value = " ";
				document.getElementById("currentPage").value = " ";
				document.getElementById("currentPage").focus();
				return false;
			}
			
			//显示相应的页数
			document.getElementById("pages").innerHTML = getPageBar(parseInt(totalPage),parseInt(currentPage));
			
			//alert(totalPage+currentPage);
		}
		
		/*
		 * totalPage - 总的页数
		 * pageNo - 当前页
		 * 
		 * */
		function getPageBar(totalPage,pageNo){
		   var pageBar="";
		   if(totalPage>1){
			//如果总的页数大于1，即从后来返回的list集合含有内容。  
			if(totalPage<=6){
				  //pageBar="<a href=\"JavaScript:void(0)\" onclick=\"pageup()\">&lt;</a>";
				  //如果总的页数小于6
				   for(var i=1;i<=totalPage;i++){
					   if(pageNo==i){
						   //对于当前页要特殊显示
						   pageBar+="<span class=\"current\">"+i+"</span>&nbsp;";
					   }else{
						   pageBar+="<a href=\"#\" onclick=\"go("+i+","+totalPage+")\">"+i+"</a>&nbsp;";
					   }
				   }
				  //pageBar+="<a href=\"JavaScript:void(0)\" onclick=\"pagedown()\">&gt;</a>";
			}else{
				//如果总的页数大于6
				
				if(pageNo>1){
					//如果当前页大于1，要让向前的标识 “<” 显示出来
					pageBar+="<a href=\"JavaScript:void(0)\" onclick=\"pageup()\">&lt;</a>&nbsp;";
				}
				var start=pageNo;
				var add=5;
				if(pageNo<5){
					//如果当前页小于5，即1，2，3，4
					start=1;
					add=add-start;
				}else{
					//如果当前页大于5
					start=pageNo-2;
					add=2;
					//让第一页显示
					pageBar+="<a href=\"#\" onclick=\"go(1,"+totalPage+")\">1</a>&nbsp;";
					
					pageBar+="...";
				}
				
				var end = pageNo+add;
				if(end>totalPage){
					end=totalPage;
				}
				if((end-pageNo)>2){
					end=pageNo+2;
				}
				if(end>add){
				 if(end-start<add){
					start=end-add;
				 }
				}
				
				for(var i=start;i<=end;i++){
					   if(pageNo==i){
						   pageBar+="<span class=\"current\">"+i+"</span>&nbsp;";
					   }else{
						   pageBar+="<a href=\"#\" onclick=\"go("+i+","+totalPage+")\">"+i+"</a>&nbsp;";
					   }
				}
				if(totalPage-end>0){
					if(totalPage-end>1){
					  pageBar+="...";
					}
				pageBar+="<a href=\"#\" onclick=\"go("+totalPage+","+totalPage+")\">"+totalPage+"</a>&nbsp;";
				}
				if(pageNo<totalPage){
					//如果当前页不是最后一页，让向后的页面的标识 ">" 显示。
					pageBar+="<a href=\"JavaScript:void(0)\" onclick=\"pagedown()\">&gt;</a>";
				}
			 }
			}
		   /*
			* 返回pageBar
			* */
			return pageBar;
		}
		
		/*
			通过页码进入相应的页面。
		*/
		function go(currentPage,totalPage) {
			document.getElementById("currentPage").value = currentPage;
			document.getElementById("pages").innerHTML = getPageBar(totalPage,currentPage);
		}
		/*
			下一页
		*/
		function pagedown() {
			var currentPage = document.getElementById("currentPage").value;
			var totalPage = document.getElementById("totalPage").value;
			document.getElementById("currentPage").value = parseInt(currentPage) +1;
			document.getElementById("pages").innerHTML = getPageBar(totalPage,parseInt(currentPage)+1);
		}

		/*
			上一页
		*/
		function pageup() {
			var currentPage = document.getElementById("currentPage").value;
			var totalPage = document.getElementById("totalPage").value;
			document.getElementById("currentPage").value = parseInt(currentPage) - 1;
			document.getElementById("pages").innerHTML = getPageBar(totalPage,parseInt(currentPage)-1);
		}
    </script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   总的页数：<input type="text" id="totalPage"/><br/>
	&nbsp;&nbsp;当前页：<input type="text" id="currentPage"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" style="cursor:pointer" value="showPages" onclick="showPages()"/>
	<br/><br/>
	
	<div id="pages"></div>
  </body>
</html>
