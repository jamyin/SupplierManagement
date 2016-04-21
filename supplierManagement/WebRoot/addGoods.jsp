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
    
    <title>增加新产品</title>
    <script type="text/javascript" src="kindeditor-4.1.10/jquery-1.8.0.min.js"></script>
    <script charset="utf-8" src="kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
       /*   $(function(){     
                 $("#supplierList").change(function(){    
                 var supplierName=$("#supplierList").find("option:selected").text();    
				 var supplierValue=$("#supplierList").val();    
				 var supplierIndex=$("#supplierList").get(0).selectedIndex; 
                 $.ajax({ 
                       type: "POST",           
                       url: "findSuppIdByName",         
                       data: {"supplierName":supplierName},
                       dataType:"json",
                       success: function(result){ 
                       var json = eval("("+result+")");
                       document.getElementById("supplierId").value=json.supplierID;
                       }, 
                       error: function(){
                       alert("调用失败！"); }  
                      }); 
                   });       
    }); */ 
    $("form").submit( function () {
    $.ajax({ 
                       type: "POST",           
                       url: "findSuppIdByName",         
                       data: {"supplierName":supplierName},
                       dataType:"json",
                       success: function(result){ 
                       var json = eval("("+result+")");
                       document.getElementById("supplierId").value=json.supplierID;
                       }, 
                       error: function(){
                       alert("调用失败！"); }  
                      });
    } );

    //供应商不能为空
    function notNull(){
    	var inputSupplier = document.getElementById("supplierList").value;
		var inputContractName = document.getElementById("inputProductName").value;
			if(inputSupplier==""){
				alert("请选择供应商！");
				return false;
			}else if(inputContractName==""||inputContractName==null){
				alert("请输入产品名称！");
				return false;
			}else{
				//return confirm("进入待审核状态，请耐心等待管理员审核！")
				return true;
			}
    }
    
    //获取供应商名称
    function getSupplierName(){
    	var theSupplierName = document.getElementById("supplierList").innerHTML;
    	/* var index = theSupplierName.selectedIndex; // 选中索引
    	var theValue = theSupplierName.options[index].text; */
    	alert(theSupplierName);
    	document.getElementById("theSupplierName").value = theSupplierName; 
    }
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
    
     var openUpload = function(){
	 window.open ('/supplierManagement/Upload.html','newwindow','height=100,width=400,top=200,left=400,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no')
	}
    </script>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/style.css"/>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<link type="text/css" rel="stylesheet" href="testCss/jquery-ui.css">
	<script type="text/javascript" src="testCss/jquery-ui.js"></script>
	<script>
	(function( $ ) {
		$.widget( "custom.combobox", {
			_create: function() {
				this.wrapper = $( "<span>" )
					.addClass( "custom-combobox" )
					.insertAfter( this.element );
				this.element.hide();
				this._createAutocomplete();
				this._createShowAllButton();
			},

			_createAutocomplete: function() {
				var selected = this.element.children( ":selected" ),
					value = selected.val() ? selected.text() : "";

				this.input = $( "<input>" )
					.appendTo( this.wrapper )
					.val( value )
					.attr( "title", "" )
					.addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
					.autocomplete({
						delay: 0,
						minLength: 0,
						source: $.proxy( this, "_source" )
					})
					.tooltip({
						tooltipClass: "ui-state-highlight"
					});

				this._on( this.input, {
					autocompleteselect: function( event, ui ) {
						ui.item.option.selected = true;
						this._trigger( "select", event, {
							item: ui.item.option
						});
					},

					autocompletechange: "_removeIfInvalid"
				});
			},

			_createShowAllButton: function() {
				var input = this.input,
					wasOpen = false;

				$( "<a>" )
				    //.value("111")
					.attr( "tabIndex", -1 )
					.attr( "title", "Show All Supplier" )
					.tooltip()
					.appendTo( this.wrapper )
					.button({
						icons: {
							primary: "ui-icon-triangle-1-s"
						},
						text: true,
						label:"点击选择供应商&nbsp;&nbsp;"
					})
					.removeClass( "ui-corner-all" )
					.addClass( "custom-combobox-toggle ui-corner-right" )
					.mousedown(function() {
						wasOpen = input.autocomplete( "widget" ).is( ":visible" );
					})
					.click(function() {
						input.focus();

						// Close if already visible
						if ( wasOpen ) {
							return;
						}

						// Pass empty string as value to search for, displaying all results
						input.autocomplete( "search", "" );
					});
			},

			_source: function( request, response ) {
				var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
				response( this.element.children( "option" ).map(function() {
					var text = $( this ).text();
					if ( this.value && ( !request.term || matcher.test(text) ) )
						return {
							label: text,
							value: text,
							option: this
						};
				}) );
			},

			_removeIfInvalid: function( event, ui ) {

				// Selected an item, nothing to do
				if ( ui.item ) {
					return;
				}

				// Search for a match (case-insensitive)
				var value = this.input.val(),
					valueLowerCase = value.toLowerCase(),
					valid = false;
				this.element.children( "option" ).each(function() {
					if ( $( this ).text().toLowerCase() === valueLowerCase ) {
						this.selected = valid = true;
						return false;
					}
				});

				// Found a match, nothing to do
				if ( valid ) {
					return;
				}

				// Remove invalid value
				this.input
					.val( "" )
					.attr( "title", value + " didn't match any item" )
					.tooltip( "open" );
				this.element.val( "" );
				this._delay(function() {
					this.input.tooltip( "close" ).attr( "title", "" );
				}, 2500 );
				this.input.autocomplete( "instance" ).term = "点击选择供应商";
			},

			_destroy: function() {
				this.wrapper.remove();
				this.element.show();
			}
			//将值赋给供应商
		});
	})( jQuery );

	$(function() {
		$( "#supplierList" ).combobox();
		
			$( "#combobox" ).toggle();
		
	});
	</script>

  </head>
  <body onunload="javascript:window.opener.location.reload();window.close()">
  <!-- 获取当前时间 ，格式为xxxx-xx-xx -->
	<s:set name="todayTime" value="new java.sql.Date(new java.util.Date().getTime()).toString()"></s:set>
    <h4 align="center">增加新产品</h4>
    
   <form action="addGoods" method="post">
   		<table align="center" border="1">
   		<tr><s:hidden name="supplierId" id="supplierId"></s:hidden> 
   			<td>
   		供&nbsp;应&nbsp;商：<select name="product.supplier.supplierId" id="supplierList" >
   		<%-- <tr><s:hidden name="supplierId" id="supplierId"></s:hidden> --%> 
   		<td>
   			供&nbsp;应&nbsp;商：<select name="product.supplier.supplierId" id="supplierList">
   								<!-- <option value="">请选择</option> -->
   								<s:if test="supplierlist!=null">
   								<s:iterator value="supplierlist" var="supplier" status="sta">
   								<%-- <option><s:property value="#supplier.supplierId"/></option> --%>
   								
   								<option value="<s:property value='#supplier.supplierId'/>"><s:property value="#supplier.supplierName"/></option>
   								<option value='<s:property value="#supplier.supplierId"/>'><s:property value="#supplier.supplierName"/></option>
   								</s:iterator>
   								</s:if>
   							</select>
   		</td>
   		</tr>
   		<tr>
   		<tr><td>
   		产品名称：<input type="text" name="product.productName" size="61" id="inputProductName" />&nbsp;&nbsp;&nbsp;&nbsp;
   		产品规格：<input type="text" name="product.standard"/>&nbsp;&nbsp;&nbsp;&nbsp;
   		<!-- 供应商名：<input type="text" id="theSupplierName" name="product.supplierName" value=""/> -->
   		</td></tr>
   		<tr><td>
   		产品数量：<input id="productNum" type="text" name="product.amount" onblur="numIsNum()"/>&nbsp;&nbsp;&nbsp;&nbsp;
   		产品单价：<input id="productPrice" type="text" name="product.perPrice" onblur="getCount()"/>&nbsp;&nbsp;&nbsp;&nbsp;
   		供货总价：<input id="productCount" type="text" name="product.totalprice" value=""/>
   		</td></tr>
   		<tr><td>
   		生产厂家：<input type="text" name="product.manufacturer" size="61" />
   		</td></tr>
   		<tr><td>
   		产品备注：<textarea rows="3" cols="83" style="width: 900px; height: 100px;" name="product.remark"></textarea>
   		</td></tr>
   		<tr><td>
   		厂家税务登记证：<input type="text" name="product.taxCertificate"/>&nbsp;&nbsp;&nbsp;&nbsp;
   		组织&nbsp;机构&nbsp;代码证：<input type="text"  name="product.institutionCertificate"/>
   		</td></tr>
   		<tr><td>
   		营业执照有效期：<input type="text" name="product.busLicenseValidity" onclick="WdatePicker()" />&nbsp;&nbsp;&nbsp;&nbsp;
   		生产许可证有效期：<input type="text" name="product.productCerValidity" onclick="WdatePicker()"  />
   		</td></tr>
   		<tr><td>
   		第三方质检报告有效期：<input type="text" name="product.thirdpartyValidity" onclick="WdatePicker()" />
   		</td></tr>
   		<tr><td>
   		产品附件 :<input type="button" onclick="openUpload()" value="上传"/> 
  				 <input type="hidden" name="product.attachment" id="attachment" value="${fileFileName}"/>
   		</td></tr>
   		<tr align="center"><td>
   		<input class="input-button" type="submit" value="添加" onclick="return notNull()"/>
   		<input class="input-button" type="reset" value="重置"/>&nbsp;<input class="input-button" type="button" value="返回" onclick="javascript:history.go(-1)"/>
   		</td></tr>
   	</table>
   </form>
  </body>
  <script type="text/javascript">
  	$(function(){
  		KindEditor.ready(function(K) {
                var editor1 = K.create('#addGoodsRemark', {
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
