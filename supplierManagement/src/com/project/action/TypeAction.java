package com.project.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.project.entity.Suppliertype;
import com.project.service.TypeService;

public class TypeAction extends ActionSupport{
	private int typeId;
	private String typeName;
	private List<Suppliertype> typeList;//节点集合
	private TypeService typeService;
	
	//查询所有节点
	public String allNode(){
		typeList =  typeService.allNode();
		if(typeList!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//通过节点id查询
	public String findNodeBy(){
		Suppliertype supplierType = typeService.findNodeById(typeId);
		if(supplierType!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//增加节点
	public String addNode(){
		Suppliertype supplierType = typeService.findNodeById(typeId);
		boolean flag = typeService.addNode(supplierType);
		if(flag){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public List<Suppliertype> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<Suppliertype> typeList) {
		this.typeList = typeList;
	}

	public TypeService getTypeService() {
		return typeService;
	}

	public void setTypeService(TypeService typeService) {
		this.typeService = typeService;
	}

	
}
