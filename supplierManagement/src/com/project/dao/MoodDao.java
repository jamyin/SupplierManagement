package com.project.dao;

import java.util.List;

import com.project.entity.Moodtalk;

//2014-12-30
//下午4:37:19
public interface MoodDao {

	//获取所有心情
	public List<Moodtalk> getAllMood(int startRow,int size);

	//获取心情总记录数
	public int getCount();
	
	//发表心情
	public boolean addMood();
	
	//删除心情
	public boolean deleteMood();
	
	//修改心情
	public boolean updateMood();
	
	//喜欢心情
	public boolean likeMood();
	
	//关注跟踪某人
	public boolean followingUserName();

}

