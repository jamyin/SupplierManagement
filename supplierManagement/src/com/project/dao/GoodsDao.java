package com.project.dao;

import java.util.List;

import com.project.entity.Product;

public interface GoodsDao {
	// 增加商品
	//public boolean addGoods(Product goods,int supplierId);
	public boolean addGoods(Product goods);

	// 修改商品
	public boolean updateGoods(Product goods);

	// 删除商品
	public boolean deleteGoods(Product goods);

	//查询所有产品
	public List<Product> wholeGoods();
	
	// 查询所有商品
	public List<Product> allGoods();

	// 按ID查询商品
	public Product findById(int id);
	
	//通过id模糊查询
	public List<Product> findListById(int id,int startRow,int size);
	
	//通过名称查询
	public List findByName(String productName,int startRoe,int size);
	
	//根据供应商ID查询食品
	public List<Product> findBySupplierId(int supplierId);
	
	//根据供应商Name查询产品
	public List<Product> findBySupplierName(String supplierName);
	
	//分页查询，查询所有记录数
	public int getCount(String supplierName,String productName);
	
	//分页查询
	public List getAllPage(String supplierName,String productName,int startRow,int size);

	public List<Product> findProductByName(String supplierName);

	//修改flag0至不显示
	public int notShowGoods(int deleteId);

}
