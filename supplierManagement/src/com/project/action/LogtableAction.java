package com.project.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.project.entity.Logtable;
import com.project.service.LogtableService;

public class LogtableAction extends ActionSupport{
	private LogtableService logtableService;
	private List<Logtable> logList; 
	
	
	//显示日志信息
	public String getLogInfo(){
		logList = logtableService.getLogInfo();
		if(logList!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	
	
	

	public LogtableService getLogtableService() {
		return logtableService;
	}

	public void setLogtableService(LogtableService logtableService) {
		this.logtableService = logtableService;
	}

	public List<Logtable> getLogList() {
		return logList;
	}

	public void setLogList(List<Logtable> logList) {
		this.logList = logList;
	}
	
	
	
	
	
	

}
