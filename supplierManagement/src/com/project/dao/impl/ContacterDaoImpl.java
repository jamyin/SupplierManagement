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

import com.project.dao.ContacterDao;
import com.project.entity.Linkman;
import com.project.entity.Supplier;
import com.project.util.HibernateSessionFactory;

public class ContacterDaoImpl implements ContacterDao {
	
	private HibernateTemplate hibernateTemplate;
    
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public List<Linkman> findAllLinkman() {
		/**
		 * @author by Jam
		 * 2014-12-2 上午11:44:45
		 */
		List <Linkman> list =hibernateTemplate.find("FROM Linkman WHERE flag0 IS   NULL OR flag0<>1");
		return list;
	}

	@Override
	public Linkman findLinkmanByID(int linkmanNo) {
		/**
		 * @author by Jam
		 * 2014-12-2 上午11:44:45
		 */
		Linkman linkman = null;
		try {
			linkman = (Linkman) hibernateTemplate.get(Linkman.class, linkmanNo);
			//hibernateTemplate.get

		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return linkman;
	}

	//通过name模糊查询
	@Override
	public List<Linkman> findLinkmanByName(final String linkmanName , final int startRow , final int size) {
		//回调函数
		/*List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql = "from Linkman where flag0 is null or flag0<> 1 and linkmanName like '%"+linkmanName+"%'";
				Query query = session.createQuery(hql);
				query.setFirstResult(startRow);
				query.setMaxResults(size);
				return query.list();
			}
		});*/
		
		StringBuffer hql=new StringBuffer("FROM Linkman WHERE 1=1 " +
				" AND (flag0 IS  NULL " +
				" OR flag0<>1)");
		if(null!=linkmanName&&!("".equals(linkmanName))){
			hql.append(" and linkmanName like '%"+linkmanName+"%'");
		}

		System.out.println(hql.toString());
		List <Linkman> list =hibernateTemplate.find(hql.toString());

		return list;
	}
	
	//通过供应商查询联系人
	@Override
	public List<Linkman> findContacterByName1(String supplierName) {
		/**
		 * @author by Jam
		 * 2014-12-2 上午11:44:45
		 */
		StringBuffer hql=new StringBuffer("FROM Linkman WHERE 1=1 " +
				" AND (flag0 IS  NULL " +
				" OR flag0<>1)");
		if(null!=supplierName&&!("".equals(supplierName))){
			hql.append(" and supplierName = '"+supplierName+"'");
		}

		System.out.println(hql.toString());
		List <Linkman> list =hibernateTemplate.find(hql.toString());

		return list;
	}
	@Override
	public boolean addLinkman(Linkman linkman) {
		/**
		 * @author by Jam
		 * 2014-12-2 上午11:44:45
		 */
		boolean flag=false;		
		try{
			hibernateTemplate.save(linkman);
			/*String hql="UPDATE Linkman SET supplierId="+supplierId+" WHERE linkmanNo="+linkman.getLinkmanNo();
			Session session=HibernateSessionFactory.getSession();
			Transaction tran=session.beginTransaction();
			Query query=session.createQuery(hql);
			query.executeUpdate();
			tran.commit();
			session.close();*/
		    flag=true;
		}catch (Exception e) {
            e.printStackTrace();
            flag=false;
		}
		System.out.println(flag);
		return flag;
	}

	@Override
	public boolean updateLinkman(Linkman linkman) {
		/**
		 * @author by Jam
		 * 2014-12-2 上午11:44:45
		 */
		boolean flag=false;
		try {
			hibernateTemplate.update(linkman);
			flag=true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public int deleteLinkman(int linkmanNo) {
		/**
		 * @author by Jam
		 * 2014-12-2 上午11:44:45
		 */
		//com.project.util.DBHelper helper=new com.project.util.DBHelper();
//		String sql = "delete from Linkman where linkmanNo = "+linkmanNo;
		//String sql = "UPDATE Linkman SET flag0='1' WHERE linkmanNo = "+linkmanNo;
		//return helper.executeUpdate(sql);
		String hql="UPDATE Linkman SET flag0=1 WHERE linkmanNo = "+linkmanNo;
		Session session=HibernateSessionFactory.getSession();
		Transaction tran=session.beginTransaction();
		Query query=session.createQuery(hql);
		int i =query.executeUpdate();
		tran.commit();
		session.close();
		return i;
	}

	@Override
	public int deleteLinkman(String[] contacterNos) {
		/**
		 * @author by Jam
		 * 2014-12-2 下午6:10:18
		*/
		int count = 0;	
		for (int i = 0; i < contacterNos.length; i++) {
			count += deleteLinkman(Integer.parseInt(contacterNos[i]));
		}
		
		return count;
	}

	//分页查询
	@Override
	public List<Linkman> getAllPage(final String supplierName,final String linkmanName,final int startRow, final int size) {
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = null;
				StringBuffer hql = new StringBuffer("from Linkman WHERE ( flag0 IS NULL OR flag0<>1 )");
				if(supplierName!=null&&!"".equals(supplierName)){
					System.out.println("根据供应商查询"+supplierName);
					//String hql = "from Linkman where (flag0 is null or flag0<>1) and supplierName like '%"+supplierName+"%'";
					//query = session.createQuery(hql);
					//hql = hql + " and supplierName  like '%"+supplierName+"%'";
					hql = hql.append(" and supplierName  like '%"+supplierName+"%'");
				}
				if(linkmanName!=null&&!"".equals(linkmanName)){
					System.out.println("根据联系人名称查询"+linkmanName);
					//String hql = "from Linkman where (flag0 is null or flag0<>1) and linkmanName like '%"+linkmanName+"%'";
					//query = session.createQuery(hql);
					//hql = hql +" and linkmanName like '%"+linkmanName+"%'";
					hql = hql.append(" and linkmanName like '%"+linkmanName+"%'");
				}/*else{
					System.out.println("查询所有联系人！");
					//String hql = "from Linkman WHERE flag0 IS  NULL OR flag0<>1";
					//query = session.createQuery(hql);
				}*/
				query = session.createQuery(hql.toString());
				query.setFirstResult(startRow);
				query.setMaxResults(size);
				return query.list();
			}
		});
		return list;
	}

	//查询总记录数
	@Override
	public int getCount(final String supplierName,final String linkmanName) {
		long count=(Long) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = null;
				if(supplierName!=null){
					String hql = "select count(*) from Linkman where (flag0 is null or flag0<>1) and supplierName like '%"+supplierName+"%'";
					query = session.createQuery(hql);
				}else if(linkmanName!=null){
					String hql = "select count(*) from Linkman where (flag0 is null or flag0<>1) and linkmanName like '%"+linkmanName+"%'";
					query = session.createQuery(hql);
				}else{
					String hql = "select count(*) from Linkman WHERE flag0 IS  NULL OR flag0<>1";
					query = session.createQuery(hql);
				}
				return query.uniqueResult();
			}
		});
		return (int) count;
	}

	//全部联系人，导出excle
	@Override
	public List<Linkman> findWholeContacter() {
		String hql = "from Linkman where flag0 IS  NULL OR flag0<>1";
		List list = getHibernateTemplate().find(hql);
		return list;
	}

}
