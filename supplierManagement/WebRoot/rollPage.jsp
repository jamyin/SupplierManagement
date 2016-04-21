<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="css/style.css" type="text/css"></link>
<script type="text/javascript">
	function page_nav(name,num) {
		window.location = name+".action?page.index=" + num;
	}

	function jump_to(name,pageno, totalPage) {

		var regexp = /^\d+$/;
		if (!regexp.test(pageno)) {
			alert("请输入正确的数字！");
			return false;
		}else if (pageno <= 0||pageno > totalPage) {
			alert("没有此页面！");
			return false;
		} else {
			page_nav(name,pageno);
		}
	}


</script>
<div class="page-bar">
		共${param.totalCount }条记录&nbsp;&nbsp; ${param.pageIndex
			}/${param.totalPage }页
		<c:if test="${param.pageIndex>1 }">
			<a href="javaScript:page_nav('${param.actionName}',1)" style="">首页</a>
			<a href="javaScript:page_nav('${param.actionName}',${param.pageIndex-1 })">上一页</a>
		</c:if>
		<c:if test="${param.pageIndex<(param.totalPage+0) }">
			<a href="javaScript:page_nav('${param.actionName}',${param.pageIndex+1 })">下一页</a>
			<a href="javaScript:page_nav('${param.actionName}',${param.totalPage })">最后一页</a>
		</c:if>
		&nbsp;&nbsp;
	<span class="page-go-form"><label>跳转至</label> <input type="text"
		name="inputPage" id="inputPage" class="page-key" />页
		<button type="button" class="page-btn"
			onClick='jump_to("${param.actionName}",document.getElementById("inputPage").value,${param.totalPage })'>GO</button>
	</span>
</div>
