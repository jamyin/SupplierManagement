package com.project.service;

import java.util.List;

import com.project.entity.Sysuser;

public interface UserService {
	//查询所有用户wholeUser
	//public List<Sysuser> wholeUser(int startRow , int size);
	public List<Sysuser> wholeUser();
	
	// 查询所有用户，分页查询
	public List<Sysuser> allUser();

	// 修改用户
	public boolean updateUser(Sysuser user);
	
	//修改用户不显示
	public boolean updateFileUser(int id);
	
	// 增加用户
	public boolean addUser(Sysuser user);

	// 删除用户
	public boolean deleteUser(Sysuser user);
	
	//组合查询
	public List<Sysuser> findUser();
	
	//根据用户ID删除
	public Sysuser findById(int id);
	
	//模糊查询
	public List<Sysuser> findListById(int id,int starRow,int size);

	//根据用户Name查询
	public List<Sysuser> findByName(String userName,int id,int startRow,int size);
	
	//分页查询
	public List thePage(int starRow,int size);
	
	//获得所有页数
	public List getAllPage(int startRow,int size);
	
	//查询所有记录数
	public int getCount(String userName,int id);

	//找回密码，通过用户名查找
	public List findPassword(String name);
	
}
