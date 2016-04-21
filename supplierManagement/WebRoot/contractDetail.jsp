<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>合同详细内容</title>
    <link media="all" rel="stylesheet" type="text/css" href="bootstrap/styles/bootstrap.css" />
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script language="javascript" type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="kindeditor-4.1.10/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script charset="utf-8" src="kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor-4.1.10/lang/zh_CN.js"></script>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    <form action="addContract" method="post" enctype="multipart/form-data">
    <h4 align="center">合同详细</h4>
  		<table>
  			<tr><td>
  				供&nbsp;&nbsp;应&nbsp;&nbsp;商：<select>
   								<option>请选择</option>
   								<s:if test="supplierlist!=null">
   								<s:iterator value="supplierlist" var="supplier" status="sta">
   								<option value="contract.supplierId"><s:property value="#supplier.supplierId"/></option>
   								<option value="contract.supplierName"><s:property value="#supplier.supplierName"/></option>
   								</s:iterator>
   								</s:if>
   							</select>
   			</td></tr>
   			<tr><td>
  				合同编号：<input type="text" name="contract.contractId"/>
  				合同名称：<input type="text" name="contract.contractName"/>
  				操&nbsp;&nbsp;纵&nbsp;&nbsp;员：<input type="text" name="contract.operator"/>
  			</td></tr>
  			<tr><td>
  				合同名称：<input type="text" name="contract.contractName"/>
  				合同甲方：<input type="text" name="contract.partyA"/>
  				合同已方：<input type="text" name="contract.partyB"/>
  			</td></tr>
  			<tr><td>
  				合同总价：<input type="text" name="contract.contractPrice"/>
   				所属项目：<input type="text" name="contract.project"/>
   				业&nbsp;&nbsp;务&nbsp;&nbsp;员：<input type="text" name="contract.operationPerson"/>
   			</td></tr>
  			<tr><td>
  				单位名称：<input type="text" name="contract.companyName"/>
  				合同备注：<input type="text" name="contract.contractRemark"/>
  				责任部门：<input type="text" name="contract.dept"/>
  			</td></tr>
   			<tr><td>
  				收付类型：<select name="contract.receiptsPaymentType">
   								<option>请选择</option>
   								<option>现金</option>
   								<option>支票</option>
   								<option>赊帐</option>
   							</select>&nbsp;&nbsp;&nbsp;&nbsp;
  				支付方式：<select name="contract.payway">
   								<option>请选择</option>
   								<option>现金</option>
   								<option>支票</option>
   								<option>赊帐</option>
   							</select>&nbsp;&nbsp;&nbsp;&nbsp;
  				交易币种：<select name="contract.currency">
   								<option>请选择</option>
   								<option>人名币</option>
   								<option>美元</option>
   								<option>日元</option>
   							</select>&nbsp;&nbsp;&nbsp;&nbsp;
  				合同状态：<select name="contract.contractState">
   								<option value="请选择">请选择</option>
   								<option value="合格">合格</option>
   								<option value="不合格">不合格</option>
   								<option value="待审核">待审核</option>
   							</select>
   			</td></tr>
   			<tr><td>
  				合同内容：<textarea id="editor_id" rows="8" cols="15" name="contract.contractContent" style="width:950px;height:300px;">
  				</textarea>
  			</td></tr>
  			<tr><td>
  				登记日期：<input type="text" name="contract.registerDate" onclick="WdatePicker()"/>
  				签订日期：<input type="text" name="contract.signDate" onclick="WdatePicker()"/>
  				开始日期：<input type="text" name="contract.startDate" onclick="WdatePicker()"/>
  				截止日期：<input type="text" name="contract.endDate" onclick="WdatePicker()"/>
  			</td></tr>
  			<tr><td>
  				合同联系人：<input type="text" name="contract.operator"/>
  				甲方责任人：<input type="text" name="contract.partyAprincipal"/>
  				已方责任人：<input type="text" name="contract.partyBprincipal"/>
  			</td></tr>
  			<tr><td>
  				附&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件：<input type="file" name="contract.attachment"/>
  			</td></tr>
  		<tr align="center"><td>
  	<input type="submit" value="添加合同" onblur="javascript:window.opener.location.reload();window.close()"/>
  	<input type="reset" value="重置内容" />
  		</td></tr>
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
                var editor1 = K.create('#editor_id', {
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
