<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script language="javascript" type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script language="javascript" type="text/javascript">
 	/* $(function(){     
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
    });  

        var findSupplierId = function(){
            alert("hi,jam");
 }
        var findNameById = function(){
        //alert("美好的一天");
        //异步调用    A-jax  or  Jquery ajax
        
        } */
        
        //提交验证供应商
        var checkLinkMan=function(){
        var supplierName=$("#supplierList").find("option:selected").text(); 
        alert(supplierName);   
                 $.ajax({ 
                       type: "POST",           
                       url: "findSuppIdByName",         
                       data: {"supplierName":supplierName},
                       dataType:"json",
                       success: function(result){ 
                       var json = eval("("+result+")");
                       document.getElementById("supplierId").value=json.supplierID; 
                       alert(document.getElementById("supplierId").value);
                       }, 
                       error: function(){
                       alert("调用失败！"); }  
                      }); 
        var linkmanName= document.getElementById("linkmanName").value;
        var supplierList = document.getElementById("supplierList").value;
			if(supplierList==""){
	        	alert("请选择供应商！");
	        	return false;
	        }else if(linkmanName==""||linkmanName==null){
	           alert("请输入联系人！");  
	           return false;
	        }
        }

    </script>
    <link rel="stylesheet" href="testCss/jquery-ui.css">
    <style type="text/css">
    .ui-button-text {
    padding: 0.1em 1em 0.1em 1em !important; 
}
    </style>
	<script src="testCss/jquery-ui.js"></script>
    <script type="text/javascript">
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
					.attr( "tabIndex", -1 )
					//.attr( "title", "Show All Items" )
					.tooltip()
					.appendTo( this.wrapper )
					.button({
						icons: {
							primary: "ui-icon-triangle-1-s"
						},
						//text: false
						text: true,
						label:"选择"
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
	</script>
    <base href="<%=basePath%>">  
    <title>增加联系人</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/style.css" />
  </head>
  <body bgcolor="#F7F7F7" style="text-align: center" onload="" 
  onunload="javascript:window.opener.location.reload();window.close()">
    <s:form method="post" id="addcontacter" action="addContacter" onsubmit="return checkLinkMan()">
      <!--   <div style="border:1px solid red; width:600px;margin-left:40px;"> -->
      <h4 align="center">添加联系人</h4>
    	<table cellpadding="1" border="1" cellspacing="1" bgcolor="#FFFFFF" style="color: black" align="center">
    	<!-- list="%{#request.list}" -->
        <tr>
        <s:hidden name="linkman.supplier.supplierId" id="supplierId"></s:hidden><!-- NAME必须 -->
        <td>供应商:</td><td colspan="3"> 
        	<select id="supplierList" name="linkman.supplierName" >
        		<!-- <option value="">=点击选择供应商=</option>  -->
        			<s:if test="list!=null">
        			<s:iterator value="list" var="supplier" status="sta">
        			<option value="<s:property value='#supplier.supplierName'/>"> <s:property value="#supplier.supplierName"/> </option>
        			<%-- <option> <s:property value="#supplier.supplierName"/> </option> --%>
        			</s:iterator>
        			</s:if>
        	</select>
        </td></tr>
        <tr><td>姓名:</td><td><s:textfield name="linkman.linkmanName" id="linkmanName"/></td><td>性别:</td><td><s:select label="性别" name="linkman.linkmanSex" list="{'男','女'}" ></s:select></td></tr>
    	<tr><td>职务:</td><td><s:textfield name="linkman.linkmanjob"/></td><td>手机:</td><td><s:textfield name="linkman.linkmantelephone"/></td></tr>
    	<tr><td>电话:</td><td><s:textfield name="linkman.linkmantel"/></td><td>传真:</td><td><s:textfield name="linkman.linkmanfax"/></td></tr>
    	<tr><td>邮箱:</td><td><s:textfield name="linkman.linkmanemail"/></td><td>登记日期:</td><td><s:textfield name="linkman.linkmanInDate" onclick="WdatePicker()" value=""/></td></tr>
    	</table>
    	<br>
    	<input class="input-button" type="submit" value="提交"/>
    	<input class="input-button"  type="button" value="返回" onclick="history.go('-1');"/>
    </s:form>
  </body>
</html>
