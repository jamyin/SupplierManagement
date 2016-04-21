package com.project.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.project.dao.SupplierDao;
import com.project.dao.impl.SupplierDaoImpl;
import com.project.entity.Contract;
import com.project.entity.Linkman;
import com.project.entity.Product;
import com.project.entity.Supplier;
import com.project.service.SupplierService;

public class SuppAction extends ActionSupport implements SessionAware {
	private Supplier supplier;
	private Linkman linkman;
	private Contract contract;
	private Product product;
	private int size = 13;// 每页显示数
	private int index;// 当前页
	private int startRow;// 开始记录数
	private int count;// 总记录数
	private int totalPageCount;// 总页数

	private List<Supplier> supplierlist;
	private SupplierService supplierService;
	private Map<String, Object> session;
	private String supplierName;
	private String speciality;
	private int supplierID;
	private String result;
	// 供应商类型
	private String bigSort;
	private String sort;

	public String getBigSort() {
		return bigSort;
	}

	public void setBigSort(String bigSort) {
		this.bigSort = bigSort;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public Linkman getLinkman() {
		return linkman;
	}

	public void setLinkman(Linkman linkman) {
		this.linkman = linkman;
	}

	public Contract getContract() {
		return contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}

	private SupplierDao supplierDao;

	public int getSupplierID() {
		return supplierID;
	}

	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	/**
	 * 查询所有供应商
	 * 
	 * @return
	 */

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public List<Supplier> getSupplierlist() {
		return supplierlist;
	}

	public void setSupplierlist(List<Supplier> supplierlist) {
		this.supplierlist = supplierlist;
	}

	public SupplierService getSupplierService() {
		return supplierService;
	}

	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}

	public SupplierDao getSupplierDao() {
		return supplierDao;
	}

