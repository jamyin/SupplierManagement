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
    
    <title>My JSP 'updateGoods.jsp' starting page</title>
    <script type="text/javascript" src="kindeditor-4.1.10/jquery-1.8.0.min.js"></script>
    <script charset="utf-8" src="kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <%-- <%=request.getParameter("product") %> --%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript">
		//验证为数字
	function numIsNum(){
		var num = document.getElementById("productNum").value;
		if(isNaN(num)){
			alert("请输入数字！");
		}
	}
	//计算产品总价
	function getCount(){
		var num = document.getElementById("productNum").value;
		//alert(num);
		var count = document.getElementById("productPrice").value;
		//alert(count);
		if(isNaN(count)){
			alert("请输入数字！");
		}
		var allCount = num*count;
		//alert(allCount);
		document.getElementById("productCount").value=allCount;
	}
		
	</script>
	

  </head>
  
  <%-- <%Product product=request.getParameter("product"); %>
  <%out.print(product.productId); %> --%>
  <body>
  	<h4 align="center">修改产品</h4>
  	<form action="updateNewGoods" method="post">
   <s:if test="product!=null">
  			<s:iterator value="product" var="product" status="sta">
  			
  			<table border="1" align="center"  bgcolor="#FFFFFF" style="color: black" bordercolor="#AAAAAA">
   		<tr>
   			<td>
   		供&nbsp;应&nbsp;商：<select name="product.supplierName" >
   								<option><s:property value="#product.supplierName"/></option>
   								<s:if test="supplierlist!=null">
   								<s:iterator value="supplierlist" var="supplier" status="sta">
   								<%-- <option><s:property value="#supplier.supplierId"/></option> --%>
   								<option><s:property value="#supplier.supplierName"/></option>
   								</s:iterator>
   								</s:if>
   							</select>
   			</td>
   		</tr>
   		<tr>
   		<tr><td>
   		<input type="hidden" name="product.productId" value="<s:property value='#product.productId'/>"/>
   		产品名称：<input type="text" name="product.productName" value="<s:property value='#product.productName'/>" size="61"/>&nbsp;&nbsp;&nbsp;&nbsp;
   		产品规格：<input type="text" name="product.standard" value="<s:property value='#product.standard'/>"/>&nbsp;&nbsp;&nbsp;&nbsp;
   		</td></tr>
   		<tr><td>
   		产品数量：<input type="text" id="productNum" name="product.amount" value="<s:property value='#product.amount'/>" onblur="numIsNum()"/>&nbsp;&nbsp;&nbsp;&nbsp;
   		产品单价：<input type="text" id="productPrice" name="product.perPrice" value="<s:property value='#product.perPrice'/>" onblur="getCount()"/>&nbsp;&nbsp;&nbsp;&nbsp;
   		供货总价：<input type="text" id="productCount" name="product.totalprice" value="<s:property value='#product.totalprice'/>"/>
   		</td></tr>
   		<tr><td>
   		生产厂家：<input type="text" name="product.manufacturer" value="<s:property value='#product.manufacturer'/>" size="66"/>&nbsp;&nbsp;&nbsp;&nbsp;
   		<tr><td>
   		产品备注：<textarea rows="3" cols="83" style="width: 900px; height: 20px;" name="product.remark" >
   					<s:property value="#product.remark"/>
   				</textarea>
   		</td></tr>
   		<tr><td>
   		厂家税务登记证：<input type="text" name="product.taxCertificate" value="<s:property value='#product.taxCertificate'/>"/>&nbsp;&nbsp;&nbsp;&nbsp;
   		组织&nbsp;机构&nbsp;代码证：<input type="text"  name="product.institutionCertificate" value="<s:property value='#product.institutionCertificate'/>"/>
   		</td></tr>
   		<tr><td>
   		营业执照有效期：<input type="text" name="product.busLicenseValidity" onclick="WdatePicker()" value="<s:property value='#product.busLicenseValidity'/>"/>&nbsp;&nbsp;&nbsp;&nbsp;
   		生产许可证有效期：<input type="text" name="product.productCerValidity" onclick="WdatePicker()" value="<s:property value='#product.productCerValidity'/>" />
   		</td></tr>
   		<tr><td>
   		第三方质检报告有效期：<input type="text" name="product.thirdpartyValidity" onclick="WdatePicker()" value="<s:property value='#product.thirdpartyValidity'/>"/>
   		</td></tr>
   		<tr><td>
   		产品附件：<input type="file" name="product.attachment" value="<s:property value='#product.attachment'/>"/>
   		</td></tr>
   		<tr align="center"><td>
   		<input class="input-button" type="submit" value="修改" onblur="javascript:window.opener.location.reload();window.close()"/>&nbsp;
   		<input class="input-button" type="reset" value="重置"/>&nbsp;&nbsp;<input class="input-button" type="button" value="返回" onclick="javascript:history.go(-1)"/>
   		</td></tr>
   	</table>
  			</s:iterator>
  		</s:if>
  	<!-- <input name="update" type="submit" onblur="javascript:window.opener.location.reload();window.close()"  value="修改产品"/><input name="" type="reset" value="重置"/> -->
  </form>
  </body>
  <script type="text/javascript">
  	$(function(){
  		KindEditor.ready(function(K) {
                var editor1 = K.create('#updateGoodsRemark', {
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
