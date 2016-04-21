package com.project.service.impl;

import java.util.List;

import com.project.dao.UserDao;
import com.project.entity.Sysuser;
import com.project.service.UserService;

public class UserServiceImpl implements UserService{
	private UserDao userDao;

	//查询所有用户
	@Override
	public List<Sysuser> allUser() {
		return userDao.allUser();
	}

	@Override
	public boolean updateUser(Sysuser user) {
		return userDao.updateUser(user);
	}

	@Override
	public boolean addUser(Sysuser user) {
		return userDao.addUser(user);
	}

	@Override
	public boolean deleteUser(Sysuser user) {
		return userDao.deleteUser(user);
	}

	//组合查询
	@Override
	public List<Sysuser> findUser() {
		return null;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	//根据用户id查询
	@Override
	public Sysuser findById(int id) {
		System.out.println("By ID");
		return userDao.findById(id);
	}
	
	//根据用户id查询
	@Override
	public List<Sysuser> findListById(int id,int starRow,int size) {
		System.out.println("By ID");
		return userDao.findListById(id,starRow,size);
	}

	//根据用户Name查询
	@Override
	public List<Sysuser> findByName(String userName,int id,int startRow,int size) {
		return userDao.FindByName(userName,id,startRow,size);
	}

	//分页查询
	@Override
	public List thePage(int starRow, int size) {
		return userDao.thePage(starRow,size);
	}

	//获取所有页面，分页查询
	@Override
	public List getAllPage(int startRow, int size) {
		System.out.println("分页查询2");
		return userDao.getAllPage(startRow,size);
	}

	//查询所有记录数
	public int getCount(String userName,int id){
		return userDao.getCount(userName,id);
	}

	//查询所有用户
	@Override
	public List<Sysuser> wholeUser() {
		return userDao.wholeUser();
	}

	//修改至不显示
	@Override
	public boolean updateFileUser(int id) {
		
		return userDao.updateFileUser(id);
	}

	//通过用户名查找，找回密码
	@Override
	public List findPassword(String name) {
		return userDao.findPassword(name);
	}
}
