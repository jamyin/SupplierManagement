package com.project.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class FileDownloadAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String fileName;
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) throws Exception {
		this.fileName = fileName;
		//this.fileName = new String(fileName.getBytes("ISO-8859-1"), "UTF-8");

		/*try {
			this.fileName = new String(fileName.getBytes("ISO8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	public InputStream getDownloadFile() throws Exception {
/*		url="D:\\upFile";
		StringBuffer sb=new StringBuffer();
		sb.append(url);
		sb.append("\");
		sb.append(fileName);*/   
		/*return ServletActionContext.getServletContext().getResourceAsStream(
				"D:\\upFile\\好盆友.txt");*/
		//ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		//ServletActionContext.getResponse().setHeader("Content-Disposition","attachment;fileName="+java.net.URLEncoder.encode(fileName, "UTF-8"));
		//new String(filename.getBytes("gb2312"),"iso8859-1"));
	    //File file = new File("D:\\upFile\\"+fileName.getBytes("utf-8"),"iso8859-1");
		
		//先将jsp通过get或者post获取到的字段转为本页面使用的字符集。
		//fileName = new String(fileName.getBytes("ISO8859-1"), "utf-8");

		//再将字段内容转为struts2配置文件设置的ISO8859-1的字符集。
		//String downFileName = new String(fileName.getBytes("GBK"), "ISO8859-1");
        //File file = new File("D:\\upFile\\"+downFileName);
		ServletActionContext.getResponse().setHeader("Content-disposition","attachment;filename="+new String(fileName.getBytes("gb2312"),"iso8859-1"));
		File file = new File("D:\\upFile\\"+fileName);
		
	    InputStream is = null;
		try {
			is = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	    return is;

	}

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

}