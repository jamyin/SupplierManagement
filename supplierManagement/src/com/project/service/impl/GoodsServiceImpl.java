package com.project.service.impl;

import java.util.List;

import com.project.dao.GoodsDao;
import com.project.entity.Product;
import com.project.service.GoodsService;

public class GoodsServiceImpl implements GoodsService{
	private GoodsDao goodsDao;

	@Override
	public boolean addGoods(Product goods) {
		//public boolean addGoods(Product goods,int supplierId) {
		//return goodsDao.addGoods(goods,supplierId);
		return goodsDao.addGoods(goods);
	}

	@Override
	public boolean updateGoods(Product goods) {
		return goodsDao.updateGoods(goods);
	}

	@Override
	public boolean deleteGoods(Product goods) {
		return goodsDao.deleteGoods(goods);
	}

	@Override
	public List<Product> allGoods() {
		return goodsDao.allGoods();
	}

	@Override
	public Product findById(int id) {
		return goodsDao.findById(id);
	}

	public GoodsDao getGoodsDao() {
		return goodsDao;
	}

	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

	//根据供应商Id查询食品
	@Override
	public List<Product> findBySupplierId(int supplierId) {
		return goodsDao.findBySupplierId(supplierId);
	}

	//根据供应商名称查询食品
	@Override
	public List<Product> findBySupplierName(String supplierName) {
		System.out.println("供应商到产品！");
		return goodsDao.findBySupplierName(supplierName);
	}

	//通过名称查询
	@Override
	public List findByName(String productName , int startRow , int size) {
		return goodsDao.findByName(productName ,startRow , size);
	}

	//分页查询，查询总记录数
	@Override
	public int getCount(String supplierName,String productName) {
		return goodsDao.getCount(supplierName,productName);
	}

	//分页查询
	@Override
	public List getAllPage(String supplierName,String productName,int startRow, int size) {
		return goodsDao.getAllPage(supplierName,productName,startRow,size);
	}

	//查询所有产品
	@Override
	public List<Product> wholeGoods() {
		return goodsDao.wholeGoods();
	}

	@Override
	public List<Product> findListById(int id,int startRow,int size) {
		return goodsDao.findListById(id,startRow,size);
	}

	@Override
	public List<Product> findProductByName(String supplierName) {
		return goodsDao.findProductByName(supplierName);
	}

	//通过修改flag0至不显示
	@Override
	public int notShowGoods(int deleteId) {
		return goodsDao.notShowGoods(deleteId);
	}

}
