package com.project.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.project.entity.Sysuser;
import com.project.service.UserService;
import com.project.util.Page;

public class UserAction extends ActionSupport{
	private Sysuser user;
	private int id;
	private int deleteId;//删除ID
	private String name;
	private List<Sysuser> userlist;
	private UserService userService;
	private String message;//作为返回值
	//private Page page;//引入page页
	private int size=15;//每页显示数
	private int index;//当前页
	private int startRow;//开始记录数
	private int count;//总记录数
	private int totalPageCount;//总页数
	
	//查询所有用户，userlist
	public String wholeUser(){
		/*startRow=(index-1)*size;
		count=userService.getCount();
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
		}*/
		
		//userlist=userService.wholeUser(startRow , size);
		userlist=userService.wholeUser();
		if(userlist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
		
	}
	
	//查询所有用户，分页查询,模糊查询
	public String allUser(){
		//userlist=userService.allUser();
		startRow=(index-1)*size;
		count=userService.getCount(name,id);
		System.out.println("count判断值："+count);
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
		/*userlist=userService.getAllPage(startRow, size);*/
		userlist=userService.findByName(name,id,startRow,size);
		if(userlist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//根据用户ID查询
	public String findListById(){
		System.out.println(id+"按ID查询");
		startRow=(index-1)*size;
		count=userService.getCount(name,id);
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
		userlist=userService.findListById(id,startRow,size);
		if(userlist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	
	//根据用户Name模糊查询，同时查询所有的用户
	public String findByName(){
		System.out.println("By Name "+name);
		startRow=(index-1)*size;
		count=userService.getCount(name,id);
		System.out.println("count判断值："+count);
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
		
		userlist=userService.findByName(name,id,startRow,size);
		if(userlist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//通过用户名查询，找回密码
	public String findPassword(){
		userlist=userService.findPassword(name);
		if(user!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//点击修改
	public String clickUpdateUser(){
		System.out.println("点击要修改的："+id);
		user=userService.findById(id);
		if(user!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//修改用户
	public String updateUser(){
		//user.setUserName(userName);
		System.out.println(user.getUserName()+"修改方法里");
		boolean flag=userService.updateUser(user);
		if(flag){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//修改用户字段，不显示 拉黑
	public String updateFileUser(){
		System.out.println("修改至不显示");
		boolean flag=userService.updateFileUser(id);
		if(flag){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//增加用户
	public String addUser(){
		System.out.println("增加用户");
		System.out.println(user.getUserName());
		/*if(user.getFlag0().equals("管理员")){
			user.setFlag0(0);
		}else if(user.getFlag0().equals("查询员")){
			user.setFlag0(1);
		}*/
		System.out.println(user.getUserName()+user.getPassword()+user.getCreateDate()+user.getFlag0());
		boolean flag=userService.addUser(user);
		if(flag){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}

	//删除用户
	public String deleteUser(){
		System.out.println("删除操作");
		System.out.println("删除ID："+deleteId);
		user=userService.findById(deleteId);
		boolean flag=userService.deleteUser(user);
		System.out.println(user.getUserName());
		if(flag){
			message="删除成功！";
			return SUCCESS;
		}else{
			message="删除失败！";
			return INPUT;
		}
	}

	//用户分页显示，总页数
	public String thePage(){
		//总页数 
		//index为当前页，
		//userlist=userService.allUser();
		//page.setTotalCount(userlist.size());
		/*if(page.getIndex()>=page.getTotalPageCount()){
			page.setIndex(page.getTotalPageCount());
		}
		System.out.println(page.getTotalPageCount());
		int startRow=page.getStartRow();
		int size=page.getSize();*/
		userlist=userService.thePage(startRow,size);
		if(userlist!=null){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	//分页查询getAllPage
	public String getAllPage(){
		/*System.out.println("分页查询");
		userlist=userService.getAllPage(page.getStartRow(), page.getSize());
		System.out.println("&*&*&*&*&*&*&"+page.getStartRow()+page.getSize());
		page.setTotalCount(userService.getCount());
		page.setPageNo();*/
		if(userlist!=null){
			return SUCCESS;
		}
		return INPUT;
	}

	public Sysuser getUser() {
		return user;
	}

	public void setUser(Sysuser user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDeleteId() {
		return deleteId;
	}

	public void setDeleteId(int deleteId) {
		this.deleteId = deleteId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Sysuser> getUserlist() {
		return userlist;
	}

	public void setUserlist(List<Sysuser> userlist) {
		this.userlist = userlist;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
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
