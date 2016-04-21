package com.project.dao.impl;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.project.dao.SupplierDao;
import com.project.entity.Contract;
import com.project.entity.Linkman;
import com.project.entity.Product;
import com.project.entity.Supplier;
import com.project.entity.Sysuser;
import com.project.util.DBHelper;
import com.project.util.HibernateSessionFactory;

public class SupplierDaoImpl implements SupplierDao {
	@Autowired
	private SessionFactory sessionFactory;

	// 获取HibernateTemplate
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public List<Supplier> findAllSupplier() {
		/**
		 * @author by Jam 2014-11-28 上午10:37:24
		 */
		// System.out.println("哇哇哇");
		List<Supplier> list = hibernateTemplate
				.find("FROM Supplier WHERE (flag0 IS  NULL OR flag0<>1) ORDER BY supplierName");
		// System.out.println(list.size());
		// System.out.println(list.get(1).getSupplierName());

		return list;
	}

	@Override
	public Supplier findSupplierByID(int id) {
		/**
		 * @author by Jam 2014-11-28 上午10:37:24
		 */
		// System.out.println("id=========================="+id);

		Supplier supplier = null;
		try {
			supplier = (Supplier) hibernateTemplate.get(Supplier.class, id);
			// hibernateTemplate.get

		} catch (DataAccessException e) {
			e.printStackTrace();
		}

		// SessionFactory sf=hibernateTemplate.getSessionFactory();
		// Session session=sessionFactory.getCurrentSession();
		// Supplier supplier = (Supplier)session.load(Supplier.class, id);
		// Query query =
		// session.createSQLQuery("select * from supplier where supplierID="+id);
		// List list = query.list();

		// Supplier supplier =(Supplier) hibernateTemplate.find(hql.toString());
		// List <Supplier> list
		// =hibernateTemplate.find("from Supplier where supplierId="+id);
		// Supplier supplier= null;
		// supplier=(Supplier) hibernateTemplate.get(Supplier.class, id);
		// System.out.println(supplier.getAttachment()+supplier.getBankAccount());
		return supplier;

	}

	@Override
	public List<Supplier> findSupplierByField(String supplierName,
			String speciality, String bigSort, String sort) {
		/**
		 * @author by Jam 2014-11-28 上午10:37:24
		 */
		// System.out.println("supplierName="+supplierName+",speciality="+speciality);
		StringBuffer hql = new StringBuffer("from Supplier where 1=1 "
				+ " AND ( flag0 IS  NULL " + " OR flag0<>1 )");
		if (null != supplierName && !("".equals(supplierName))) {
			hql.append(" and supplierName like '%" + supplierName + "%'");
		}
		if (null != speciality && !("".equals(speciality))) {
			hql.append(" and speciality like '%" + speciality + "%'");
		}
		if (null != bigSort && !("".equals(bigSort))
				&& !(bigSort.equals("请选择"))) {
			hql.append(" and bigSort like '%" + bigSort + "%'");
		}
		if (null != sort && !("".equals(sort)) && !(bigSort.equals("请选择"))) {
			hql.append(" and sort like '%" + sort + "%'");
		}
		System.out.println(hql.toString());
		List<Supplier> list = hibernateTemplate.find(hql.toString());
		/*
		 * List <Supplier> list
		 * =hibernateTemplate.find("from Supplier where 1=1 "+
		 * "and supplierName="+supplierName+ "and speciality="+speciality);
		 */
		// System.out.println(list.size());
		return list;

	}

