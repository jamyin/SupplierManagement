package com.project.service.impl;

import java.util.List;

import com.project.dao.TypeDao;
import com.project.entity.Suppliertype;
import com.project.service.TypeService;

public class TypeServiceImpl implements TypeService{
	private TypeDao typeDao;

	//查询所有节点
	@Override
	public List<Suppliertype> allNode() {
		return typeDao.allNode();
	}

	//增加节点
	@Override
	public boolean addNode(Suppliertype supplierType) {
		return typeDao.addNode(supplierType);
	}

	//删除节点
	@Override
	public boolean deleteNode() {
		return typeDao.deleteNode();
	}

	//修改节点
	@Override
	public boolean updateNode() {
		return typeDao.updateNode();
	}

	//通过typeId查询Node
	@Override
	public Suppliertype findNodeById(int typeId) {
		
		return typeDao.findNodeById(typeId);
	}

	public TypeDao getTypeDao() {
		return typeDao;
	}

	public void setTypeDao(TypeDao typeDao) {
		this.typeDao = typeDao;
	}

	
	
}
