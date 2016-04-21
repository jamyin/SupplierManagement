package com.project.entity;

import java.util.HashSet;
import java.util.Set;


/**
 * Sysuser entity. @author MyEclipse Persistence Tools
 */

public class Sysuser  implements java.io.Serializable {


    // Fields    

     private Integer userId;
     private String userName;
     private String password;
     private String createDate;
     private Integer flag0;
     private Integer permission;
     private Set<Logtable> logtables = new HashSet();
     private Set<Moodtalk> moodtalks = new HashSet();


    // Constructors

    /** default constructor */
    public Sysuser() {
    }

    
    /** full constructor */
    public Sysuser(String userName, String password, String createDate, Integer flag0, Integer permission, Set logtables, Set moodtalks) {
        this.userName = userName;
        this.password = password;
        this.createDate = createDate;
        this.flag0 = flag0;
        this.permission = permission;
        this.logtables = logtables;
        this.moodtalks = moodtalks;
    }

   
    // Property accessors

    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public Integer getFlag0() {
        return this.flag0;
    }
    
    public void setFlag0(Integer flag0) {
        this.flag0 = flag0;
    }

    public Integer getPermission() {
        return this.permission;
    }
    
    public void setPermission(Integer permission) {
        this.permission = permission;
    }

    public Set getLogtables() {
        return this.logtables;
    }
    
    public void setLogtables(Set logtables) {
        this.logtables = logtables;
    }

    public Set getMoodtalks() {
        return this.moodtalks;
    }
    
    public void setMoodtalks(Set moodtalks) {
        this.moodtalks = moodtalks;
    }
   








}