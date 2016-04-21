<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<HTML>
<HEAD>
	<TITLE> ZTREE DEMO - beforeEditName / beforeRemove / onRemove / beforeRename / onRename</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<script src="js/SpryTabbedPanels.js" type="text/javascript"></script>
	<link href="css/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="zTree_v3/css/demo.css" type="text/css">
	<link rel="stylesheet" href="zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="zTree_v3/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="zTree_v3/js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript" src="zTree_v3/js/jquery.ztree.exedit-3.5.js"></script>
	<SCRIPT type="text/javascript">
		var setting = {
			view: {
				addHoverDom: addHoverDom,
				removeHoverDom: removeHoverDom,
				selectedMulti: false
			},
			edit: {
				enable: true,
				editNameSelectAll: true,
				showRemoveBtn: showRemoveBtn,
				showRenameBtn: showRenameBtn
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeDrag: beforeDrag,
				beforeEditName: beforeEditName,
				beforeRemove: beforeRemove,
				beforeRename: beforeRename,
				onRemove: onRemove,
				onRename: onRename
			}
		};

		var zNodes =[
			{ id:0, pId:00, name:"供应商管理", open:true},
			{ id:01, pId:0, name:"实物供应商", open:false},
			{ id:011, pId:1, name:"食物"},
			{ id:012, pId:1, name:"机械"},
			{ id:02, pId:0, name:"虚拟供应商", open:false},
			{ id:021, pId:2, name:"传媒"},
			{ id:022, pId:2, name:"活动"},
			{ id:03, pId:0, name:"合格供应商", open:false},
			{ id:031, pId:3, name:"食物"},
			{ id:032, pId:3, name:"机械"},
			{ id:033, pId:3, name:"传媒"},
			{ id:034, pId:3, name:"活动"},
			{ id:04, pId:0, name:"待审核供应商", open:false},
			{ id:041, pId:4, name:"食物"},
			{ id:042, pId:4, name:"机械"},
			{ id:043, pId:4, name:"传媒"},
			{ id:044, pId:4, name:"活动"},
			{ id:05, pId:0, name:"其它供应商", open:false},
			{ id:051, pId:5, name:"人员"},
			{ id:052, pId:5, name:"物品"},
		];
		var log, className = "dark";
		function beforeDrag(treeId, treeNodes) {
			return false;
		}
		function beforeEditName(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.selectNode(treeNode);
			var flag = return confirm("确定要修改-- " + treeNode.name+" 吗？");
			if(flag){
				window.location.href = "addTypeNode.action"
			}
			
		}
		function beforeRemove(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.selectNode(treeNode);
			return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
			
		}
		function onRemove(e, treeId, treeNode) {
			showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		}
		function beforeRename(treeId, treeNode, newName, isCancel) {
			className = (className === "dark" ? "":"dark");
			showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
			if (newName.length == 0) {
				alert("节点名称不能为空.");
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				setTimeout(function(){zTree.editName(treeNode)}, 10);
				return false;
			}
			return true;
		}
		function onRename(e, treeId, treeNode, isCancel) {
			showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
		}
		function showRemoveBtn(treeId, treeNode) {
			return !treeNode.isFirstNode;
		}
		function showRenameBtn(treeId, treeNode) {
			return !treeNode.isLastNode;
		}
		function showLog(str) {
			if (!log) log = $("#log");
			log.append("<li class='"+className+"'>"+str+"</li>");
			if(log.children("li").length > 8) {
				log.get(0).removeChild(log.children("li")[0]);
			}
		}
		function getTime() {
			var now= new Date(),
			h=now.getHours(),
			m=now.getMinutes(),
			s=now.getSeconds(),
			ms=now.getMilliseconds();
			return (h+":"+m+":"+s+ " " +ms);
		}

		var newCount = 1;
		function addHoverDom(treeId, treeNode) {
			var sObj = $("#" + treeNode.tId + "_span");
			if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
			var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
				+ "' title='增加新节点' onfocus='this.blur();'></span>";
			sObj.after(addStr);
			var btn = $("#addBtn_"+treeNode.tId);
			if (btn) btn.bind("click", function(){
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
				return false;
			});
		};
		function removeHoverDom(treeId, treeNode) {
			$("#addBtn_"+treeNode.tId).unbind().remove();
		};
		function selectAll() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$("#selectAll").bind("click", selectAll);
		});
	</SCRIPT>
	<style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
	</style>
</HEAD>

<BODY>
<div>
<jsp:include page="head.jsp"></jsp:include>
</div>
<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div id="TabbedPanels1" class="TabbedPanels right">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0" >供应商信息&nbsp;&nbsp;</li>
    <li class="TabbedPanelsTab" tabindex="0" >合同信息&nbsp;&nbsp;</li>
    <li class="TabbedPanelsTab" tabindex="0" >产品信息&nbsp;&nbsp;</li>
    <li class="TabbedPanelsTab" tabindex="0" >联系人信息&nbsp;&nbsp;</li>
    <!-- <li class="TabbedPanelsTab" tabindex="0" >用户信息&nbsp;&nbsp;</li> -->
  </ul>
  
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent">
    <!-- 供应商信息 -->
    <jsp:include page="suppList.jsp"></jsp:include>
    </div>
    <div class="TabbedPanelsContent">
    <!-- 合同信息 -->
    <jsp:include page="contract.jsp"></jsp:include>
    </div>
     <div class="TabbedPanelsContent">
     <!-- 产品信息 -->
     <jsp:include page="goodsList.jsp"></jsp:include>
    </div>
  <div class="TabbedPanelsContent">
  <!-- 联系人信息 -->
  	<jsp:include page="contacterList.jsp"></jsp:include>
    </div>
    <%-- <div class="TabbedPanelsContent">
    <!-- 用户信息 -->
    	<jsp:include page="userList.jsp"></jsp:include>
    </div> --%>
  </div>
</div>
</div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
</BODY>
</HTML>