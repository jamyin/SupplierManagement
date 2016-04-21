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
    
    <title>合同修改页</title>
    <script type="text/javascript" src="kindeditor-4.1.10/jquery-1.8.0.min.js"></script>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script charset="utf-8" src="kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor-4.1.10/lang/zh_CN.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	

  </head>
  
  <body>
  	<form action="updateNewContract" method="post" >
  		<h4 align="center">修改合同</h4>
  		<table border="1" align="center"  bgcolor="#FFFFFF" style="color: black" bordercolor="#AAAAAA">
  			<s:if test="contract!=null">
  			<s:iterator value="contract" var="contract" status="sta">
  			<tr><td>
  				供&nbsp;应&nbsp;商：<select name="contract.supplierName">
   								<option><s:property value="#contract.supplierName"/></option>
   								<s:if test="supplierlist!=null">
   								<s:iterator value="supplierlist" var="supplier" status="sta">
   								<%-- <option value="contract.supplierId"><s:property value="#supplier.supplierId"/></option> --%>
   								<option><s:property value="#supplier.supplierName"/></option>
   								</s:iterator>
   								</s:if>
   							</select>
   			</td></tr>
   			<tr><td>
  			<input type="hidden" name="contract.contractId" value="<s:property value='#contract.contractId'/>" readonly="readonly"/>
  				合同名称：<input type="text" name="contract.contractName" value="<s:property value='#contract.contractName'/>" size="60"/>&nbsp;&nbsp;&nbsp;&nbsp;
  				操&nbsp;作&nbsp;员：<input type="text" name="contract.operator" value="<s:property value='#contract.operator'/>"/>
  			</td></tr>
  			<tr><td>
  				合同甲方：<input type="text" name="contract.partyA" value="<s:property value='#contract.partyA'/>" size="60"/>&nbsp;&nbsp;&nbsp;&nbsp;
  				合同乙方：<input type="text" name="contract.partyB" value="<s:property value='#contract.partyB'/>" size="60"/>
  			</td></tr>
  			<tr><td>
  			          所属项目：<input type="text" name="contract.project" value="<s:property value='#contract.project'/>" size="60"/>&nbsp;&nbsp;&nbsp;&nbsp;
  				合同总价：<input type="text" name="contract.contractPrice" value="<s:property value='#contract.contractPrice'/>"/>
   				
   			</td></tr>
  			<tr><td>
  				责任部门：<input type="text" name="contract.dept" value="<s:property value='#contract.dept'/>" size="60"/>&nbsp;&nbsp;&nbsp;&nbsp;
  				合同状态：<input type="text" name="contract.contractState" value="<s:property value='#contract.contractState'/>" readonly="readonly" size="20"/>
   						&nbsp;&nbsp;&nbsp;&nbsp;
   				业务员：<input type="text" name="contract.operationPerson" value="<s:property value='#contract.operationPerson'/>" size="20"/>
  			</td></tr>
   			<tr><td>
  				收付类型：<select name="contract.receiptsPaymentType">
   								<option><s:property value="#contract.receiptsPaymentType"/></option>
   								<option>现金</option>
   								<option>支票</option>
   								<option>赊帐</option>
   							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				付款方式：<select name="contract.payway">
   								<option><s:property value="#contract.payway"/></option>
   								<option>现金</option>
   								<option>13天</option>
   								<option>30天</option>
   								<option>支票</option>
   								<option>赊帐</option>
   							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				交易币种：<select name="contract.currency">
   								<option><s:property value="#contract.currency"/></option>
   								<option>人民币</option>
   								<option>美元</option>
   								<option>日元</option>
   							</select>&nbsp;&nbsp;&nbsp;
  				
   			</td></tr>
   			<tr><td>
  				合同内容:<textarea id="editor_id1" rows="8" cols="15" name="contract.contractContent" style="width:950px;height:200px;">
  							<s:property value="#contract.contractContent"/>
  						</textarea>
  			</td></tr>
  			<tr><td>
  				登记日期：<input type="text" name="contract.registerDate" onclick="WdatePicker()" value="<s:property value='#contract.registerDate'/>"/>&nbsp;&nbsp;&nbsp;&nbsp;
  				签订日期：<input type="text" name="contract.signDate" onclick="WdatePicker()" value="<s:property value='#contract.signDate'/>"/>
  				开始日期：<input type="text" name="contract.startDate" onclick="WdatePicker()" value="<s:property value='#contract.startDate'/>"/>&nbsp;&nbsp;&nbsp;&nbsp;
  				截止日期：<input type="text" name="contract.endDate" onclick="WdatePicker()" value="<s:property value='#contract.endDate'/>"/>
  			</td></tr>
  			<tr><td>
  				甲方责任人：<input type="text" name="contract.partyAprincipal" value="<s:property value='#contract.partyAprincipal'/>"/>&nbsp;&nbsp;
  				乙方责任人：<input type="text" name="contract.partyBprincipal" value="<s:property value='#contract.partyBprincipal'/>"/>&nbsp;&nbsp;
  				附&nbsp;&nbsp;&nbsp;&nbsp;件：<input type="file" name="contract.attachment" value="<s:property value='#contract.attachment'/>"/>
  			</td></tr>
  			<tr><td>
  			合同备注:<textarea  rows="3" cols="15" name="contract.contractRemark" style="width:900px;height:100px;">
  						<s:property value="#contract.contractRemark"/>
  					</textarea>
  			</td></tr>
  			<tr><td>
  				
  			</td></tr>
  		<tr align="center"><td>
  	<input class="input-button" type="submit" value="修改" onblur="javascript:window.opener.location.reload();window.close()"/>
  	<input class="input-button" type="reset" value="重置" />&nbsp;<input class="input-button" type="button" value="返回" onclick="javascript:history.go(-1)" >
  		</td></tr>
  	</s:iterator>
  	</s:if>
 </table>
  	</form>
  </body>
  <script type="text/javascript">
   /* window.onload = function()
   {
      var oFCKeditor = new FCKeditor("MyTextarea") ;
      oFCKeditor.BasePath = "./ckeditor/ckeditor.js/" ;
      oFCKeditor.ReplaceTextarea() ;
} */

  	$(function(){
  		KindEditor.ready(function(K) {
                var editor1 = K.create('#editor_id1', {
                    //自定义工具栏
                	items:[
					        'code', '|', 'justifyleft', 'justifycenter', 'justifyright',
					        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent',
					        'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen',
					        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
					        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
					        'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
					        'anchor', 'link', 'unlink'
					],
					uploadJson : 'ImgUpload.action', //图片上传Action
					allowImageRemote : false //取消网络图片上传
				});
        });
  		KindEditor.ready(function(K) {
                var editor1 = K.create('#editor_id2', {
                    //自定义工具栏
                	items:[
					        'code', '|', 'justifyleft', 'justifycenter', 'justifyright',
					        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent',
					        'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen',
					        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
					        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
					        'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
					        'anchor', 'link', 'unlink'
					],
					uploadJson : 'ImgUpload.action', //图片上传Action
					allowImageRemote : false //取消网络图片上传
				});
        });
  	})
</script>
  
</html>