	public void setSupplierDao(SupplierDao supplierDao) {
		this.supplierDao = supplierDao;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
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

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	// 通过类型查询供应商
	public String findSupplierByBigSort() {
		startRow = (index - 1) * size;
		count = supplierService.getCount(supplierName, speciality, bigSort,
				sort);
		if (index == 0) {
			index = 1;
		}
		if (count % size == 0) {
			totalPageCount = count / size;
		} else {
			totalPageCount = count / size + 1;
		}
		if (index > totalPageCount) {
			index = totalPageCount;
		}
		System.out.println("要查询的供应商类型是： " + bigSort);
		supplierlist = supplierService.findSupplierByBigSort(bigSort);
		if (supplierlist != null) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	// 通过供应商类型小分类查询
	public String findSupplierBySort() {
		System.out.println("小分类：" + sort);
		supplierlist = supplierService.findSupplierBySort(sort);
		if (supplierlist != null) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	/** 按ID查询供应商 */
	public String findSupplierByID() {
		supplier = supplierService.findSupplierByID(supplierID);
		if (null != supplier) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String findAllContent() {
		// System.out.println("今天阴天");
		List list = new ArrayList();
		list = supplierService.findAllContent(supplierID);
		if (null != supplier) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	/** 按名称和特长查询供应商 */
	public String findSupplierByField() {
		// System.out.println("@@@@@@@@@@");
		supplierlist = supplierService.findSupplierByField(supplierName,
				speciality, bigSort, sort);
		if (null != supplierlist) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	     // 查询所有供应商，实现分页
		public String findAllSupplier() {
			startRow = (index - 1) * size;
			System.out.println("大小分类：" + bigSort + sort);
			count = supplierService.getCount(supplierName, speciality, bigSort,
					sort);
			if (index == 0) {
				index = 1;
			}
			if (count % size == 0) {
				totalPageCount = count / size;
			} else {
				totalPageCount = count / size + 1;
			}
			if (index > totalPageCount) {
				index = totalPageCount;
			}
			supplierlist = supplierService.getAllPage(supplierName, speciality,
					bigSort, sort, startRow, size);
			// System.out.println("哈喽 ，早安");
			if (null != supplierlist) {
				return SUCCESS;
			} else {
				return INPUT;
			}
		}
	/**
	 * 按名称和特长查询过期供应商
	 * 
	 * @author by Jam 2014-12-30 下午5:04:06
	 */
	public String findOverSuppByField() {
		startRow = (index - 1) * size;
		System.out.println("大小分类：" + bigSort + sort);
		count = supplierService.getOverCount(supplierName, speciality, bigSort,
				sort);
		if (index == 0) {
			index = 1;
		}
		if (count % size == 0) {
			totalPageCount = count / size;
		} else {
			totalPageCount = count / size + 1;
		}
		if (index > totalPageCount) {
			index = totalPageCount;
		}
		supplierlist = supplierService.getOverAllPage(supplierName, speciality,
				bigSort, sort, startRow, size);
		// System.out.println("哈喽 ，早安");
		if (null != supplierlist) {
			return SUCCESS;
		} else {
			return INPUT;
		}

	}

	/**
	 * 查询过期供应商
	 * 
	 * @author by Jam 2014-12-30 下午2:28:04
	 */
	public String findOverSuppList() {
		supplierlist = supplierService.findOverSuppList();
		if (null != supplierlist) {
			return SUCCESS;
		} else {
			return INPUT;
		}

	}

	

	public String findWholeSupplier() {
		supplierlist = supplierService.findWholeSupplier();
		if (supplierlist != null) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	/** 查询供应商(包括子表信息) */
	public String findAllSupplier6() {
		// System.out.println("@@@@@@@@@@");
		/*
		 * List alllist=new ArrayList(); alllist =
		 * supplierService.findAllSupplier6(); if (null != alllist) { return
		 * SUCCESS; } else { return INPUT; }
		 */
		/*
		 * List test= new ArrayList(); List test1=new ArrayList(); List
		 * test2=new ArrayList(); List test3=new ArrayList(); List test4=new
		 * ArrayList(); test1.add("1"); test1.add("2"); test2.add("3");
		 * test2.add("4"); test3.add("5"); test3.add("6"); test4.add("7");
		 * test4.add("8"); test.add(test1); test.add(test2); test.add(test3);
		 * test.add(test4);
		 */
		return SUCCESS;

	}

	/**
	 * 按供应商姓名查询ID 2014-12-18
	 * @throws IOException
	 */
	public String findSuppIdByName() throws IOException {
		// System.out.println("希望见到你！");
		// result = supplierService.findSuppIdByName(supplierName);
		Supplier supplier = supplierService.findSuppIdByName(supplierName);
		// net.sf.json.JSONObject json=
		// net.sf.json.JSONObject.fromObject(supplier);
		// new Gson().toJson(supplier);
		// result=new Gson().toJson(supplier).toString();
		// supplierID=supplier.getSupplierId();
		// result = "{supplierID:" + supplierID + "}";
		// {suopplierID:177}-->{"suopplierID":177} 转义字符是"\"而不是"/"！
		// result = "{\"supplierID\":" + supplierID + "}";
		// "{\"suopplierID\":177}
		// result= .....
		// result=json.toString();

		// JSONObject json =JSONObject.fromObject(supplier);
		// result=json.toString();

		// supplierID=supplier.getSupplierId();
		// PrintWriter out=ServletActionContext.getResponse().getWriter();
		// out.print(supplierID);

		// supplierID=supplier.getSupplierId();
		// ServletActionContext.getRequest().getSession().setAttribute("supplierID",
		// supplierID);
		// ServletActionContext.getRequest().setAttribute("supplierID",
		// supplierID);
		supplierID = supplier.getSupplierId();
		// result = "{supplierID:" + supplierID + "}";
		result = "{'supplierID':" + supplierID + "}";
		return SUCCESS;

	}

	/**
	 * 增加供应商
	 * 
	 * @return
	 */
	public String addSupplier() {
		// System.out.println("@@@@@@@@");
		boolean flag = supplierService.addSupplier(supplier);
		if (flag) {
			return SUCCESS;
		} else {
			return INPUT;
		}

	}

	/**
	 * 增加供应商(同时增加附表)
	 */
	public String addSupplier6() {
		boolean flag = supplierService.addSupplier6(supplier, linkman,
				contract, product);
		if (flag) {
			return SUCCESS;
		} else {
			return INPUT;
		}

	}

	/** 删除供应商 */
	public String deleteSupplier() {
		String[] supplierNos = ServletActionContext.getRequest()
				.getParameterValues("choice");
		/*
		 * System.out.println(supplierNos.length); for (int i= 0; i<
		 * supplierNos.length; i++) { System.out.println(supplierNos[i]); }
		 */
		SupplierDao dao = new SupplierDaoImpl();
		int count = dao.deleteSupplier(supplierNos);
		if (count == 0) {
			ServletActionContext.getRequest().setAttribute("message", "删除失败！�");
		} else {
			ServletActionContext.getRequest().setAttribute("message",
					"成功删除" + count + "条记录。");
		}
		// List empList = empDao.showAllEmp();
		// request.setAttribute("empList", empList);
		return SUCCESS;

	}

	/**
	 * 修改供应商
	 * 
	 * @return
	 */
	public String updateSupplier() {
		// System.out.println("^^^^^^^^^^^^^^^^^^^^^^^supplierID="+supplierID);
		// Integer.parseInt(ServletActionContext.getRequest().getParameter("supplierID"));
		// SupplierDao dao = new SupplierDaoImpl();

		// Supplier supplier = supplierDao.findSupplierByID(supplierID);
		// if(supplier!=null){
		// return SUCCESS;
		// }else{
		// return INPUT;
		// }
		// Supplier supplier = (Supplier) dao.findSupplierByID(supplierID);
		boolean flag = supplierService.updateSupplier(supplier);
		if (flag) {
			return SUCCESS;
		} else {
			return INPUT;
		}

	}
}
