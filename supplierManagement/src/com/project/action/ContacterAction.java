package com.project.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.omg.CORBA.Request;
import com.opensymphony.xwork2.ActionSupport;
import com.project.dao.ContacterDao;
import com.project.dao.impl.ContacterDaoImpl;
import com.project.entity.Linkman;
import com.project.entity.Supplier;
import com.project.service.ContacterService;
import com.project.service.SupplierService;



public class ContacterAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private Linkman linkman;
	private List<Linkman> linkmanlist;
	private ContacterService contacterService;
	private String linkmanName;
	private String supplierName;
	private Integer supplierId;
	private int linkmanNo;
	private int size=15;//每页显示记录数
	private int index;
	private int startRow;
	private int count;
	private int totalPageCount;
	private SupplierService supplierService;
	private List<Supplier> list;
	
	
	public Linkman getLinkman() {
		return linkman;
	}

	public void setLinkman(Linkman linkman) {
		this.linkman = linkman;
	}

	public List<Linkman> getLinkmanlist() {
		return linkmanlist;
	}

	public void setLinkmanlist(List<Linkman> linkmanlist) {
		this.linkmanlist = linkmanlist;
	}



	public ContacterService getContacterService() {
		return contacterService;
	}

	public void setContacterService(ContacterService contacterService) {
		this.contacterService = contacterService;
	}

	public String getLinkmanName() {
		return linkmanName;
	}

	public void setLinkmanName(String linkmanName) {
		this.linkmanName = linkmanName;
	}


	//分页查询
	public String getPageList(){
		startRow=(index-1)*size;
		count=contacterService.getCount(supplierName,linkmanName);
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
		linkmanlist=contacterService.getAllPage(supplierName,linkmanName,startRow, size);
		if(linkmanlist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}

	//查询全部联系人，导出excle
	public String findWholeContacter(){
		linkmanlist = contacterService.findWholeContacter();
		if(linkmanlist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	@Override
	public void setSession(Map<String, Object> session) {
		/**
		 * @author by Jam 2014-11-27 下午2:16:01
		 */
		this.session=session;
	}
	
	public Map<String, Object> getSession() {
		return session;
	}
	/**
	 * 查询所有联系人
	 * 
	 * @return
	 */
	public String findAllContacter() {
//		System.out.println("@@@@@@@@@@");
		linkmanlist = contacterService.findAllLinkman();
		if (null != linkmanlist) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}


	/** 按ID查询联系人 */
	public String findcontacterByID() {
		list = supplierService.findAllSupplier();
		linkman =contacterService.findLinkmanByID(linkmanNo);
		if (null != linkman) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}
	/** 按ID查询联系人 */
	public String findContacterByName1() {
		linkmanlist = contacterService.findContacterByName1(supplierName);
		//linkman =contacterService.findLinkmanByID(linkmanNo);
		if (null != linkmanlist) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	/** 按名称查询联系人 */
	public String findContacterByName() {
		startRow=(index-1)*size;
		count=contacterService.getCount(supplierName,linkmanName);
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
		
		linkmanlist = contacterService.findLinkmanByName(linkmanName , startRow , size);
		if (null != linkmanlist) {
			return SUCCESS;
		} else {
			return INPUT;
		}

	}

	/**
	 * 增加联系人
	 * 
	 * @return
	 */
	public String addContacter() {
		//System.out.println("=====addcontacter()=====");
		//boolean flag = contacterService.addLinkman(linkman,supplierId);
		boolean flag = contacterService.addLinkman(linkman);
		if (flag) {
			return SUCCESS;
		} else {
			return INPUT;
		}
 
	}
	public String addLinkman() {
//	    System.out.println("=====addcontacter()=====");
		list = supplierService.findAllSupplier();
		if (list!=null&&!list.equals("")) {
			return SUCCESS;
		} else {
			return INPUT;
		}
 
	}

	/** 删除联系人 */
	public String deleteContacter() {
//		System.out.println("=============删除==============");
		String[] contacterNos = ServletActionContext.getRequest().getParameterValues("choice");
/*		System.out.println(contacterNos.length);
		for (int  i= 0;  i< contacterNos.length; i++) {
			System.out.println(contacterNos[i]);
		}*/
		ContacterDao dao=new ContacterDaoImpl();
		int count = dao.deleteLinkman(contacterNos);
		if (count == 0) {
			ServletActionContext.getRequest().setAttribute("message", "删除失败！�");
		} else {
			ServletActionContext.getRequest().setAttribute("message", "成功删除" + count + "条记录。");
		}
//		List empList = empDao.showAllEmp();
//		request.setAttribute("empList", empList);
		return SUCCESS;

	}

	public int getLinkmanNo() {
		return linkmanNo;
	}

	public void setLinkmanNo(int linkmanNo) {
		this.linkmanNo = linkmanNo;
	}

	/** 修改联系人 
	 * @return */
	public String updateContacter() {
		boolean flag=contacterService.updateLinkman(linkman);
		if(flag){
			return SUCCESS;
		}else{
			return INPUT;
		}
}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
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

	public SupplierService getSupplierService() {
		return supplierService;
	}

	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}

	public List<Supplier> getList() {
		return list;
	}

	public void setList(List<Supplier> list) {
		this.list = list;
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