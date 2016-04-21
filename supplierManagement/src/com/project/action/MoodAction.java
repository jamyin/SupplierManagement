package com.project.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.project.service.MoodService;

//2014-12-30
//下午4:36:03
public class MoodAction extends ActionSupport{
	private MoodService moodService;
	private List moodList;
	
	//分页相关个属性
	private int size=15;//每页显示数
	private int index;//当前页
	private int startRow;//开始记录数
	private int count;//总记录数
	private int totalPageCount;//总页数 
	
	//查询所有心情，说说
	public String getAllMood(){
		startRow=(index-1)*size;
		count=moodService.getCount();
		if(index==0){
			index=1;
		}
		if(count%size==0){
			totalPageCount=count/size;
		}else{
			totalPageCount=count/size+1;
		}
		if(index>totalPageCount){
			index=totalPageCount;
		}
		
		moodList = moodService.getAllMood(startRow,size);
		if(moodList!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}

	public MoodService getMoodService() {
		return moodService;
	}

	public void setMoodService(MoodService moodService) {
		this.moodService = moodService;
	}

	public List getMoodList() {
		return moodList;
	}

	public void setMoodList(List moodList) {
		this.moodList = moodList;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	
	

}

