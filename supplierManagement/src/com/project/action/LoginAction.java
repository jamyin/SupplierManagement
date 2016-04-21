package com.project.action;


import java.util.List;
import java.util.Map;


import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;


import com.opensymphony.xwork2.ActionSupport;
import com.project.entity.Sysuser;
import com.project.service.LoginUpwdService;

public class LoginAction extends ActionSupport implements SessionAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	private String errorMessage;
	private LoginUpwdService loginUpwdService;
	private Sysuser user; // 用户对象
	private String randStr;// 获取页面输入的验证码
	private List<Sysuser> userlist;//用户集合
	private int reportType; //下拉列表选项的值
	//登陆
	public String login() throws Exception {
		String randomNum = (String) session.get("random");
		if (randStr == null || randStr == "" || randomNum == null
				|| randomNum == "") {
			errorMessage = "验证码错误了！";
			return INPUT;
		}
		try {
			int randStrnum = Integer.parseInt(randStr);
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		if (randomNum.equals(randStr)) {
			System.out.println(user.getUserName()+"登录");
			//ServletActionContext.getRequest().getSession().setAttribute(name, value)
			Map<String, Object> map = loginUpwdService.login(
					user.getUserName(), user.getPassword());
			boolean isLogin = (Boolean) map.get("isLogin");
			if (isLogin) {
				user = (Sysuser) map.get("user");
				//将登录用户放在session中
				ServletActionContext.getRequest().getSession().setAttribute("user", user);
				session.put("user", user);
				System.out.println("+++++++++++");
				System.out.println(session.get(user.getUserName())+"session中的userName");
				return SUCCESS;
			} else {
				errorMessage = (String) map.get("msg");
				return INPUT;
			}
		} else {
			errorMessage = "验证码错误了！";
			return INPUT;
		}

	}
	
	//修改密码
	public String updatePass() throws Exception{
		Sysuser as=(Sysuser) session.get("user");
		if(!user.getPassword().equals(as.getPassword())){
			errorMessage= "oldpwddif";
		}else if(!user.getUserName().equals(user.getUserName())){
			errorMessage="2pwddif";
		}else {
			//as.setLastUpdateTime(new Date());
			as.setPassword(user.getUserName());
			boolean updateUser = loginUpwdService.updateAsUser(as);
			if(updateUser){
				ServletActionContext.getRequest().getSession().removeAttribute("user");
				ServletActionContext.getRequest().getSession().invalidate();
				errorMessage="success";
			}else{
				errorMessage= "oldpwddif";
			}
		}
		return SUCCESS;
	}
	//退出
	public String exitSystem()throws Exception{
		System.out.println("exitSystem");
		ServletActionContext.getRequest().getSession().removeAttribute("user");
		ServletActionContext.getRequest().getSession().invalidate();
		return SUCCESS;
	}
	//搜索用户
	public String serchUser()throws Exception{
		userlist=loginUpwdService.getAlllistDLS(user.getUserName());
		System.out.println(user.getUserName()); 
		return SUCCESS;
	}
	public Sysuser getAsuser() {
		return user;
	}

	public void setAsuser(Sysuser user) {
		this.user = user;
	}

	public void setLoginUpwdService(LoginUpwdService loginUpwdService) {
		this.loginUpwdService = loginUpwdService;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getRandStr() {
		return randStr;
	}

	public void setRandStr(String randStr) {
		this.randStr = randStr;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public int getReportType() {
		return reportType;
	}
	public void setReportType(int reportType) {
		this.reportType = reportType;
	}
	public List<Sysuser> getUserlist() {
		return userlist;
	}
	public void setUserlist(List<Sysuser> userlist) {
		this.userlist = userlist;
	}
	public Map<String, Object> getSession() {
		return session;
	}

	public Sysuser getUser() {
		return user;
	}

	public void setUser(Sysuser user) {
		this.user = user;
	}

	public LoginUpwdService getLoginUpwdService() {
		return loginUpwdService;
	}
	
}
