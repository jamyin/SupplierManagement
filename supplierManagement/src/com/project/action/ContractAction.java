package com.project.action;

import java.io.File;
import java.util.List;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.opensymphony.xwork2.ActionSupport;
import com.project.entity.Contract;
import com.project.entity.Supplier;
import com.project.service.ContractService;
import com.project.service.SupplierService;

public class ContractAction extends ActionSupport{
	private int id;
	private int contractId;
	private ContractService contractService;
	private SupplierService supplierService;
	private List<Contract> contractList;
	private List<Supplier> supplierlist;
	private Contract contract;
	private String contractName;
	private int index;
	private int count;
	private int totalPageCount;
	private int size=15;
	private int startRow;
	private String supplierName;
	private Integer supplierId;
	
	
	//查询所有list
	public String wholeContract(){
		contractList=contractService.wholeContract();
		if(contractList!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//查询所有合同，分页查询
	public String allContract(){
		System.out.println("查询所有合同");
		startRow=(index-1)*size;
		count=contractService.getCount(supplierName,contractName);
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
		contractList=contractService.getAllPage(supplierName,contractName,startRow, size);
		supplierlist=supplierService.findAllSupplier();
		//list=contractService.allContract();
		//System.out.println(list.get(0).getCompanyName()+"%%%%%");
		if(contractList!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//通过供应商查询合同
	public String findBySupplier(){
		System.out.println("supplierName"+"通过供应商查询合同");
		contractList = contractService.findBySupplier(supplierName);
		if(contractList!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
		
	}
	
	//点击增加
	public String clickAddContract(){
		supplierlist=supplierService.findAllSupplier();
		if(supplierlist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//增加
	public String add(){
		//System.out.println("合同相对应供应商id "+supplierId);
		//boolean flag=contractService.addContract(contract,supplierId);
		boolean flag=contractService.addContract(contract);
		//DiskFileItemFactory factory = new DiskFileItemFactory();
		//String path = request.getRealPath("/upload");
		//factory.setRepository(new File(path));
		//ServletFileUpload upload = new ServletFileUpload(factory);
		 //upload.setHeaderEncoding("utf-8");
		if(flag){
			return SUCCESS;
		}else{
			return INPUT;
		}
		
	}
	
	//修改 点击修改获取值
	public String update(){
		contract=contractService.findById(contractId);
		supplierlist=supplierService.findAllSupplier();
		System.out.println(contract+"&&&&");
		//boolean flag=contractService.updateContract(contract);
		if(contract!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//修改flag0至不显示
	public String notShowContract(){
		int i = contractService.notShowContract(contractId);
		if(i>0){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//updateNewContract修改
	public String updateNewContract(){
		System.out.println("修改");
		boolean flag=contractService.updateContract(contract);
		
		if(flag){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//删除
	public String delete(){
		System.out.println("删除ID"+contractId);
		contract=contractService.findById(contractId);
		//System.out.println(contract.getCompanyName()+"&&&&&");
		boolean flag=contractService.deleteContract(contract);
		if(flag){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//通过ID查询合同
	public String findById(){
		contract=contractService.findById(contractId);
		if(contract!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//通过id模糊查询
	public String findListById(){
		System.out.println("模糊查询！");
		startRow=(index-1)*size;
		count=contractService.getCount(supplierName,contractName);
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
		
		contractList=contractService.findListById(contractId , startRow , size);
		if(contractList!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//通过合同名称查询
	public String findByName(){
		startRow=(index-1)*size;
		count=contractService.getCount(supplierName,contractName);
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
		
		contractList=contractService.findByName(contractName ,startRow , size);
		if(contractList!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	 //按姓名查询合同 (从供应商列表查相关连的合同)
	public String findContractByName(){
		contractList=contractService.findContractByName(supplierName);
		if(contractList!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	public int getContractId() {
		return contractId;
	}
	public void setContractId(int contractId) {
		this.contractId = contractId;
	}
	public ContractService getContractService() {
		return contractService;
	}
	public void setContractService(ContractService contractService) {
		this.contractService = contractService;
	}

	public Contract getContract() {
		return contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContractName() {
		return contractName;
	}

	public void setContractName(String contractName) {
		this.contractName = contractName;
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

	public SupplierService getSupplierService() {
		return supplierService;
	}

	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}

	public List<Supplier> getSupplierlist() {
		return supplierlist;
	}

	public void setSupplierlist(List<Supplier> supplierlist) {
		this.supplierlist = supplierlist;
	}

	public List<Contract> getContractList() {
		return contractList;
	}

	public void setContractList(List<Contract> contractList) {
		this.contractList = contractList;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	
	

	
	
	
	
	
}
