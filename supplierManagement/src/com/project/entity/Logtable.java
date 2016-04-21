package com.project.entity;



/**
 * Logtable entity. @author MyEclipse Persistence Tools
 */

public class Logtable  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Sysuser sysuser;
     private String title;
     private String content;
     private String flag0;
     private String flag1;


    // Constructors

    /** default constructor */
    public Logtable() {
    }

    
    /** full constructor */
    public Logtable(Sysuser sysuser, String title, String content, String flag0, String flag1) {
        this.sysuser = sysuser;
        this.title = title;
        this.content = content;
        this.flag0 = flag0;
        this.flag1 = flag1;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Sysuser getSysuser() {
        return this.sysuser;
    }
    
    public void setSysuser(Sysuser sysuser) {
        this.sysuser = sysuser;
    }

    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public String getFlag0() {
        return this.flag0;
    }
    
    public void setFlag0(String flag0) {
        this.flag0 = flag0;
    }

    public String getFlag1() {
        return this.flag1;
    }
    
    public void setFlag1(String flag1) {
        this.flag1 = flag1;
    }
   








}