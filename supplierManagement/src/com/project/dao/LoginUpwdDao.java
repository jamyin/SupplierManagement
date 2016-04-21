package com.project.dao;

import java.util.List;

import com.project.entity.Sysuser;

public interface LoginUpwdDao{
	//根据帐号和密码，返回一个Map对象
	public Sysuser findasUser(String userCode);
	//查询所有代理商用户
	public List<Sysuser> getAlllistDLS(String userName);
	
	//修改
	public boolean update(Sysuser user);
	
}
