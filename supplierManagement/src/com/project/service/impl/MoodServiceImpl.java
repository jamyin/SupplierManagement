package com.project.service.impl;

import java.util.List;

import com.project.dao.MoodDao;
import com.project.entity.Moodtalk;
import com.project.service.MoodService;

//2014-12-30
//下午4:38:56
public class MoodServiceImpl implements MoodService{
	private MoodDao moodDao;
	
	public MoodDao getMoodDao() {
		return moodDao;
	}
	
	public void setMoodDao(MoodDao moodDao) {
		this.moodDao = moodDao;
	}

	//获取所有心情
	@Override
	public List<Moodtalk> getAllMood(int startRow,int size) {
		return moodDao.getAllMood(startRow,size);
	}

	//获取分页记录的总记录数
	@Override
	public int getCount() {
		return moodDao.getCount();
	}

	//发表说说
	@Override
	public boolean addMood() {
		return false;
	}

	//删除说说
	@Override
	public boolean deleteMood() {
		return false;
	}

	//修改说说
	@Override
	public boolean updateMood() {
		return false;
	}

	//喜欢说说
	@Override
	public boolean likeMood() {
		return false;
	}

	//关注某人
	@Override
	public boolean followingUserName() {
		return false;
	}

	//设置权限
	@Override
	public boolean setLimit() {
		return false;
	}
	
	

}

