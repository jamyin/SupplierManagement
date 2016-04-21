package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.entity.Sysuser;

public interface LoginUpwdService {
	//根据帐号和密码，返回一个Map对象
	public Map<String,Object> login(String userCode,String userPassword);
	//操作日志
	//public boolean insertLogs(AsLogs aslogs);
	//登录成功之后，把登录时间修改为现在的时间
	public boolean updateAsUser(Sysuser asuser);
	//查询所有代理商用户
	public List<Sysuser> getAlllistDLS(String userName);
}
