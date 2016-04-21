package com.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.dao.LoginUpwdDao;
import com.project.entity.Sysuser;
import com.project.service.LoginUpwdService;


@SuppressWarnings("rawtypes")
public class LoginUpwdServiceImpl implements LoginUpwdService{
	private LoginUpwdDao loginUpwdDao;
	//根据帐号和密码，返回一个Map对象
		public Map<String, Object> login(String userName, String password) {
			Map<String, Object> map=new HashMap<String, Object>();
			Sysuser findasUser = loginUpwdDao.findasUser(userName);
			if (findasUser!=null) {
				if(findasUser.getPassword().equals(password)){
					map.put("user",findasUser );
					map.put("isLogin", true);
				}else{
					map.put("msg","用户名或密码错误");
					map.put("isLogin", false);
				}
			}else{
				map.put("msg", "用户名不存在");
				map.put("isLogin", false);
			}
			return map;
		}
		public void setLoginUpwdDao(LoginUpwdDao loginUpwdDao) {
			this.loginUpwdDao = loginUpwdDao;
		}
		public boolean updateAsUser(Sysuser user) {
			return loginUpwdDao.update(user);
		}
		@Override
		public List<Sysuser> getAlllistDLS(String userName) {
			return loginUpwdDao.getAlllistDLS(userName);
		}
		
}
