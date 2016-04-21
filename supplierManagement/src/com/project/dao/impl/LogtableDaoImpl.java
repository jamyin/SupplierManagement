package com.project.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.project.dao.LogtableDao;
import com.project.entity.Logtable;

public class LogtableDaoImpl implements LogtableDao{
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}


	//获取日志信息
	@Override
	public List<Logtable> getLogInfo() {
		List list = getHibernateTemplate().find("from Logtable order by desc");
		return list;
	}

}
