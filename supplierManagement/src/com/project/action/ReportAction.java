package com.project.action;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

import org.apache.struts2.ServletActionContext;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class ReportAction extends BaseReportAction{
	private String typename;
	//private Logger logger = Logger.getLogger(ReportAction.class);
	
	public String reportPdf() {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		StringBuffer sb=new StringBuffer();
		sb.append("select userName,password from Sysuser");
/*		sb.append("select d.money,u.user_name from as_account_detail d inner join as_user u on d.user_id=u.id" +
				" where d.user_id=(select id from as_user where role_id=2)");
*/		sb.append(ServletActionContext.getRequest().getSession().getAttribute("sql"));
		String sql = sb.toString();
		try {
			//1.注册驱动
			Class.forName("org.hibernate.dialect.MySQLDialect");
			//2.获得数据库的连接
			 con = (Connection) DriverManager.getConnection("jdbc:mysql://192.168.1.211:3306/supplierman", "root", "root");
			//3.获得Statement对象
			stmt = (PreparedStatement) con.prepareStatement(sql);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			reportPdfSQL("detail.jasper",sql,"detail.pdf",con,stmt,null);
		return SUCCESS;
	}
	public String reportexcel() {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		StringBuffer sb=new StringBuffer();
		sb.append("select userName,password from Sysuser");
/*		sb.append("select d.money,u.user_name from as_account_detail d inner join as_user u on d.user_id=u.id" +
				" where d.user_id=(select id from as_user where role_id=2)");
*/		//sb.append(ServletActionContext.getRequest().getSession().getAttribute("sql"));
		String sql = sb.toString();
		try {
			//1.注册驱动
			Class.forName("org.hibernate.dialect.MySQLDialect");
			//2.获得数据库的连接
			 con = (Connection) DriverManager.getConnection("jdbc:mysql://192.168.1.211:3306/supplierman", "root", "root");
			//3.获得Statement对象
			stmt = (PreparedStatement) con.prepareStatement(sql);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			reportExcelSQL("detail.jasper",sql,"detail.xls",con,stmt,null);
		return SUCCESS;
	}
	private void reportPdfSQL(String jasperPath,String sql,String fileName,Connection conn,PreparedStatement ps,Map parameters){
		ResultSet rs = null;
		File reportFile = new File(this.getRequest().getRealPath("/reports/"+jasperPath));
		if(reportFile != null && reportFile.exists()){
			try {
				rs = ps.executeQuery();
				//logger.error("+++++++++++++"+conn);
				byte[] bytes = null;
				bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),parameters,new JRResultSetDataSource(rs));
				
		        if (bytes != null && bytes.length > 0)
		        {
		        	this.getResponse().setContentType("textml;charset=UTF-8");
		        	this.getResponse().setContentType("application/pdf");
		        	this.getResponse().setHeader("Content-Disposition", "attachment;filename="+fileName);
		        	this.getResponse().setContentLength(bytes.length);
		        	ServletOutputStream out = this.getServletOutputStream();
		        	out.write(bytes,0,bytes.length);
		        	out.flush();
		        	//this.closeServletOutputStream(out);
		        }
			} catch (SQLException e) {
				e.printStackTrace();
			}catch (JRException e) {
				e.printStackTrace();
			}catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(rs!=null){
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(ps!=null){
					try {
						ps.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					conn = null;
					rs = null;
					ps = null;
				}
				if(reportFile != null){
					reportFile = null;
				}
			}
		}else{
			//logger.error("++++++++++++++++go else");
		}
		this.getOut().write("对不起，系统原因或者查询错误导致报表没有生成，请重试。");
		this.closeOut(this.getOut());
		
	}
	
	private void reportExcelSQL(String jasperPath,String sql,String fileName,Connection conn,PreparedStatement ps,Map parameters){
		ResultSet rs = null;
		File reportFile = new File(this.getRequest().getRealPath("/reports/"+jasperPath));
		if(reportFile != null && reportFile.exists()){
			try {
				rs = ps.executeQuery();
				byte[] bytes = null;
				JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(),parameters,new JRResultSetDataSource(rs));
		        JRXlsExporter exporter = new JRXlsExporter();
		        ByteArrayOutputStream xlsReport = new ByteArrayOutputStream();
		        exporter.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
		        exporter.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, xlsReport);
		        exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE); // 删除记录最下面的空行
		        exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,Boolean.FALSE);// 删除多余的ColumnHeader
		        exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);// 显示边框
		        exporter.exportReport();
		        bytes = xlsReport.toByteArray();
		       
		        //System.out.println(bytes.length);
		        if (bytes != null && bytes.length > 0)
		        {
		        	this.getResponse().setContentType("textml;charset=UTF-8");
		        	this.getResponse().setContentType("application/vnd.ms-excel");
		        	this.getResponse().setHeader("Content-Disposition", "attachment;filename="+fileName);
		        	this.getResponse().setContentLength(bytes.length);
		        	ServletOutputStream out = this.getServletOutputStream();
		        	out.write(bytes,0,bytes.length);
		        	out.flush();
		        	//this.closeServletOutputStream(out);
		        }
			} catch (SQLException e) {
				e.printStackTrace();
			}catch (JRException e) {
				e.printStackTrace();
			}catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(rs!=null){
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(ps!=null){
					try {
						ps.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					conn = null;
					rs = null;
					ps = null;
				}
				if(reportFile != null){
					reportFile = null;
				}
			}
		}else{
			//logger.error("++++++++++++++++go else");
		}
		this.getOut().write("对不起，系统原因或者查询错误导致报表没有生成，请重试。");
		this.closeOut(this.getOut());
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

}
