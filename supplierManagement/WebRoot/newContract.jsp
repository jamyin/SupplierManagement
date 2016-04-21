<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>合同详细页</title>
    <style type="text/css">
    	td{
    		height: 30px;
    	}
    	input {
			border:1px solid; border-color: #CCC #EEE #EEE #CCC;
			height: 30px;
		}
    </style>
    <script type="text/javascript">
    $(document).ready(function(){
    //找到所有td节点
    var tds = $("td");
    //给所有的td节点增加点击事件
    tds.click(tdclick);
	});
    
    function tdclick(){
    var clickfunction = this;
    //0,获取当前的td节点
    var td = $(this);
    //1,取出当前td中的文本内容保存起来
    var text = $(this).text();
    //2，清空td里边内同
    td.html("");
    //3,建立一个文本框，也就是建一个input节点
    var input = $("<input>");
    //4,设置文本框中值是保存起来的文本内容
    input.attr("value",text);
    //4.5让文本框可以相应键盘按下的事件
    input.keyup(function(event){
        //记牌器当前用户按下的键值
        var myEvent = event || window.event;//获取不同浏览器中的event对象
        var kcode = myEvent.keyCode;
        //判断是否是回车键按下
        if(kcode == 13){
            var inputnode = $(this);
            //获取当前文本框的内容
            var inputext = inputnode.val();
            //清空td里边的内容,然后将内容填充到里边
            var tdNode = inputnode.parent();
            tdNode.html(inputext);
            //让td重新拥有点击事件
            tdNode.click(tdclick);
        }
    });
    //5，把文本框加入到td里边去
    td.append(input);
    //5.5让文本框里边的文章被高亮选中
    //需要将jquery的对象转换成dom对象
    var inputdom = input.get(0);
    inputdom.select();
   
    //6,需要清楚td上的点击事件
    td.unbind("click");
}
    </script>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
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
	<h3>合同详细页面展示</h3>
	<table width="90%" align="center" border="1" cellpadding="1" cellspacing="1">
		<s:if test="contract!=null">
			<s:iterator value="contract" var="contract" status="sta">
				<tr>
					<th scope="col">合同编号：<input name="contract.contractId" type="text"
						value="<s:property value="#contract.contractId"/>"
						readonly="readonly" />
					</th>
					<th scope="col">合同名称：<input name="contract.contractName" type="text"
						value="<s:property value="#contract.contractName"/>">
					</th>
					<th scope="col">操作员：<input name="contract.operator" type="text"
						value="<s:property value="#contract.operator"/>">
					</th>
					<th scope="col">&nbsp;</th>
				</tr>
				<tr>
					<td colspan="2">合同甲方：<input name="contract.partyA" type="text"
						value="<s:property value="#contract.partyA"/>">
					</td>
					<td colspan="2">合同乙方：<input name="contract.partyB" type="text"
						value="<s:property value="#contract.partyB"/>">
					</td>
				</tr>
				<tr>
					<td colspan="2">甲方责任人：<input name="contract.partyAprincincipal" type="text"
						value="<s:property value="#contract.partyAprincipal"/>">
					</td>
					<td colspan="2">乙方责任人：<input name="contract.partyBprincipal" type="text"
						value="<s:property value="#contract.partyBprincipal"/>">
					</td>
				</tr>
				<tr>
					<td>收付类型：<input type="text" name="contract.receiptsPaymentType"
						value="<s:property value="#contract.receiptsPaymentType"/>">
					</td>
					<td>支付方式：<input type="text" name="contract.payway"
						value="<s:property value="#contract.payway"/>">
					</td>
					<td>币种：<input type="text" name="contract.currency"
						value="<s:property value="#contract.currency"/>">
					</td>
					<td>合同总价：<input type="text" name="contract.contractPrice"
						value="<s:property value="#contract.contractPrice"/>">
					</td>
				</tr>
				<tr>
					<td>业&nbsp;务&nbsp;员：<input type="text" name="contract.contractPrice"
						value="<s:property value="#contract.contractPrice"/>">
					</td>
					<td>责任部门：<input type="text" name="contract.contractPrice"
						value="<s:property value="#contract.contractPrice"/>">
					</td>
					<td colspan="2">所属项目：<input type="text" name="contract.project"
						value="<s:property value="#contract.project"/>">
					</td>
				</tr>
				<tr>
					<td colspan="4">合同内容：<input type="text" name="contract.contractContent"
						value="<s:property value="#contract.contractContent"/>">
					</td>
				</tr>
				<tr>
					<td colspan="4">合同备注：<input type="text" name="contract.contractRemark"
						value="<s:property value="#contract.contractRemark"/>">
					</td>
				</tr>
				<tr>
					<td>登记日期：<input type="text" name="contract.registerDate"
						value="<s:property value="#contract.registerDate"/>">
					</td>
					<td>签订日期：<input type="text" name="contract.signDate"
						value="<s:property value="#contract.signDate"/>">
					</td>
					<td>开始日期：<input type="text" name="contract.startDate"
						value="<s:property value="#contract.startDate"/>">
					</td>
					<td>截止日期：<input type="text" name="contract.endDate"
						value="<s:property value="#contract.endDate"/>">
					</td>
				</tr>
				<tr>
					<td colspan="2">单位名称：<input type="text" name="contract.companyName"
						value="<s:property value="#contract.companyName"/>">
					</td>
					<td colspan="2">供应商名称：<input type="text" name="contract.spplierName"
						value="<s:property value="#contract.spplierName"/>">
					</td>
				</tr>
				<tr>
					<td colspan="2">合同状态：<select name="contract.contractState" width="30">
							<option value="合格">合格</option>
							<option value="不合格">不合格</option>
							<option value="带审核">待审核</option>
					</select>
					</td>
					<td colspan="2">附件：<s:property value="#contract.attachment" />
					</td>
				</tr>
				<tr>
				<td colspan="4" align="center">
				<input class="input-button" onclick="tdclick()" type="button" value="修改" />
				<input class="input-button" onclick="" type="button" value="保存" />
				<input class="input-button" type="button" value="返回" />
				</td>
				</tr>
			</s:iterator>
		</s:if>
	</table>
</body>
</html>
