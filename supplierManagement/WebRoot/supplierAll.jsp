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
    
    <title>My JSP 'newSupplier.jsp' starting page</title>
    <script src="js/SpryTabbedPanels.js" type="text/javascript"></script>
	<link href="css/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<style type="text/css">
		li{
			margin-left: 10px;
		}
	</style>
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
    <s:set name="todayTime" value="new java.sql.Date(new java.util.Date().getTime()).toString()"></s:set>
   <!--  <div class="menu">
    </div>
    <div class="allStyle clearfix">
    	<input class="input-button" type="button" value="查询">
    	<input onclick="window.open('newAdd.jsp', 'newwindow')" class="input-button" type="button" value="增加">
    	<input class="input-button" type="button" value="修改">
    	<input class="input-button" type="button" value="删除">
    </div> -->
    <div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0" >供应商信息&nbsp;&nbsp;</li>
    <li class="TabbedPanelsTab" tabindex="0" >合同信息&nbsp;&nbsp;</li>
    <li class="TabbedPanelsTab" tabindex="0" >产品信息&nbsp;&nbsp;</li>
    <li class="TabbedPanelsTab" tabindex="0" >联系人信息&nbsp;&nbsp;</li>
    <li class="TabbedPanelsTab" tabindex="0" >用户信息&nbsp;&nbsp;</li>
  </ul>
  
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent">
    <!-- 供应商信息 -->
    <jsp:include page="suppList.jsp"></jsp:include>
      <%-- <table border="1" width="95%" style="text-align: center" align="center">
				<tr>
                    <th><input type="checkbox" id="ckall" onclick="choose();"/></th> 
					<th>供应商名称</th>
					<th>产品名称</th>
					<th>联系人</th>
					<th>法人代表</th>
					<th>企业性质</th>
					<th>联系电话</th>
					<th>公司传真</th>
					<th>开户行</th>
					<th>开户账号</th>
					<th>税务登记证号码</th>
					<th>供应商食品流通许可证有效期</th>
					<th>供应商生产许可证有效期</th>
					<th>第三方质检报告有效期</th>
					<th>营业执照号码</th>
					<th>营业执照有效期</th>
					<th>组织机构代码证代码</th>
					<th>组织机构代码证有效期</th>
					<th>注册资金</th>
					<th>公司地址</th>
					<th>公司网站</th>
					<th>公司邮箱</th>
					<th>公司介绍</th>
					<th>专长</th>
					<th>服务过的项目</th>
					<th>备注</th>
					<th>录入日期</th>
					<th>合同订单</th>
					<th>附件</th>
					<th>供应商状态</th>
					<th>&nbsp;</th>
				</tr>
				<s:if test="supplierlist!=null">
					<s:iterator value="supplierlist" var="supplier" status="sta">
						<tr>
							<td><s:checkbox name="choice" value="#supplier.supplierID" />
							</td>
							<td><input type="checkbox" name="choice" value="${supplier.supplierId}"/>
							</td> 
							<td><s:property value="#supplier.supplierName"/>
							</td>
							<td><s:property value="#supplier.productName" />
							</td>
							<td><s:property value="#supplier.contacter" />
							</td>
							<td><s:property value="#supplier.legalPerson " />
							</td>
							<td><s:property value="#supplier.companyProperty" />
							</td>
							<td><s:property value="#supplier.tel"/>
							</td>
							<td><s:property value="#supplier.fax" />
							</td>
							<td><s:property value="#supplier.bank" />
							</td>
							<td><s:property value="#supplier.bankAccount" />
							</td>
							<td><s:property value="#supplier.taxCertificateNo" />
							</td>
							<td id=""><s:property value="#supplier.foodCerValidity" />
							</td>
							<td><s:property value="#supplier.productCerValidity" />
							</td>
							<td><s:property value="#supplier.thirdpartyValidity" />
							</td>
							<td><s:property value="#supplier.businessLicense" />
							</td>
							<td><s:property value="#supplier.busLicenseValidity" />
							</td>
							<td><s:property value="#supplier.institutionCertificate" />
							</td>
							<td><s:property value="#supplier.institutionValidity" />
							</td>
							<td><s:property value="#supplier.registeredFund" />
							</td>
							<td><s:property value="#supplier.companyAddr" />
							</td>
							<td><s:property value="#supplier.website" />
							</td>
							<td><s:property value="#supplier.email" />
							</td>
							<td><s:property value="#supplier.briefIntroduction" />
							</td>
							<td><s:property value="#supplier.speciality" />
							</td>
							<td><s:property value="#supplier.servedProject" />
							</td>
							<td><s:property value="#supplier.remark" />
							</td>
							<td><s:property value="#supplier.inputDate" />
							</td>
							<td><s:property value="#supplier.contractOrder" />
							</td>
							<td><s:property value="#supplier.attachment" />
							</td>
							<td><s:property value="#supplier.supplierStatus" />
							</td>
							<td>
							<s:if test="#session.user.flag0==0">
							<a href="<c:url value="findSupplierByID?supplierID=${supplier.supplierId}"/>">修改</a>
							</s:if>
							</td>
						</tr>
					</s:iterator>
				</s:if>
			</table> --%>
    </div>
    <div class="TabbedPanelsContent">
    <!-- 合同信息 -->
    <jsp:include page="contract.jsp"></jsp:include>
      <%-- <table cellpadding="1" border="1" cellspacing="1" width="95%" align="center">
  		<tr>
  			<td>合同编号</td>
  			<td>合同名称</td>
  			<td>合同甲方</td>
  			<td>合同已方</td>
  			<td>收付类型</td>
  			<td>支付方式</td>
  			<td>交易币种</td>
  			<td>合同总价</td>
  			<!-- <td>合同内容</td> -->
  			<td>登记日期</td>
  			<td>签订日期</td>
  			<td>开始日期</td>
  			<td>截止日期</td>
  			<td>合同状态</td>
  			<!-- <td>单位名称</td>
  			<td>合同备注</td> -->
  			<td>合同联系人</td>
  			<td>甲方责任人</td>
  			<td>已方责任人</td>
  			<!-- <td>附件</td> -->
  			<td align="center">操作</td>
  		</tr>
  		<s:if test="contractList!=null">
  			<s:iterator value="contractList" var="contract" status="sta">
  				<s:if test="#todayTime>=#contract.endDate&&#contract.endDate!=null">
  			<tr class="userAdmin">
  				<td><s:property value="#contract.contractId"/></td>
  				<td><s:property value="#contract.contractName"/></td>
  				<td><s:property value="#contract.partyA"/></td>
  				<td><s:property value="#contract.partyB"/></td>
  				<td><s:property value="#contract.receiptsPaymentType"/></td>
  				<td><s:property value="#contract.payway"/></td>
  				<td><s:property value="#contract.currency"/></td>
  				<td><s:property value="#contract.contractPrice"/></td>
  				<td><s:property value="#contract.contractContent"/></td>
  				<td><s:property value="#contract.registerDate"/></td>
  				<td><s:property value="#contract.signDate"/></td>
  				<td><s:property value="#contract.startDate"/></td>
  				<td class="userAdmin"><s:property value="#contract.endDate"/></td>
  				<td><s:property value="#contract.companyName"/></td>
  				<s:if test="#contract.contractState=='合格'.toString()"> 
  				<s:if test="%{#contract.contractState==\"合格\"}">
  				<s:if test="#contract.contractState.equals('合格')">
  				<s:if test='#contract.contractState!="合格"'>
  				<td class="userAdmin"><s:property value="#contract.contractState"/></td>
  				</s:if>
  				<s:else>
  				<td><s:property value="#contract.contractState"/></td>
  				</s:else>
  				<td><s:property value="#contract.contractRemark"/></td>
  				<td><s:property value="#contract.operator"/></td>
  				<td><s:property value="#contract.partyAprincipal"/></td>
  				<td><s:property value="#contract.partyBprincipal"/></td>
  				<td><s:property value="#contract.attachment"/></td>
  				<td colspan="3">
  					<a href="newContract.action?contractId=<s:property value='#contract.contractId'/>"><input type="button" value="详细" /></a>
  					<s:if test="#session.user.flag0==0">
  					<span ><input type="button" onclick="window.open ('updateContract.action?contractId=<s:property value="#contract.contractId"/>', 'newwindow', 'height=500, width=500,scrollbars=yes, resizable=yes')" value="修改"/></span>
  					<a href="deleteContract.action?contractId=<s:property value='#contract.contractId'/>"><input onclick="return confirm('您确定要删除')" type="button" value="删除" /></a>
  					</s:if>
  				</td>
  			</tr>
  			
  				</s:if>
  				
  				<s:else>
  					<tr>
  				<td><s:property value="#contract.contractId"/></td>
  				<td><s:property value="#contract.contractName"/></td>
  				<td><s:property value="#contract.partyA"/></td>
  				<td><s:property value="#contract.partyB"/></td>
  				<td><s:property value="#contract.receiptsPaymentType"/></td>
  				<td><s:property value="#contract.payway"/></td>
  				<td><s:property value="#contract.currency"/></td>
  				<td><s:property value="#contract.contractPrice"/></td>
  				<td><s:property value="#contract.contractContent"/></td>
  				<td><s:property value="#contract.registerDate"/></td>
  				<td><s:property value="#contract.signDate"/></td>
  				<td><s:property value="#contract.startDate"/></td>
  				<td><s:property value="#contract.endDate"/></td>
  				<td><s:property value="#contract.companyName"/></td>
  				<s:if test="#contract.contractState=='合格'.toString()"> 
  				<s:if test="%{#contract.contractState==\"合格\"}">
  				<s:if test="#contract.contractState.equals('合格')">
  				<s:if test='#contract.contractState!="合格"'>
  				<td class="userAdmin"><s:property value="#contract.contractState"/></td>
  				</s:if>
  				<s:else>
  				<td><s:property value="#contract.contractState"/></td>
  				</s:else>
  				<td><s:property value="#contract.contractRemark"/></td>
  				<td><s:property value="#contract.operator"/></td>
  				<td><s:property value="#contract.partyAprincipal"/></td>
  				<td><s:property value="#contract.partyBprincipal"/></td>
  				<td><s:property value="#contract.attachment"/></td>
  				<td colspan="3">
  					<a href="newContract.action?contractId=<s:property value='#contract.contractId'/>"><input type="button" value="详细" /></a>
  					<s:if test="#session.user.flag0==0">
  					<span ><input type="button" onclick="window.open ('updateContract.action?contractId=<s:property value="#contract.contractId"/>', 'newwindow', 'height=500, width=500,scrollbars=yes, resizable=yes')" value="修改"/></span>
  					<a href="deleteContract.action?contractId=<s:property value='#contract.contractId'/>"><input onclick="return confirm('您确定要删除')" type="button" value="删除" /></a>
  					</s:if>
  				</td>
  			</tr>
  				</s:else>
  				
  			</s:iterator>
  		</s:if>
  		<s:if test="contract!=null">
  			<s:iterator value="contract" var="contract" status="sta">
  			<tr>
  				<td><s:property value="#contract.contractId"/></td>
  				<td><s:property value="#contract.contractName"/></td>
  				<td><s:property value="#contract.partyA"/></td>
  				<td><s:property value="#contract.partyB"/></td>
  				<td><s:property value="#contract.receiptsPaymentType"/></td>
  				<td><s:property value="#contract.payway"/></td>
  				<td><s:property value="#contract.currency"/></td>
  				<td><s:property value="#contract.contractPrice"/></td>
  				<td><s:property value="#contract.contractContent"/></td>
  				<td><s:property value="#contract.registerDate"/></td>
  				<td><s:property value="#contract.signDate"/></td>
  				<td><s:property value="#contract.startDate"/></td>
  				<td><s:property value="#contract.endDate"/></td>
  				<td><s:property value="#contract.contractState"/></td>
  				<td><s:property value="#contract.companyName"/></td>
  				<td><s:property value="#contract.contractRemark"/></td>
  				<td><s:property value="#contract.operator"/></td>
  				<td><s:property value="#contract.partyAprincipal"/></td>
  				<td><s:property value="#contract.partyBprincipal"/></td>
  				<td><s:property value="#contract.attachment"/></td>
  				<td colspan="3">
  					<span id="details"><a href="newContract.action?contractId=<s:property value='#contract.contractId'/>"><input type="button" value="详细" /></span></a>
  					<span ><input type="button" onclick="window.open ('updateContract.action?contractId=<s:property value="#contract.contractId"/>', 'newwindow', 'height=500, width=500,scrollbars=yes, resizable=yes')" value="修改"/></span>
  					<span id="delete"><a href="deleteContract.action?contractId=<s:property value='#contract.contractId'/>"><input onclick="return confirm('您确定要删除')" type="button" value="删除" /></span></a>
  				</td>
  			</tr>
  			</s:iterator>
  		</s:if>
  		<jsp:include page="pages.jsp"></jsp:include>
  	</table> --%>
    </div>
     <div class="TabbedPanelsContent">
     <!-- 产品信息 -->
     <jsp:include page="goodsList.jsp"></jsp:include>
       <%-- <table cellpadding="1" border="1" cellspacing="1" width="95%" align="center">
  		<tr>
  			<td>商品编号</td>
  			<td>商品名称</td>
  			<td>商品规格</td>
  			<td>生产厂家</td>
  			<td>厂家税务登记证</td>
  			<td>厂家组织机构代码证</td>
  			<td>厂家营业执照有效期</td>
  			<td>厂家生产许可证有效期</td>
  			<td>厂家第三方质检报告有效期</td>
  			<td align="center">操作</td>
  		</tr>
  		<s:if test="goodslist!=null">
  			<s:iterator value="goodslist" var="product" status="sta">
  			<tr>
  				<td><s:property value="#product.productId"/></td>
  				<td><s:property value="#product.productName"/></td>
  				<td><s:property value="#product.standard"/></td>
  				<td><s:property value="#product.manufacturer"/></td>
  				<td><s:property value="#product.taxCertificate"/></td>
  				<td><s:property value="#product.institutionCertificate"/></td>
  				<td><s:property value="#product.institutionCertificate"/></td>tax税务登记证
  				<td><s:property value="#product.busLicenseValidity"/></td>
  				<td><s:property value="#product.productCerValidity"/></td>
  				<td><s:property value="#product.thirdpartyValidity"/></td>
  				<td colspan="2">
  					<s:if test="#session.user.flag0==0">
  					<span ><input type="button" onclick="window.open ('updateGoods.action?deleteId=<s:property value="#product.productId"/>', 'newwindow', 'height=500, width=500,scrollbars=yes, resizable=yes')" value="修改"/></span>
  					
  					<span ><input type="button" onclick="window.open ('updateGoods.jsp?product=<s:property value="#product"/>', 'newwindow', 'height=500, width=500')" value="修改"/></span>
  					<span id="delete"><a href="deleteGoods.action?deleteId=<s:property value='#product.productId'/>"><input onclick="return confirm('您确定要删除')" type="button" value="删除" /></span></a>
					</s:if>
  				</td>
  			</tr>
  			</s:iterator>
  		</s:if>
  		<s:if test="product!=null">
  			<s:iterator value="product" var="product" status="sta">
  			<tr>
  				<td><s:property value="#product.productId"/></td>
  				<td><s:property value="#product.productName"/></td>
  				<td><s:property value="#product.standard"/></td>
  				<td><s:property value="#product.manufacturer"/></td>
  				<td><s:property value="#product.taxCertificate"/></td>
  				<td><s:property value="#product.institutionCertificate"/></td>
  				<td><s:property value="#product.busLicenseValidity"/></td>
  				<td><s:property value="#product.productCerValidity"/></td>
  				<td><s:property value="#product.thirdpartyValidity"/></td>
  				<td colspan="2">
  					<s:if test="#session.user.flag0==0">
  					<span ><input type="button" onclick="window.open ('updateGoods.action?deleteId=<s:property value="#product.productId"/>', 'newwindow', 'height=500, width=500,scrollbars=yes, resizable=yes')" value="修改"/></span>
  					
  					<span ><input type="button" onclick="window.open ('updateGoods.jsp?product=<s:property value="#product"/>', 'newwindow', 'height=500, width=500')" value="修改"/></span>
  					<a href="deleteGoods.action?deleteId=<s:property value='#product.productId'/>"><input onclick="return confirm('您确定要删除')" type="button" value="删除" /></a>
					</s:if>
  				</td>
  			</tr>
  			</s:iterator>
  		</s:if>
  	</table> --%>
    </div>
  <div class="TabbedPanelsContent">
  <!-- 联系人信息 -->
  	<jsp:include page="contacterList.jsp"></jsp:include>
      <%-- <table border="1" width="95%" style="text-align: center" align="center">
				<tr>
                    <th><input type="checkbox" id="ckall" onclick="choose();"/></th> 
					<th>姓名</th>
					<th>性别</th>
					<th>职务</th>
					<th>手机</th>
					<th>电话</th>
					<!-- <th>传真</th> -->
					<th>邮箱</th>
					<th>登记日期</th>
					<th>单位名称</th>					
					<th>&nbsp;</th>
				</tr>
				<s:if test="linkmanlist!=null">
					<s:iterator value="linkmanlist" var="linkman" status="sta">
						<tr>
							<td><s:checkbox name="choice" value="#linkman.linkmanID" />
							</td>
							<td><input type="checkbox" name="choice" value="${linkman.linkmanNo}" />
							</td> 
							<td><s:property value="#linkman.linkmanName" />
							</td>
							<td><s:property value="#linkman.linkmanSex" />
							</td>
							<td><s:property value="#linkman.linkmanjob" />
							</td>
							<td><s:property value="#linkman.linkmantelephone " />
							</td>
							<td><s:property value="#linkman.linkmantel" />
							</td>
							<td><s:property value="#linkman.linkmanfax" />
							</td>
							<td><s:property value="#linkman.linkmanemail" />
							</td>
							<td><s:property value="#linkman.linkmanInDate" />
							</td>
							<td><s:property value="#linkman.linkmanCompany" />
							</td>
							<td>
							<s:if test="#session.user.flag0==0">
							<a href="<c:url value="findcontacterByID?linkmanNo=${linkman.linkmanNo}"/>">修改</a>
							</s:if>
							</td>
						</tr>
					</s:iterator>
				</s:if>
			</table> --%>
    </div>
    <div class="TabbedPanelsContent">
    <!-- 用户信息 -->
    	<jsp:include page="userList.jsp"></jsp:include>
      <%-- <table cellpadding="1" border="1" cellspacing="1" width="90%" align="center">
  		<tr>
  			<td>用户编号</td>
  			<td>用户帐号</td>
  			<td>用户密码</td>
  			<td>创建日期</td>
  			<td align="center">操作</td>
  		</tr>
  		<s:if test="userlist!=null">
  			<s:iterator value="userlist" var="user" status="sta">
  			<s:if test="#user.flag0==0">
  				<tr class="userAdmin">
  				<td id="userId"><s:property value="#user.userId"/></td>
  				<td><s:property value="#user.userName"/></td>
  				<td><s:property value="#user.password"/></td>
  				<td><s:property value="#user.createDate"/></td>
  				<td colspan="2">
  					<s:if test="#session.user.flag0==0">
  					<span ><input type="button" onclick="window.open ('updateUser.jsp?id=<s:property value="#user.userId"/>&userName=<s:property value="#user.userName"/>&password=<s:property value="#user.password"/>&createDate=<s:property value="#user.createDate"/>', 'newwindow', 'height=500, width=500')" value="修改"/></span>
  					<a href="deleteAction.action?deleteId=<s:property value='#user.userId'/>"><input onclick="return confirm('您确定要删除')" type="button" value="删除" /></a>
  					<!-- <input type="button" onclick="deleteUser()" value="删除"/> -->
  					</s:if>
  				</td>
  			</tr>
  			</s:if>
  			<s:else>
  				<tr>
  				<td id="userId"><s:property value="#user.userId"/></td>
  				<td><s:property value="#user.userName"/></td>
  				<td><s:property value="#user.password"/></td>
  				<td><s:property value="#user.createDate"/></td>
  				<td colspan="2">
  					<s:if test="#session.user.flag0==0">
  					<span ><input type="button" onclick="window.open ('updateUser.jsp?id=<s:property value="#user.userId"/>&userName=<s:property value="#user.userName"/>&password=<s:property value="#user.password"/>&createDate=<s:property value="#user.createDate"/>', 'newwindow', 'height=500, width=500')" value="修改"/></span>
  					<a href="deleteAction.action?deleteId=<s:property value='#user.userId'/>"><input onclick="return confirm('您确定要删除')" type="button" value="删除" /></a>
  					<!-- <input type="button" onclick="deleteUser()" value="删除"/> -->
  					</s:if>
  				</td>
  			</tr>
  			</s:else>
  			</s:iterator>
  		</s:if>
  		<s:if test="user!=null">
  			<s:iterator value="user" var="user" status="sta">
  			<tr>
  				<td><s:property value="#user.userId"/></td>
  				<td><s:property value="#user.userName"/></td>
  				<td><s:property value="#user.password"/></td>
  				<td><s:property value="#user.createDate"/></td>
  				<td colspan="2">
  					<s:if test="#session.user.flag0==0">
  					<input type="button" onclick="window.open ('updateUser.jsp?id=<s:property value="#user.userId"/>&userName=<s:property value="#user.userName"/>&password=<s:property value="#user.password"/>&createDate=<s:property value="#user.createDate"/>', 'newwindow', 'height=500, width=500',scrollbars=yes, resizable=yes)" value="修改"/>
  					<a href="deleteAction.action?deleteId=<s:property value='#user.userId'/>" title="删除" onclick="confirm('您确定要删除')"></a>
  					<a href="deleteAction.action?deleteId=<s:property value='#user.userId'/>" title="删除" onclick="deleteUser()"></a>
  					</s:if>
  				</td>
  			</tr>
  			</s:iterator>
  		</s:if>
  	</table> --%>
    </div>
  </div>
</div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
  </body>
</html>
