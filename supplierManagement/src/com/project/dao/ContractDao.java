package com.project.dao;

import java.util.List;

import com.project.entity.Contract;

public interface ContractDao {
	//查询所有合同
	public List<Contract> wholeContract();
	
	//查询所有合同，分页查询
	public List<Contract> allContract();
	
	//增加
	//public boolean add(Contract contract,Integer supplierId);
	public boolean add(Contract contract);
	
	//修改
	public boolean update(Contract contract);
	
	//删除
	public boolean delete(Contract contract);
	
	//通过合同id查询
	public Contract findById(int id);
	
	//通过id模糊查询
	public List<Contract> findListById(int id , int startRow , int size);
	
	//通过合同名称查询
	public List findByName(String contractName , int startRow , int size);
	
	//组合查询
	public List<Contract> findContract();
	
	//分页查询，查询所有记录数
	public int getCount(String supplierName,String contractName);
	
	//分页查询
	public List getAllPage(String supplierName,String contractName,int startRow,int size);

	public List<Contract> findContractByName(String supplierName);

	//修改flag0至不显示
	public int notShowContract(int contractId);

	//通过供应商查询
	public List<Contract> findBySupplier(String supplierName);

}
