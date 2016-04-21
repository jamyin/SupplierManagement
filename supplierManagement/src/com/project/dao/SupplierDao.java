package com.project.dao;

import java.util.List;

import com.project.entity.Contract;
import com.project.entity.Linkman;
import com.project.entity.Product;
import com.project.entity.Supplier;
import com.project.entity.Sysuser;


public interface SupplierDao{
	//查询所有供应商
	public List<Supplier> findAllSupplier();
	
	//按ID查询供应商
	public Supplier findSupplierByID(int id);
	
	//按某个字段查询供应商
	public List<Supplier> findSupplierByField(String supplierName,String speciality, String bigSort, String sort);

	//增加供应商
	public boolean addSupplier(Supplier supplier);
	
	//修改供应商

	public boolean updateSupplier(Supplier supplierID);
	
	//删除供应商
	public int deleteSupplier(int supplierNo);
	
	//批量删除供应商
	public int deleteSupplier(String[] supplierNos);

	public List<Supplier> findSupp();

	public boolean addSupplier6(Supplier supplier, Linkman linkman,
			Contract contract,Product product);

	public List findAllContent(int supplierID);
	//按查询供应商（包括子表）
	public List findAllSupplier6();

	//分页查询
	public List<Supplier> getAllPage(String supplierName,String speciality,String bigSort,String sort,int startRow, int size);
	
	//查询所有记录数
	public int getCount(String supplierName,String speciality,String bigSort,String sort);

	public Supplier findSuppIdByName(String supplierName);

	//根据供应商类型查询供应商
	public List<Supplier> findSupplierByBigSort(String bigSort);

	//通过供应商分类，小分类 查询供应商
	public List<Supplier> findSupplierBySort(String sort);

	//查询所有供应商，导出excle
	public List<Supplier> findWholeSupplier();

	public List<Supplier> findOverSuppList();

	public List<Supplier> findOverSuppByField(String supplierName, String speciality, String bigSort, String sort);

	public int getOverCount(String supplierName, String speciality,
			String bigSort, String sort);

	public List<Supplier> getOverAllPage(String supplierName,
			String speciality, String bigSort, String sort, int startRow,
			int size);

	
	
}
