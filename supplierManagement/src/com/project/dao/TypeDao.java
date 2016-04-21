package com.project.dao;

import java.util.List;

import com.project.entity.Suppliertype;

public interface TypeDao {
	
	//查询所有节点
	public List<Suppliertype> allNode();
	
	//增加节点
	public boolean addNode(Suppliertype supplierType);
	
	//删除节点
	public boolean deleteNode();
	
	//修改节点
	public boolean updateNode();

	//通过typeId查询Node
	public Suppliertype findNodeById(int typeId);

}
