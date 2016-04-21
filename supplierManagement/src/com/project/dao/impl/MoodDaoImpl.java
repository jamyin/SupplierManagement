package com.project.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.project.dao.MoodDao;

//2014-12-30
//下午4:37:36
public class MoodDaoImpl implements MoodDao{
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	//获取所有心情
	@Override
	public List getAllMood(final int startRow,final int size) {
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql = "from Moodtalk";
				Query query = session.createQuery(hql);
				query.setFirstResult(startRow);
				query.setMaxResults(size);
				return query.list();
			}
		});
		return list;
	}

	//获取心情总记录数
	@Override
	public int getCount() {
		long count = (Long) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql = "select count(*) from Moodtalk";
				Query query = session.createQuery(hql);
				return query.uniqueResult();
			}
		});
		return (int) count;
	}

	//发表心情
	@Override
	public boolean addMood() {
		return false;
	}

	@Override
	public boolean deleteMood() {
		return false;
	}

	@Override
	public boolean updateMood() {
		return false;
	}

	@Override
	public boolean likeMood() {
		return false;
	}

	@Override
	public boolean followingUserName() {
		return false;
	}
	
	

}

