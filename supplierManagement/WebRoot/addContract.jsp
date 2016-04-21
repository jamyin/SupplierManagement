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
    
    <title>增加合同</title>
    <link media="all" rel="stylesheet" type="text/css" href="bootstrap/styles/bootstrap.css" />
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script language="javascript" type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="kindeditor-4.1.10/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script charset="utf-8" src="kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor-4.1.10/lang/zh_CN.js"></script>
	
    <%-- <script type="text/javascript">
     $(function(){  
                 //alert("baby,good night!");   
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
                   //以下是供应商的匹配
                        
    }); 
    
        /*  $(function(){  
                 //alert("baby,good night!");   
                 $("#supplierList").change(function(){ 
                 var supplierName=$("#supplierList").find("option:selected").text();    
				 var supplierValue=$("#supplierList").val();    
				 var supplierIndex=$("#supplierList").get(0).selectedIndex; 
                 document.getElementById("supplierId").value=11;
                   });       
    });  */
    </script>
    </script> --%>
    <script type="text/javascript">
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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<script type="text/javascript">
		function notNull(){
			var inputSupplier = document.getElementById("supplierList").value;
			var inputContractName = document.getElementById("inputContractName").value;
			if(inputSupplier==""||inputSupplier==null){
				alert("请选择供应商！");
				return false;
			}else if(inputContractName==""||inputContractName==null){
				alert("请输入合同名称！");
				return false;
			}else{
				return confirm("进入待审核状态，请耐心等待管理员审核！")
				return true;
			}
		}
		
	var openUpload = function(){
	//window.showModalDialog('upload.html',"","dialogWidth:300px;dialogHeight:150px;scroll:no;status:no");
	//宽为100，高为400，距屏顶0象素，屏左0象素，无工具条，无菜单条，无滚动条，不可调整大小，无地址栏，无状态栏。
	window.open ('/supplierManagement/Upload.html','newwindow','height=100,width=400,top=200,left=400,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no')
	//window.location.href="/supplierManagement/Upload.html";
	}	
	</script>
	<link rel="stylesheet" href="testCss/jquery-ui.css">
	<script src="testCss/jquery-ui.js"></script>
	<%-- <script type="text/javascript">
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

			/* _createShowAllButton: function() {
				var input = this.input,
					wasOpen = false;

				$( "<a>" )
					.attr( "tabIndex", -1 )
					.attr( "title", "Show All Items" )
					.tooltip()
					.appendTo( this.wrapper )
					.button({
						icons: {
							primary: "ui-icon-triangle-1-s"
						},
						text: false
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
			}, */

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
					.attr( "title", value + " 没有对应的供应商！" )
					.tooltip( "open" );
				this.element.val( "" );
				this._delay(function() {
					this.input.tooltip( "close" ).attr( "title", "" );
				}, 2500 );
				this.input.autocomplete( "instance" ).term = "";
			},

			_destroy: function() {
				this.wrapper.remove();
				this.element.show();
			}
		});
	})( jQuery );

	$(function() {
		$( "#supplierList" ).combobox();
		$( "#toggle" ).click(function() {
			$( "#supplierList" ).toggle();
		});
	});
	</script> --%>
	
	
  </head>
  <body onunload="javascript:window.opener.location.reload();window.close()">
  <!-- 获取当前时间 ，格式为xxxx-xx-xx -->
	<s:set name="todayTime" value="new java.sql.Date(new java.util.Date().getTime()).toString()"></s:set>
  <h4 align="center">添加合同</h4>
  <form action="addContract" method="post" enctype="multipart/form-data">
  		<table border="1" align="center"  bgcolor="#FFFFFF" style="color: black" bordercolor="#AAAAAA">
        <%-- <tr><s:hidden name="supplierId" id="supplierId"></s:hidden>--%>
  			<tr><td>
  				供&nbsp;应&nbsp;商：<select name="contract.supplier.supplierId" id="supplierList">
   								<!-- <option value="">请选择</option> -->
   								<s:if test="supplierlist!=null">
   								<s:iterator value="supplierlist" var="supplier" status="sta">
   								<option value="<s:property value='#supplier.supplierId'/>"><s:property value="#supplier.supplierName"/></option>
   								</s:iterator>
   								</s:if>
   							</select>
   			</td></tr>
   			<tr><td>
  				合同名称：<input type="text" name="contract.contractName" size="60" id="inputContractName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				操&nbsp;作&nbsp;员：<input type="text" name="contract.operator"/><span id="checkContractName"></span>
  				<input type="hidden" id="contractName" name="contractName"/>
  			</td></tr>
  			<tr><td>
  				<!-- 单位名称：<input type="text" name="contract.companyName"/>&nbsp;&nbsp;&nbsp;&nbsp; -->
  				合同甲方：<input type="text" name="contract.partyA" size="60"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				合同乙方：<input type="text" name="contract.partyB" size="50"/>
  			</td></tr>
  			<tr><td>
  			          所属项目：<input type="text" name="contract.project" size="60"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				合同总价：<input type="text" name="contract.contractPrice"/>&nbsp;&nbsp;&nbsp;&nbsp;
   				
   			</td></tr>
  			<tr><td>
  				责任部门：<input type="text" name="contract.dept" size="60"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				<!-- 合同状态：<input type="text" name="contract.contractState"/><br> -->
  				合同状态：<input type="text" name="contract.contractState" value="待审核" readonly="readonly"/>&nbsp;&nbsp;&nbsp;&nbsp;
  				业务员：<input type="text" name="contract.operationPerson"/>
  			</td></tr>
   			<tr><td>
  				<!-- 收付类型：<input type="text" name="contract.receiptsPaymentType"/><br> -->
  				收付类型：<select name="contract.receiptsPaymentType">
   								<option value="">请选择</option>
   								<option>现金</option>
   								<option>支票</option>
   								<option>赊帐</option>
   							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				付款方式：<select name="contract.payway">
   								<option value="">请选择</option>
   								<option>现金</option>
   								<option>13天</option>
   								<option>30天</option>
   								<option>支票</option>
   								<option>赊帐</option>
   							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				<!-- 交易币种：<input type="text" name="contract.currency"/><br> -->
  				交易币种：<select name="contract.currency">
   								<option value="">请选择</option>
   								<option>人民币</option>
   								<option>美元</option>
   								<option>日元</option>
   							</select>&nbsp;&nbsp;&nbsp;
   				
   			</td></tr>
   			<tr><td>
  				合同内容：<textarea id="editor_id1" rows="8" cols="15" name="contract.contractContent" style="width:950px;height:200px;">
  				</textarea>
  			</td></tr>
  			<tr><td>
  				登记日期：<input type="text" name="contract.registerDate" onclick="WdatePicker()" />&nbsp;&nbsp;&nbsp;&nbsp;
  				签订日期：<input type="text" name="contract.signDate" onclick="WdatePicker()" />&nbsp;&nbsp;&nbsp;&nbsp;
  				执行日期：<input type="text" name="contract.startDate" onclick="WdatePicker()" />&nbsp;&nbsp;&nbsp;&nbsp;
  				截止日期：<input type="text" name="contract.endDate" onclick="WdatePicker()" />
  			</td></tr>
  			<tr><td>
  				甲方责任人：<input type="text" name="contract.partyAprincipal"/>&nbsp;&nbsp;
  				乙方责任人：<input type="text" name="contract.partyBprincipal"/>&nbsp;&nbsp;
  				附&nbsp;&nbsp;&nbsp;&nbsp;件：&nbsp;&nbsp;
  				<!-- <input type="file" name="contract.attachment"/> -->
  				<input type="button" onclick="openUpload()" value="上传"/> 
  				<input type="hidden" name="contract.attachment" id="attachment" />  
  			</td></tr>
  			<tr><td>
  			合同备注：<textarea rows="2" cols="10" name="contract.contractRemark" style="width:900px;height:100px;"></textarea>
  			</td></tr>
  		<tr align="center"><td>
  	<input class="input-button" type="submit" value="添加" onclick="return notNull()"/>
  	<input class="input-button" type="reset" value="重置"/>&nbsp;<input class="input-button" type="button" value="返回" onclick="javascript:history.go(-1)"/>
  	</td></tr>
  	</table>
  	</form>
  	</body>
 
  
</html>
