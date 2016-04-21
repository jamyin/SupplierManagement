package com.project.service;

import java.util.List;

import com.project.entity.Contract;


public interface ContractService {
	//查询所有合同
	public List<Contract> wholeContract();
	
	// 查询所有合同，分页查询
	public List<Contract> allContract();

	// 修改合同
	public boolean updateContract(Contract contract);

	// 增加合同
	//public boolean addContract(Contract contract, Integer supplierId);
	public boolean addContract(Contract contract);

	// 删除合同
	public boolean deleteContract(Contract contract);

	// 组合查询
	public List<Contract> findContract();

	// 根据合同ID删除
	public Contract findById(int id);
	
	//通过id模糊查询
	public List<Contract> findListById(int id , int startRow , int size);

	// 根据合同Name查询
	public List findByName(String contractName , int startRow , int size);
	
	//查询所有页数
	public int getCount(String supplierName,String contractName);
	
	public List getAllPage(String supplierName,String contractName,int startRow,int size);

	public List<Contract> findContractByName(String supplierName);

	//修改flag0至不显示
	public int notShowContract(int contractId);

	//通过供应商查询
	public List<Contract> findBySupplier(String supplierName);

}
