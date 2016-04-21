package com.project.entity;



/**
 * Moodtalk entity. @author MyEclipse Persistence Tools
 */

public class Moodtalk  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Sysuser sysuser;
     private String mood;
     private String flag0;
     private String flag1;


    // Constructors

    /** default constructor */
    public Moodtalk() {
    }

	/** minimal constructor */
    public Moodtalk(Integer id) {
        this.id = id;
    }
    
    /** full constructor */
    public Moodtalk(Integer id, Sysuser sysuser, String mood, String flag0, String flag1) {
        this.id = id;
        this.sysuser = sysuser;
        this.mood = mood;
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

    public String getMood() {
        return this.mood;
    }
    
    public void setMood(String mood) {
        this.mood = mood;
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