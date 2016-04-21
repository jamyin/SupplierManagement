package com.project.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.project.entity.Sysuser;

public interface UserDao {
	//查询所有用户
	public List<Sysuser> wholeUser();
	
	//查询所有用户，分页查询
	public List<Sysuser> allUser();
	
	//增加用户
	public boolean addUser(Sysuser user);
	
	//删除用户
	public boolean deleteUser(Sysuser user);
	
	//修改用户
	public boolean updateUser(Sysuser user);
	
	//通过ID查询
	public Sysuser findById(int id);
	
	//模糊查询，
	public List<Sysuser> findListById(int id,int starRow,int size);
	
	//通过用户名查询
	public List<Sysuser> FindByName(String userName,int id,int startRow,int size);

	//分页查询
	public List thePage(int starRow, int size);
	
	//获取所有页面，分页查询
	public List getAllPage(int startRow, int size);
	
	//查询所有记录数
	public int getCount(String userName,int id);

	//修改用户至不显示
	public boolean updateFileUser(int id);

	//找回密码，通过用户名查找
	public List findPassword(String name);
	

}
