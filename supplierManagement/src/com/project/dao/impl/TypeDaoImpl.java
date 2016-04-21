package com.project.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.project.dao.TypeDao;
import com.project.entity.Suppliertype;

public class TypeDaoImpl implements TypeDao{
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	//查询所有节点
	@Override
	public List<Suppliertype> allNode() {
		List<Suppliertype> list = getHibernateTemplate().find("from SupplierType");
		return list;
	}

	//增加节点
	@Override
	public boolean addNode(Suppliertype supplierType) {
		boolean flag = (Boolean) getHibernateTemplate().save(supplierType);
		return flag;
	}

	//删除节点
	@Override
	public boolean deleteNode() {
		return false;
	}

	//修改节点
	@Override
	public boolean updateNode() {
		return false;
	}

	//通过typeId查询SupplierType
	@Override
	public Suppliertype findNodeById(int typeId) {
		Suppliertype supplierType = (Suppliertype) getHibernateTemplate().load(Suppliertype.class, typeId);
		return supplierType;
	}

}
