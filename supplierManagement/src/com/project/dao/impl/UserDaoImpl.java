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
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.project.dao.UserDao;
import com.project.entity.Moodtalk;
import com.project.entity.Sysuser;
import com.project.util.HibernateSessionFactory;

public class UserDaoImpl implements UserDao{
	//获取HibernateTemplate
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	//查询所有用户
	@Override
	public List<Sysuser> allUser() {
		System.out.println("hibernateTemplate");
		List<Sysuser> list=hibernateTemplate.find("from Sysuser");
		System.out.println(list.get(1).getUserName());
		System.out.println(list.get(0).getUserName());
		System.out.println(list.size());
		return list;
	}

	//增加用户
	@Override
	public boolean addUser(Sysuser user) {
		System.out.println("addUser");
		boolean flag=false;
		try {
			hibernateTemplate.save(user);
			flag=true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}finally{
			getHibernateTemplate().flush();
		}
		return flag;
	}

	//删除用户
	@Override
	public boolean deleteUser(Sysuser user) {
		boolean flag=false;
		try {
			hibernateTemplate.delete(user);
			flag=true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return flag;
	}

	//修改用户
	@Override
	public boolean updateUser(Sysuser user) {
		boolean flag=false;
		try {
			hibernateTemplate.update(user);
			flag=true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 通过ID查询
	public Sysuser findById(int id) {
		System.out.println("By ID Dao层");
		Sysuser user=null;
		try {
			user = (Sysuser) hibernateTemplate.get(Sysuser.class, id);
			//hibernateTemplate.get
			System.out.println(user.getUserId()+"和"+user.getUserName());

		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	//模糊查询
	public List<Sysuser> findListById(final int id,final int starRow,final int size) {
		//模糊查询分页
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql="from Sysuser where (flag0 is null or flag0<>1) and userID like '%"+id+"%'";
				Query query=session.createQuery(hql);
				query.setFirstResult(starRow);
				query.setMaxResults(size);
				System.out.println(query.list().size()+"用户模糊list的长度");
				return query.list();
			}
		});
 		
		
		
		//模糊查询未分页
		/*List<Sysuser> list=null;
		try{
			String hql="from Sysuser where userID like '%"+id+"%'";
			list=hibernateTemplate.find(hql);
			if(list!=null){
				return list;
			}else{
				list=hibernateTemplate.find(hql);
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
		}*/
		return list;
	}
	
	//通过用户名模糊查询
	//通过用户名查询
	@Override
	public List<Sysuser> FindByName(final String userName,final int id,final int stratRow,final int size) {
		System.out.println("By Name Dao层");
		//分页查询
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = null;
				//int count;
				if(userName!=null){
					System.out.println("用户名查询！");
					String hql="from Sysuser where (flag0 is null or flag0<>1) and userName like '%"+userName+"%'";
					query = session.createQuery(hql);
					//count = query.list().size();
				}else if(id!=0){
					System.out.println("用户编号查询");
					String hql = "from Sysuser where (flag0 is null or flag0<>1) and userID like '%"+id+"%'";
					query = session.createQuery(hql);
					//count = query.list().size();
				}else{
					System.out.println("全部查询");
					String hql = "from Sysuser where flag0 is null or flag0<>1";
					query = session.createQuery(hql);
					//count = query.list().size();
				}
				query.setFirstResult(stratRow);
				query.setMaxResults(size);
				return query.list();
			}
		});
		//未分页实现
		/*List<Sysuser> list = null;
		try {
			//String hql="from Sysuser where userName='"+userName+"'";
			String hql="from Sysuser where userName like '%"+userName+"%'";
			list = hibernateTemplate.find(hql);
			//System.out.println(list.get(0).getPassword()+list.get(0).getUserId());
		} catch (DataAccessException e) {
			e.printStackTrace();
		}*/
		return list;
	}

	//分页查询,查询总页数
	@Override
	public List thePage(final int starRow,final int size) {
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "from Sysuser where flag0 is null or flag0<>1";
				Query query = session.createQuery(hql);
				query.setFirstResult(starRow);
				query.setMaxResults(size);
				List list = query.list();
				return list;
			}
		});
		return list;
	}
	
	//分页查询getAllPage
	@Override
	public List<Moodtalk> getAllPage(final int startRow,final int size) {
		System.out.println("分页查询3");
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql="from Sysuser where flag0 is null or flag0<>1";
				Query query=session.createQuery(hql);
				query.setFirstResult(startRow);
				query.setMaxResults(size);
				return query.list();
			}
		});
		return list;
	}
	
	//查询所有记录数
	public int getCount(final String userName,final int id){
		long count= (Long) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = null;
				if(userName!=null){
					String hql = "select count(*) from Sysuser where (flag0 is null or flag0<>1) and userName like '%"+userName+"%'";
					query = session.createQuery(hql);
				}else if(id!=0){
					String hql = "select count(*) from Sysuser where (flag0 is null or flag0<>1) and userID like '%"+id+"%'";
					query=session.createQuery(hql);
				}else{
					final String hql="select count(*) from Sysuser where flag0 is null or flag0<>1";
					query=session.createQuery(hql);
				}
				return query.uniqueResult();
			}
		});
		return (int) count;
	}
	//查询所有用户，非分页
	@Override
	public List<Sysuser> wholeUser() {
		System.out.println("chaxsuoyou d ");
		List<Sysuser> list=hibernateTemplate.executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql="from Sysuser";
				Query query = session.createQuery(hql);
				//query.setFirstResult(startRow);
				//query.setMaxResults(size);
				return query.list();
			}
		});
		return list;
	}
	
	//修改用户至不显示
	@Override
	public boolean updateFileUser(int id) {
		boolean flag = false;
		Session session = null;
		// HibernateTemplate获取session修改
		try {
			System.out.println("121");
			 session= HibernateSessionFactory.getSession();
			// Session session =
			// hibernateTemplate.getSessionFactory().getCurrentSession();
			System.out.println(session);
			// String hql = "update Sysuser set flag0=1 where userID="+id;
			String hql = "update Sysuser set flag0 = '1' where userID = ?";
			Query query = session.createQuery(hql);
			query.setInteger(0, id);
			query.executeUpdate();
			Transaction transaction = session.beginTransaction();
			transaction.commit();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}finally{
			session.close();
		}
		return flag;
	}
	
	//通过用户名查找，找回密码
	@Override
	public List findPassword(String userName) {
		List list = null;
		try {
			//String hql="from Sysuser where userName='"+userName+"'";
			String hql="from Sysuser where userName ='" + userName+"'";
			list = hibernateTemplate.find(hql);
			//System.out.println(list.get(0).getPassword()+list.get(0).getUserId());
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return list;
	}
}
