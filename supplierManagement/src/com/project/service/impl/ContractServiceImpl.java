package com.project.service.impl;

import java.util.List;

import com.project.dao.ContractDao;
import com.project.entity.Contract;
import com.project.service.ContractService;

public class ContractServiceImpl implements ContractService{

	private ContractDao contractDao;
	//查询所有合同
	@Override
	public List<Contract> allContract() {
		return contractDao.allContract();
	}

	@Override
	public boolean updateContract(Contract contract) {
		return contractDao.update(contract);
	}

	@Override
	public boolean addContract(Contract contract) {
		return contractDao.add(contract);
	}

	@Override
	public boolean deleteContract(Contract contract) {
		return contractDao.delete(contract);
	}

	//组合查询
	@Override
	public List<Contract> findContract() {
		return contractDao.findContract();
	}

	//通过ID查询
	@Override
	public Contract findById(int id) {
		return contractDao.findById(id);
	}

	//通过id模糊查询
	public List<Contract> findListById(int id ,int startRow , int size){
		return contractDao.findListById(id , startRow , size);
	}
	
	@Override
	public List findByName(String contractName , int startRow , int size) {
		return contractDao.findByName(contractName , startRow , size);
	}

	public ContractDao getContractDao() {
		return contractDao;
	}

	public void setContractDao(ContractDao contractDao) {
		this.contractDao = contractDao;
	}

	//分页查询，查询所有记录数
	@Override
	public int getCount(String supplierName,String contractName) {
		return contractDao.getCount(supplierName,contractName);
	}

	//分页查询
	@Override
	public List getAllPage(String supplierName,String contractName,int startRow, int size) {
		return contractDao.getAllPage(supplierName,contractName,startRow,size);
	}

	//查询所有合同
	@Override
	public List<Contract> wholeContract() {
		return contractDao.wholeContract();
	}

	//通过供应商名字查询合同
	@Override
	public List<Contract> findContractByName(String supplierName) {
		return contractDao.findContractByName(supplierName);
	}

	@Override
	public int notShowContract(int contractId) {
		return contractDao.notShowContract(contractId);
	}

	@Override
	public List<Contract> findBySupplier(String supplierName) {
		return contractDao.findBySupplier(supplierName);
	}

}
