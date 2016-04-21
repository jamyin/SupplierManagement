package com.project.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.project.dao.LoginUpwdDao;
import com.project.entity.Sysuser;


public class LoginUpwdDaoImpl implements LoginUpwdDao {
	private HibernateTemplate hibernateTemplate;
	
	//根据帐号和密码，返回一个Map对象
	public Sysuser findasUser(final String userName) {
		Sysuser sysuser=(Sysuser) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query createQuery = session.createQuery("from Sysuser where userName=?");
				createQuery.setString(0, userName);
				Sysuser user=(Sysuser) createQuery.uniqueResult();
				return user;
			}
		});
		return sysuser;
	}

	@Override
	public List<Sysuser> getAlllistDLS( final String userName) {
		@SuppressWarnings("unchecked")
		List<Sysuser> users=getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session s) throws HibernateException,
					SQLException {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
				SQLQuery createSQLQuery = s.createSQLQuery("select {a.*} from sysuser a where userID=2 and userName like ");
				createSQLQuery.setString(0, "'%"+userName+"%'");
						createSQLQuery.addEntity("a", Sysuser.class);
				return createSQLQuery.list();
			}
		});
		return users;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean update(Sysuser user) {
		return false;
	}
	
		
}
