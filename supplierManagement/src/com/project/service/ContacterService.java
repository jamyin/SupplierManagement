package com.project.service;

import java.util.List;

import com.project.entity.Linkman;



public interface ContacterService {
	//分页查询
	public List<Linkman> getAllPage(String supplierName,String linkmanName,int startRow,int size);
	
	//求总记录
	public int getCount(String supplierName,String linkmanName);
	
	//查询所有联系人
	public List<Linkman> findAllLinkman();
	
	//按ID查询联系人
	public Linkman findLinkmanByID(int linkmanNo);
	
	//按姓名查询联系人，模糊查询
	public List<Linkman> findLinkmanByName(String linkmanName , int startRow , int size);

	//增加联系人
	//public boolean addLinkman(Linkman linkman, Integer supplierId);
	public boolean addLinkman(Linkman linkman);
	
	//修改联系人
	public boolean updateLinkman(Linkman linkman);
	
	//删除联系人
	public int deleteLinkman(int linkmanNo);

	public List<Linkman> findContacterByName1(String linkmanName);

	//全部联系人，导出excle
	public List<Linkman> findWholeContacter();


}
