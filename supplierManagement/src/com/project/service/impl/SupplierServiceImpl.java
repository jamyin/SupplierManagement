package com.project.service.impl;

import java.util.List;

import com.project.dao.SupplierDao;
import com.project.dao.UserDao;
import com.project.entity.Contract;
import com.project.entity.Linkman;
import com.project.entity.Product;
import com.project.entity.Supplier;
import com.project.service.SupplierService;

public class SupplierServiceImpl implements SupplierService {
	private SupplierDao supplierDao;
	
	public SupplierDao getSupplierDao() {
		return supplierDao;
	}

	public void setSupplierDao(SupplierDao supplierDao) {
		this.supplierDao = supplierDao;
	}

	@Override
	public List<Supplier> findAllSupplier() {
		/**
		 * @author by Jam
		 * 2014-11-28 上午10:58:42
		 */
		return supplierDao.findAllSupplier();
	}

	@Override
	public Supplier findSupplierByID(int id) {
		/**
		 * @author by Jam
		 * 2014-11-28 上午10:58:42
		 */
		return supplierDao.findSupplierByID(id);

		
	}

	@Override
	public List<Supplier> findSupplierByField(String supplierName,String speciality,String bigSort,String sort) {
		/**
		 * @author by Jam
		 * 2014-11-28 上午10:58:42
		 */
		return supplierDao.findSupplierByField(supplierName,speciality,bigSort,sort);

	}

	@Override
	public boolean addSupplier(Supplier supplier) {
		/**
		 * @author by Jam
		 * 2014-11-28 上午10:58:42
		 */
		return supplierDao.addSupplier(supplier);

	}


	@Override
	public boolean updateSupplier(Supplier supplier) {
		/**
		 * @author by Jam
		 * 2014-11-28 上午10:58:42
		 */
		return supplierDao.updateSupplier(supplier);
	}

	@Override
	public int deleteSupplier(int supplierNo) {
		/**
		 * @author by Jam
		 * 2014-11-28 上午10:58:42
		 */
		return supplierDao.deleteSupplier(supplierNo);

	}

	@Override
	public int deleteEmp(String[] supplierNos) {
		/**
		 * @author by Jam
		 * 2014-12-1 上午11:04:31
		*/
		return supplierDao.deleteSupplier(supplierNos);

	}

	@Override
	public boolean addSupplier6(Supplier supplier, Linkman linkman,
			Contract contract,Product product) {
		/**
		 * @author Jam Yin
		 *
		 * Dec 7, 2014  11:42:52 PM
		 */
		return supplierDao.addSupplier6(supplier,linkman,contract,product);
	}

	@Override
	public List findAllContent(int supplierID) {
		/**
		 * @author by Jam
		 * 2014-12-10 上午9:20:54
		*/
		return supplierDao.findAllContent(supplierID);
	}

	@Override
	public List findAllSupplier6() {
		/**
		 * @author by Jam
		 * 2014-12-11 上午11:07:58
		*/
		return supplierDao.findAllSupplier6();
	}

	//分页查询
	@Override
	public List<Supplier> getAllPage(String supplierName,String speciality,String bigSort,String sort,int startRow, int size) {
		return supplierDao.getAllPage(supplierName,speciality,bigSort,sort,startRow,size);
	}

	@Override
	public int getCount(String supplierName,String speciality,String bigSort,String sort) {
		return supplierDao.getCount(supplierName,speciality,bigSort,sort);
	}

	@Override
	public Supplier findSuppIdByName(String supplierName) {
		/**
		 * @author by Jam
		 * 2014-12-18 下午3:25:11
		*/
		return supplierDao.findSuppIdByName(supplierName);

	}

	//根据供应商类型查询供应商
	@Override
	public List<Supplier> findSupplierByBigSort(String bigSort) {
		return supplierDao.findSupplierByBigSort(bigSort);
	}

	//通过供应商分类，小分类查询供应商
	@Override
	public List<Supplier> findSupplierBySort(String sort) {
		return supplierDao.findSupplierBySort(sort);
	}

	//查询所有供应商，导出excle
	@Override
	public List<Supplier> findWholeSupplier() {
		return supplierDao.findWholeSupplier();
	}

	@Override
	public List<Supplier> findOverSuppList() {
		/**
		 * @author by Jam
		 * 2014-12-30 下午3:20:47
		*/
		return supplierDao.findOverSuppList();
	}

	@Override
	public List<Supplier> findOverSuppByField(String supplierName,
			String speciality, String bigSort, String sort) {
		/**
		 * @author by Jam
		 * 2014-12-30 下午5:05:59
		*/
		return supplierDao.findOverSuppByField(supplierName,speciality,bigSort,sort);

	}

	@Override
	public int getOverCount(String supplierName, String speciality,
			String bigSort, String sort) {
		/**
		 * @author by Jam
		 * 2015-1-6 下午3:03:24
		*/
		return supplierDao.getOverCount(supplierName,speciality,bigSort,sort);
	}

	@Override
	public List<Supplier> getOverAllPage(String supplierName,
			String speciality, String bigSort, String sort, int startRow,
			int size) {
		/**
		 * @author by Jam
		 * 2015-1-6 下午3:03:24
		*/
		return supplierDao.getOverAllPage(supplierName,speciality,bigSort,sort,startRow,size);
	}

}