	@Override
	public boolean addSupplier(Supplier supplier) {
		/**
		 * @author by Jam 2014-11-28 上午10:37:24
		 */
		// boolean str= (Boolean) hibernateTemplate.save(supplier);
		boolean flag = false;
		try {
			hibernateTemplate.save(supplier);
			Integer supplierId = supplier.getSupplierId();
			// hibernateTemplate.get(Supplier.class,supplierId);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		System.out.println(flag);
		return flag;

	}

	@Override
	public boolean addSupplier6(Supplier supplier, Linkman linkman,
			Contract contract, Product product) {
		/**
		 * @author Jam Yin
		 * 
		 *         Dec 7, 2014 11:45:44 PM
		 */
		boolean flag = false;
		try {
			linkman.setSupplier(supplier);
			contract.setSupplier(supplier);
			product.setSupplier(supplier);

			hibernateTemplate.save(supplier);
			hibernateTemplate.save(linkman);
			hibernateTemplate.save(contract);
			hibernateTemplate.save(product);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		System.out.println(flag);
		return flag;
	}

	@Override
	public boolean updateSupplier(Supplier supplier) {
		/**
		 * @author by Jam 2014-11-28 上午10:37:24
		 */
		boolean flag = false;
		Integer supplierID = supplier.getSupplierId();
		String supplierName = supplier.getSupplierName();
		try {
			// String
			// hql1="UPDATE Contract SET supplierName="+supplierName+"WHERE supplier.supplierName=contract.supplierName";
			// hibernateTemplate.find(hql3);
			hibernateTemplate.update(supplier);

			// String hql="UPDATE Supplier SET supplierName='"+supplierName+"'"+
			// " WHERE supplierId= '"+supplierID+"'";
			String hql1 = "UPDATE Linkman SET supplierName='" + supplierName
					+ "'" + " WHERE supplierId= '" + supplierID + "'";
			String hql2 = "UPDATE Product SET supplierName='" + supplierName
					+ "'" + " WHERE supplierId= '" + supplierID + "'";
			String hql3 = "UPDATE Contract SET supplierName='" + supplierName
					+ "'" + " WHERE supplierId= '" + supplierID + "'";
			Session session = HibernateSessionFactory.getSession();
			Transaction tran = session.beginTransaction();
			// Query query=session.createQuery(hql);
			Query query1 = session.createQuery(hql1);
			Query query2 = session.createQuery(hql2);
			Query query3 = session.createQuery(hql3);
			// int i=query.executeUpdate();
			int i1 = query1.executeUpdate();
			int i2 = query2.executeUpdate();
			int i3 = query3.executeUpdate();
			tran.commit();
			session.close();
			int j = i1 + i2 + i3;
			if (j == 3) {
				flag = true;
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return flag;

	}

	@Override
	public int deleteSupplier(int supplierNo) {
		/**
		 * @author by Jam 2014-11-28 上午10:37:24
		 */
		// com.project.util.DBHelper helper=new com.project.util.DBHelper();
		// String sql = "delete from supplier where supplierID = "+supplierNo;
		// return helper.executeUpdate(sql);
		// String
		// hql2="SELECT supplierName FROM Supplier WHERE supplierId = "+supplierNo;
		// Session
		// session=hibernateTemplate.getSessionFactory().getCurrentSession();
		// SessionFactory sf=hibernateTemplate.getSessionFactory();
		// Session session =sf.openSession();
		String hql = "UPDATE Supplier SET flag0=1 WHERE supplierID = "
				+ supplierNo;
		Session session = HibernateSessionFactory.getSession();
		Transaction tran = session.beginTransaction();
		Query query = session.createQuery(hql);
		query.executeUpdate();

		Supplier supplier = (Supplier) session.get(Supplier.class, supplierNo);
		String supplierName = supplier.getSupplierName();
		String hql1 = "UPDATE Linkman SET flag0=1 WHERE supplierName= '"
				+ supplierName + "'";
		String hql2 = "UPDATE Product SET flag0=1 WHERE supplierName= '"
				+ supplierName + "'";
		String hql3 = "UPDATE Contract SET flag0=1 WHERE supplierName= '"
				+ supplierName + "'";
		Query query1 = session.createQuery(hql1);
		Query query2 = session.createQuery(hql2);
		Query query3 = session.createQuery(hql3);
		query1.executeUpdate();
		query2.executeUpdate();
		int i = query3.executeUpdate();
		tran.commit();
		session.close();
		return i;
		// com.project.util.DBHelper helper=new com.project.util.DBHelper();
		// String sql =
		// "UPDATE supplier SET flag0='1' WHERE supplierID = "+supplierNo;

		// String supplierName=hibernateTemplate.find("hql1").toString();
		// String
		// hql3="UPDATE linkman SET flag0='1' WHERE supplierName= "+supplierName;
		// hibernateTemplate.getSessionFactory().getCurrentSession().createQuery("hql2");
		// String sql1 =
		// "UPDATE linkman SET flag0='1' WHERE supplierID= "+supplierNo;
		// System.out.println(sql1);
		// int i=helper.executeUpdate(sql);
		// com.project.util.DBHelper helper2=new com.project.util.DBHelper();
		// helper2.executeUpdate(sql1);
		// return i;
		// return helper.executeUpdate(sql);
		/*
		 * com.project.util.DBHelper helper=new com.project.util.DBHelper();
		 * String sql =
		 * "UPDATE supplier SET flag0='1' WHERE supplierID = "+supplierNo;
		 * String sql1 =
		 * "UPDATE linkman SET flag0='1' WHERE supplierID= "+supplierNo;
		 * System.out.println(sql1); int i=helper.executeUpdate(sql);
		 * com.project.util.DBHelper helper2=new com.project.util.DBHelper();
		 * helper2.executeUpdate(sql1); return i;
		 */
	}

	@Override
	public int deleteSupplier(String supplierNo[]) {
		/**
		 * @author by Jam 2014-11-29 下午4:21:20
		 */
		int count = 0;
		for (int i = 0; i < supplierNo.length; i++) {
			count += deleteSupplier(Integer.parseInt(supplierNo[i]));
		}

		return count;
	}

	@Override
	public List<Supplier> findSupp() {
		/**
		 * @author by Jam 2014-11-28 上午10:37:24
		 */
		// System.out.println("哇哇哇");
		List<Supplier> list = hibernateTemplate.find("from Supplier");
		return list;
	}

	@Override
	public List findAllContent(int supplierID) {
		/**
		 * @author by Jam 2014-12-10 上午9:21:49
		 */
		/*
		 * Supplier supplier = null; Linkman linkman =null; Contract contract
		 * =null; Product product =null; List list =new ArrayList();
		 * 
		 * DBHelper db=new DBHelper(); Connection conn=db.getConnection();
		 * Statement stmt = null; try { stmt=conn.createStatement(); } catch
		 * (SQLException e1) { e1.printStackTrace(); } String
		 * sql1="SELECT * FROM supplier WHERE supplierID="+supplierID; String
		 * sql2="SELECT * FROM contract WHERE supplierID="+supplierID; String
		 * sql3="SELECT * FROM linkman WHERE supplierID="+supplierID; String
		 * sql4="SELECT * FROM product WHERE supplierID="+supplierID;
		 * 
		 * try { ResultSet rs1=stmt.executeQuery(sql1); ResultSet rs2=
		 * stmt.executeQuery(sql2); ResultSet rs3= stmt.executeQuery(sql3);
		 * ResultSet rs4= stmt.executeQuery(sql4); // while(){} } catch
		 * (SQLException e1) { e1.printStackTrace(); }finally{ try {
		 * conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
		 * list.add(supplier); list.add(contract); list.add(linkman);
		 * list.add(product); return list; }
		 */
		return null;
	}

	@Override
	public List findAllSupplier6() {
		/**
		 * @author by Jam 2014-12-11 上午11:09:15
		 */
		List allllist = new ArrayList();
		/*
		 * List <Supplier> list1 =hibernateTemplate.find("from Supplier"); List
		 * <Contract> list2 =hibernateTemplate.find("from Contract"); List
		 * <Linkman> list3 =hibernateTemplate.find("from Linkman"); List
		 * <Product> list4 =hibernateTemplate.find("from Product");
		 * allllist.add(list1); allllist.add(list2); allllist.add(list3);
		 * allllist.add(list4);
		 */
		return allllist;
	}

	/**
	 * @author by Jam 2014-12-12 下午6:45:28
	 */
	// 分页查询
	@Override
	public List<Supplier> getAllPage(final String supplierName,
			final String speciality, final String bigSort, final String sort,
			final int startRow, final int size) {
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = null;
				StringBuffer hql = new StringBuffer(
						"from Supplier where (flag0 is null or flag0<>1)");
				if (supplierName != null && !"".equals(supplierName)) {

					hql = hql.append(" and supplierName like '%" + supplierName
							+ "%'");
				} 
				if (speciality != null && !"".equals(speciality)) {

					hql = hql.append(" and speciality like '%" + speciality
							+ "%'");
				}
				if (bigSort != null && !"".equals(bigSort) && !bigSort.equals("请选择") ) {

					hql = hql.append(" and bigSort ='" + bigSort + "'");
					System.err.println(hql);
				} 
				if (sort != null && !"".equals(sort) && !sort.equals("请选择")) {

					hql = hql.append(" and sort ='" + sort + "'");
					System.out.println(hql);
				}
				query = session.createQuery(hql.toString());
				query.setFirstResult(startRow);
				query.setMaxResults(size);
				return query.list();
			}
		});
		return list;
	}

	// 获得相对应的总页数，
	@Override
	public int getCount(final String supplierName, final String speciality,
			final String bigSort, final String sort) {
		long count = (Long) getHibernateTemplate().execute(
				new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "select count(*) from Supplier WHERE (flag0 IS NULL OR flag0<>1)";
						if (supplierName != null && !"".equals(supplierName)) {
							hql = hql + " and supplierName like '%"
									+ supplierName + "%'";
						}
						if (speciality != null && !"".equals(speciality)) {
							hql = hql + " and speciality like '%" + speciality
									+ "%'";
						}
						if (bigSort != null && !"".equals(bigSort) && !bigSort.equals("请选择") ) {
							hql = hql + " and bigSort ='" + bigSort + "'";
						}
						if (sort != null && !"".equals(sort) && !sort.equals("请选择") ) {
							hql = hql + " and sort ='" + sort + "'";
						}
						Query query = session.createQuery(hql);
						return query.uniqueResult();
					}
				});
		return (int) count;
	}

	@Override
	public Supplier findSuppIdByName(String supplierName) {
		/**
		 * @author by Jam 2014-12-18 下午3:27:15
		 */
		String supplierName1 = supplierName.trim(); // 兼容火狐
		String hql = "FROM Supplier WHERE (flag0 IS  NULL OR flag0<>1) and supplierName='"
				+ supplierName1 + "'";
		// Supplier supplier =(Supplier)
		// getHibernateTemplate().find(hql).get(0);
		// List<Supplier> list=getHibernateTemplate().find(hql);
		// Supplier supplier=list.get(0);
		// System.out.println(supplier.getSupplierId());
		// return supplier.getSupplierId();
		// Integer supplierId=(Integer) getHibernateTemplate().find(hql).get(0);
		// Supplier supplier=(Supplier) getHibernateTemplate().find(hql).get(0);

		List list = getHibernateTemplate().find(hql);
		Supplier supplier = (Supplier) list.get(0);

		/*
		 * Session session=HibernateSessionFactory.getSession(); Transaction
		 * tran=session.beginTransaction(); Query
		 * query=session.createQuery(hql);
		 */

		return supplier;

	}

	@Override
	public List<Supplier> findOverSuppList() {
		/**
		 * 查询所有过期供应商
		 * 
		 * @author by Jam 2014-12-30 下午3:23:41
		 */
		/*
		 * Calendar cal = Calendar.getInstance(); SimpleDateFormat formatter =
		 * new SimpleDateFormat("yyyy-MM-dd"); String
		 * today=formatter.format(cal.getTime()); System.out.println(today);
		 * java.sql.Date.valueOf(busLicenseValidity)
		 */
		String hql = "FROM Supplier WHERE (flag0 IS  NULL OR flag0<>1) "
				+ " AND (flag_red=1 OR (current_date()> busLicenseValidity) OR (current_date()> institutionValidity))"
				+ " ORDER BY supplierName";

		List<Supplier> list = hibernateTemplate.find(hql);
		return list;

	}

	// 根据供应商类型查询供应商
	@Override
	public List<Supplier> findSupplierByBigSort(final String bigSort) {
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				// String hql = "from Supplier where bigSort = "+bigSort;
				String hql = "from Supplier where (flag0 IS  NULL OR flag0<>1) and bigSort = '"
						+ bigSort + "'";
				Query query = session.createQuery(hql);

				return query.list();
			}
		});
		return list;
	}

	// 通过供应商分类，小分类，查询供应商
	@Override
	public List<Supplier> findSupplierBySort(final String sort) {
		System.out.println("通过小分类查询供应商：" + sort);
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				// , bigSort = '"+bigSort+"'
				String hql = "from Supplier  where (flag0 IS  NULL OR flag0<>1) and sort = '"
						+ sort + "'";
				Query query = session.createQuery(hql);

				return query.list();
			}
		});
		return list;
	}

	// 查询所有供应商，导出excle
	@Override
	public List<Supplier> findWholeSupplier() {
		String hql = "from Supplier where flag0 IS  NULL OR flag0<>1";
		List list = getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public List<Supplier> findOverSuppByField(String supplierName,
			String speciality, String bigSort, String sort) {
		/**
		 * @author by Jam 2014-12-30 下午5:10:10
		 */
		//Session session=hibernateTemplate.getSessionFactory().getCurrentSession();
		Session session = HibernateSessionFactory.getSession();
		Transaction tran = session.beginTransaction();
		StringBuffer sql = new StringBuffer("SELECT DISTINCT s.* from supplier s LEFT JOIN  product p ON s.supplierID=p.supplierID  WHERE ( s.flag0 IS  NULL  OR s.flag0<>1 ) " +
		                                   " AND  ( CURRENT_DATE > s.busLicenseValidity OR CURRENT_DATE > s.institutionValidity OR CURRENT_DATE > p.busLicenseValidity " +
		                                   " OR CURRENT_DATE > p.productCerValidity OR CURRENT_DATE > p.thirdpartyValidity)");
		if (null != supplierName && !("".equals(supplierName))) {
			sql.append(" and s.supplierName like '%" + supplierName + "%'");
		}
		if (null != speciality && !("".equals(speciality))) {
			sql.append(" and s.speciality like '%" + speciality + "%'");
		}
		if (null != bigSort && !("".equals(bigSort))
				&& !(bigSort.equals("请选择"))) {
			sql.append(" and s.bigSort like '%" + bigSort + "%'");
		}
		if (null != sort && !("".equals(sort)) && !(bigSort.equals("请选择"))) {
			sql.append(" and s.sort like '%" + sort + "%'");
		}
		System.out.println(sql.toString());
		List<Supplier> list =  session.createSQLQuery(sql.toString()).addEntity(Supplier.class).list();
		tran.commit();
		session.close();
		return list;
	}

	@Override
	public int getOverCount(String supplierName, String speciality,
			String bigSort, String sort) {
		/**
		 * @author by Jam
		 * 2015-1-6 下午3:05:25
		*/
		Session session = HibernateSessionFactory.getSession();
		Transaction tran = session.beginTransaction();
		StringBuffer sql = new StringBuffer("SELECT DISTINCT s.* from supplier s LEFT JOIN  product p ON s.supplierID=p.supplierID  WHERE ( s.flag0 IS  NULL  OR s.flag0<>1 ) " +
		                                   " AND  ( CURRENT_DATE > s.busLicenseValidity OR CURRENT_DATE > s.institutionValidity OR CURRENT_DATE > p.busLicenseValidity " +
		                                   " OR CURRENT_DATE > p.productCerValidity OR CURRENT_DATE > p.thirdpartyValidity)");
		if (null != supplierName && !("".equals(supplierName))) {
			sql.append(" and s.supplierName like '%" + supplierName + "%'");
		}
		if (null != speciality && !("".equals(speciality))) {
			sql.append(" and s.speciality like '%" + speciality + "%'");
		}
		if (null != bigSort && !("".equals(bigSort))
				&& !(bigSort.equals("请选择"))) {
			sql.append(" and s.bigSort like '%" + bigSort + "%'");
		}
		if (null != sort && !("".equals(sort)) && !(bigSort.equals("请选择"))) {
			sql.append(" and s.sort like '%" + sort + "%'");
		}
		System.out.println(sql.toString());
		List<Supplier> list =  session.createSQLQuery(sql.toString()).addEntity(Supplier.class).list();
		tran.commit();
		session.close();
		return list.size();
		
	}

	@Override
	public List<Supplier> getOverAllPage(String supplierName,
			String speciality, String bigSort, String sort, int startRow,
			int size) {
		/**
		 * @author by Jam
		 * 2015-1-6 下午3:05:25
		*/
		Session session = HibernateSessionFactory.getSession();
		Transaction tran = session.beginTransaction();
		StringBuffer sql = new StringBuffer("SELECT DISTINCT s.* from supplier s LEFT JOIN  product p ON s.supplierID=p.supplierID  WHERE ( s.flag0 IS  NULL  OR s.flag0<>1 ) " +
		                                   " AND  ( CURRENT_DATE > s.busLicenseValidity OR CURRENT_DATE > s.institutionValidity OR CURRENT_DATE > p.busLicenseValidity " +
		                                   " OR CURRENT_DATE > p.productCerValidity OR CURRENT_DATE > p.thirdpartyValidity)");
		if (null != supplierName && !("".equals(supplierName))) {
			sql.append(" and s.supplierName like '%" + supplierName + "%'");
		}
		if (null != speciality && !("".equals(speciality))) {
			sql.append(" and s.speciality like '%" + speciality + "%'");
		}
		if (null != bigSort && !("".equals(bigSort))
				&& !(bigSort.equals("请选择"))) {
			sql.append(" and s.bigSort like '%" + bigSort + "%'");
		}
		if (null != sort && !("".equals(sort)) && !(bigSort.equals("请选择"))) {
			sql.append(" and s.sort like '%" + sort + "%'");
		}
		System.out.println(sql.toString());
		List<Supplier> list =  session.createSQLQuery(sql.toString()).addEntity(Supplier.class).setFirstResult(startRow).setMaxResults(size).list();
		tran.commit();
		session.close();
		return list;
		
	}

}
