package com.project.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.project.entity.Contract;
import com.project.entity.Linkman;
import com.project.entity.Product;
import com.project.entity.Supplier;
import com.project.entity.Sysuser;
import com.project.service.ContacterService;
import com.project.service.ContractService;
import com.project.service.GoodsService;
import com.project.service.SupplierService;
import com.project.service.UserService;

public class GoodsAction extends ActionSupport{
	private GoodsService goodsService;
	private SupplierService supplierService;
	private ContractService contractService;
	private ContacterService contacterService;
	private UserService userService;
	private List<Product> goodslist;
	private List<Supplier> supplierlist;//查询供应商集合
	private List<Contract> contractList;//查询合同
	private List<Linkman> linkmanlist;//查询联系人
	private List<Sysuser> userlist;//查询所有用户
	private Product product;
	private String message;
	private int deleteId;
	private String productName;//产品名称
	private String supplierName;
	private int supplierId;
	private int index;
	private int count;
	private int totalPageCount;
	private int size=15;
	private int startRow;
	
	//查询项目里所有表格（供应商，合同，联系人，产品，用户）
	public String getAllTable(){
		startRow=(index-1)*size;
		//count=userService.getCount(name,id);
		if(index==0){
			index=1;
		}
		if(count%size==0){
			totalPageCount=count/size;
		}else{
			totalPageCount=count/size+1;
		}
		if(index>totalPageCount){
			index=totalPageCount;
		}
		
		//supplierlist=supplierService.getAllPage(startRow, size);//供应商
		//contractList=contractService.getAllPage(startRow, size);//合同
		//goodslist=goodsService.getAllPage(startRow, size);//产品
		//linkmanlist=contacterService.getAllPage(startRow, size);//联系人
		userlist=userService.getAllPage(startRow, size);//用户
		if(supplierlist!=null&&contractList!=null&&goodslist!=null&linkmanlist!=null&&userlist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
		
	}
	
	//查询所有产品
	public String wholeGoods(){
		goodslist=goodsService.wholeGoods();
		if(goodslist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//查询所有商品，分页
	public String allGoods(){
		startRow=(index-1)*size;
		count=goodsService.getCount(supplierName,productName);
		if(index==0){
			index=1;
		}
		if(count%size==0){
			totalPageCount=count/size;
		}else{
			totalPageCount=count/size+1;
		}
		if(index>totalPageCount){
			index=totalPageCount;
		}
		goodslist=goodsService.getAllPage(supplierName,productName,startRow, size);
		
		
		//goodslist=goodsService.allGoods();
		supplierlist=supplierService.findAllSupplier();
		//supplierlist.size();
		if(goodslist!=null){
			//if(goodslist!=null&&supplierlist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//点击增加按钮
	public String clickAddGoods(){
		supplierlist=supplierService.findAllSupplier();
		if(supplierlist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//增加商品
	public String addGoods(){
		//System.out.println("获取的产品相对应的供应商id："+supplierId);
		//boolean flag=goodsService.addGoods(product,supplierId);
		//System.out.println("这是产品添加"+product.getSupplier().getSupplierId()+"和"+product.getSupplier().getSupplierName());
		boolean flag=goodsService.addGoods(product);
		//supplierlist=supplierService.findAllSupplier();
		if(flag){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//删除商品
	public String deleteGoods(){
		System.out.println("删除传参数："+deleteId);
		product=goodsService.findById(deleteId);
		boolean flag=goodsService.deleteGoods(product);
		if(flag){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//修改至不显示
	public String notShowGoods(){
		int i = goodsService.notShowGoods(deleteId);
		if(i>0){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//修改商品
	public String updateGoods(){
		boolean flag=goodsService.updateGoods(product);
		if(flag){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//通过id查询
	public String findById(){
		System.out.println(deleteId+"%%%%");
		product=goodsService.findById(deleteId);
		supplierlist=supplierService.findAllSupplier();
		if(product!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//通过id模糊查询
	public String findListById(){
		startRow=(index-1)*size;
		count=goodsService.getCount(supplierName,productName);
		if(index==0){
			index=1;
		}
		if(count%size==0){
			totalPageCount=count/size;
		}else{
			totalPageCount=count/size+1;
		}
		if(index>totalPageCount){
			index=totalPageCount;
		}
		
		goodslist=goodsService.findListById(deleteId,startRow,size);
		if(goodslist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	
	//通过产品名称查询产品
	public String findByName(){
		startRow=(index-1)*size;
		count=goodsService.getCount(supplierName,productName);
		if(index==0){
			index=1;
		}
		if(count%size==0){
			totalPageCount=count/size;
		}else{
			totalPageCount=count/size+1;
		}
		if(index>totalPageCount){
			index=totalPageCount;
		}
		
		goodslist=goodsService.findByName(productName , startRow , size);
		if(goodslist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	/**
	 * 按姓名查询产品 (从供应商列表查相关连的产品)
	 */
	public String findProductByName(){
		goodslist=goodsService.findProductByName(supplierName);
		if(goodslist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//根据供应商查询id
	public String findBySpllierId(){
		goodslist=goodsService.findBySupplierId(supplierId);
		if(goodslist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	
	//通过供应商Name查询食品
	public String findBySupplierName(){
		System.out.println(supplierName+"选择的供应商名称！");
		goodslist=goodsService.findBySupplierName(supplierName);
		if(goodslist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//getter和setter方法
	public List<Product> getGoodslist() {
		return goodslist;
	}
	public void setGoodslist(List<Product> goodslist) {
		this.goodslist = goodslist;
	}
	public GoodsService getGoodsService() {
		return goodsService;
	}
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public SupplierService getSupplierService() {
		return supplierService;
	}

	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}


	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getDeleteId() {
		return deleteId;
	}

	public void setDeleteId(int deleteId) {
		this.deleteId = deleteId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}


	public ContractService getContractService() {
		return contractService;
	}

	public void setContractService(ContractService contractService) {
		this.contractService = contractService;
	}

	public ContacterService getContacterService() {
		return contacterService;
	}

	public void setContacterService(ContacterService contacterService) {
		this.contacterService = contacterService;
	}

	public List<Contract> getContractList() {
		return contractList;
	}

	public void setContractList(List<Contract> contractList) {
		this.contractList = contractList;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<Supplier> getSupplierlist() {
		return supplierlist;
	}

	public void setSupplierlist(List<Supplier> supplierlist) {
		this.supplierlist = supplierlist;
	}

	public List<Linkman> getLinkmanlist() {
		return linkmanlist;
	}

	public void setLinkmanlist(List<Linkman> linkmanlist) {
		this.linkmanlist = linkmanlist;
	}

	public List<Sysuser> getUserlist() {
		return userlist;
	}

	public void setUserlist(List<Sysuser> userlist) {
		this.userlist = userlist;
	}
	
	

}
