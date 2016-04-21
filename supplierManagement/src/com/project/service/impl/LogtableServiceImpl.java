package com.project.service.impl;

import java.util.List;

import com.project.dao.LogtableDao;
import com.project.entity.Logtable;
import com.project.service.LogtableService;

public class LogtableServiceImpl implements LogtableService{
	private LogtableDao logtableDao;

	//获取日志信息
	@Override
	public List<Logtable> getLogInfo() {
		return logtableDao.getLogInfo();
	}

	
	
	public LogtableDao getLogtableDao() {
		return logtableDao;
	}

	public void setLogtableDao(LogtableDao logtableDao) {
		this.logtableDao = logtableDao;
	}

	
}
