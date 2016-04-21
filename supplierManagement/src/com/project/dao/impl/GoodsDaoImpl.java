package com.project.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.project.dao.GoodsDao;
import com.project.entity.Linkman;
import com.project.entity.Product;
import com.project.util.HibernateSessionFactory;

public class GoodsDaoImpl implements GoodsDao{
	// 获取HibernateTemplate
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean addGoods(Product goods) {
		//public boolean addGoods(Product goods,int supplierId) {
		System.out.println("增加商品");
		boolean flag=false;
		try {
			System.out.println("增加产品，"+goods.getSupplier().getSupplierId()+"和"+goods.getSupplier().getSupplierName());
			hibernateTemplate.save(goods);
			//String hql="UPDATE Product SET supplierId="+supplierId+" WHERE productId="+goods.getProductId();
			/*Session session=HibernateSessionFactory.getSession();
			Transaction tran=session.beginTransaction();
			Query query=session.createQuery(hql);
			query.executeUpdate();
			tran.commit();
			session.close();*/
			flag=true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean updateGoods(Product goods) {
		System.out.println("修改商品");
		boolean flag=false;
		try {
			hibernateTemplate.update(goods);
			flag=true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean deleteGoods(Product goods) {
		System.out.println("删除商品");
		boolean flag=false;
		try {
			hibernateTemplate.delete(goods);
			flag=true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Product> allGoods() {
		System.out.println("查询所有商品！");
		List<Product> list=hibernateTemplate.find("from Product");
		return list;
	}

	//通过ID查询
	@Override
	public Product findById(int id) {
		System.out.println("By ID Dao层");
		Product product = null;
		try {
			product = (Product) hibernateTemplate.get(Product.class, id);
			//hibernateTemplate.get
			System.out.println(product.getProductName()+"和"+product.getProductId());

		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return product;
	}

	//根据供应商Id查询
	@Override
	public List<Product> findBySupplierId(int supplierId) {
		return null;
	}

	//通过供应商name查询产品
	public List<Product> findBySupplierName(String supplierName){
		String hql="from Product where (flag0 is null or flag0<>1) and supplierName like '%"+supplierName+"%'";
		List<Product> list=hibernateTemplate.find(hql);
		System.out.println(list.size()+"%%%%%%%%");
		System.out.println(supplierName+"mingc");
		return list;
	}
	
	//通过名称查询
	@Override
	public List<Product> findByName( final String productName , final int startRow , final int size) {
		//实现分页查询
		System.out.println("通过名称模糊查询产品");
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql="from Product where (flag0 is null or flag0<>1) and productName like '%"+productName+"%'";
				Query query=session.createQuery(hql);
				query.setFirstResult(startRow);
				query.setMaxResults(size);
				System.out.println(query.list().size()+"模糊查询的集合长度");
				return query.list();
			}
		});
		//List list = 
		//未实现分页查询
		/*String hql="from Product where productName like '%"+productName+"%'";
		List list=hibernateTemplate.find(hql);
		System.out.println(list.size()+"********************");*/
		return list;
	}

	//分页查询，查询所有记录数
	@Override
	public int getCount(final String supplierName,final String productName) {
		long count=(Long) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = null;
				if(supplierName!=null){
					String hql = "select count(*) from Product where (flag0 is null or flag0<>1) and supplierName like '%"+supplierName+"%'";
					query = session.createQuery(hql);
				}else if(productName!=null){
					String hql = "select count(*) from Product where (flag0 is null or flag0<>1) and productName like '%"+productName+"%'";
					query = session.createQuery(hql);
				}else{
					final String hql="select count(*) from Product where flag0 is null or flag0<>1";
					query = session.createQuery(hql);
				}
				return query.uniqueResult();
			}
		});
		return (int) count;
	}

	//分页查询
	@Override
	public List getAllPage(final String supplierName,final String productName,final int startRow, final int size) {
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = null;
				StringBuffer hql = new StringBuffer("from Product where ( flag0 is null or flag0<>1 ) ");
				if(supplierName!=null&&!"".equals(supplierName)){
					System.out.println("供应商名称查询");
					hql = hql.append(" and supplierName like '%"+supplierName+"%' ");
							//"from Product where (flag0 is null or flag0<>1) and supplierName like '%"+supplierName+"%'";
					//query=session.createQuery(hql);
				}
				if(productName!=null&&!"".equals(productName)){
					System.out.println("产品名称查询");
					hql = hql.append(" and productName like '%"+productName+"%' ");
							//"from Product where (flag0 is null or flag0<>1) and productName like '%"+productName+"%'";
					//query=session.createQuery(hql);
				}
					System.out.println("全部查询");
					//String hql="from Product where flag0 is null or flag0<>1";
					query=session.createQuery(hql.toString());
				query.setFirstResult(startRow);
				query.setMaxResults(size);
				return query.list();
			}
		});
		return list;
	}

	//查询所有产品
	@Override
	public List<Product> wholeGoods() {
		@SuppressWarnings("unchecked")
		List<Product> list=hibernateTemplate.find("from Product");
		return list;
	}

	//通过id模糊查询
	@Override
	public List<Product> findListById(final int id,final int startRow,final int size ) {
		//实现分页查询
		System.out.println("通过ID模糊查询");
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql="from Product where (flag0 is null or flag0 <>1) and productId like '%"+id+"%'";
				Query query=session.createQuery(hql);
				query.setFirstResult(startRow);
				query.setMaxResults(size);
				return query.list();
			}
		});
		
		
		
		//未实现分页查询
		/*List<Product> list=null;
		try{
			String hql="from Product where productId like '%"+id+"%'";
			list=hibernateTemplate.find(hql);
		}catch(Exception e){
			e.printStackTrace();
		}*/
		return list;
	}

	@Override
	public List<Product> findProductByName(String supplierName) {
		
			StringBuffer hql=new StringBuffer("FROM Product WHERE 1=1 " +
					" AND (flag0 IS  NULL " +
					" OR flag0<>1)");
			if(null!=supplierName&&!("".equals(supplierName))){
				hql.append(" and supplierName = '"+supplierName+"'");
			}

			System.out.println(hql.toString());
			List <Product> list =hibernateTemplate.find(hql.toString());
			return list;
	}

	//修改flag0至不显示
	@Override
	public int notShowGoods(final int deleteId) {
		//boolean flag = false;
		int i = (Integer) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql = "update Product set flag0 = 1 where productId = ?";
				Query query = session.createQuery(hql);
				query.setLong(0, deleteId);
				return query.executeUpdate();
			}
		});
		return (int) i;
	}

}
