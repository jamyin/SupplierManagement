package com.project.entity;



/**
 * Linkman entity. @author MyEclipse Persistence Tools
 */

public class Linkman  implements java.io.Serializable {


    // Fields    

     private Integer linkmanNo;
     private Supplier supplier;
     private String linkmanName;
     private String linkmanSex;
     private String linkmantelephone;
     private String linkmantel;
     private String linkmanfax;
     private String linkmanemail;
     private String linkmanInDate;
     private String linkmanCompany;
     private Integer flag0;
     private String linkmanjob;
     private String supplierName;


    // Constructors

    /** default constructor */
    public Linkman() {
    }

    
    /** full constructor */
    public Linkman(Supplier supplier, String linkmanName, String linkmanSex, String linkmantelephone, String linkmantel, String linkmanfax, String linkmanemail, String linkmanInDate, String linkmanCompany, Integer flag0, String linkmanjob, String supplierName) {
        this.supplier = supplier;
        this.linkmanName = linkmanName;
        this.linkmanSex = linkmanSex;
        this.linkmantelephone = linkmantelephone;
        this.linkmantel = linkmantel;
        this.linkmanfax = linkmanfax;
        this.linkmanemail = linkmanemail;
        this.linkmanInDate = linkmanInDate;
        this.linkmanCompany = linkmanCompany;
        this.flag0 = flag0;
        this.linkmanjob = linkmanjob;
        this.supplierName = supplierName;
    }

   
    // Property accessors

    public Integer getLinkmanNo() {
        return this.linkmanNo;
    }
    
    public void setLinkmanNo(Integer linkmanNo) {
        this.linkmanNo = linkmanNo;
    }

    public Supplier getSupplier() {
        return this.supplier;
    }
    
    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public String getLinkmanName() {
        return this.linkmanName;
    }
    
    public void setLinkmanName(String linkmanName) {
        this.linkmanName = linkmanName;
    }

    public String getLinkmanSex() {
        return this.linkmanSex;
    }
    
    public void setLinkmanSex(String linkmanSex) {
        this.linkmanSex = linkmanSex;
    }

    public String getLinkmantelephone() {
        return this.linkmantelephone;
    }
    
    public void setLinkmantelephone(String linkmantelephone) {
        this.linkmantelephone = linkmantelephone;
    }

    public String getLinkmantel() {
        return this.linkmantel;
    }
    
    public void setLinkmantel(String linkmantel) {
        this.linkmantel = linkmantel;
    }

    public String getLinkmanfax() {
        return this.linkmanfax;
    }
    
    public void setLinkmanfax(String linkmanfax) {
        this.linkmanfax = linkmanfax;
    }

    public String getLinkmanemail() {
        return this.linkmanemail;
    }
    
    public void setLinkmanemail(String linkmanemail) {
        this.linkmanemail = linkmanemail;
    }

    public String getLinkmanInDate() {
        return this.linkmanInDate;
    }
    
    public void setLinkmanInDate(String linkmanInDate) {
        this.linkmanInDate = linkmanInDate;
    }

    public String getLinkmanCompany() {
        return this.linkmanCompany;
    }
    
    public void setLinkmanCompany(String linkmanCompany) {
        this.linkmanCompany = linkmanCompany;
    }

    public Integer getFlag0() {
        return this.flag0;
    }
    
    public void setFlag0(Integer flag0) {
        this.flag0 = flag0;
    }

    public String getLinkmanjob() {
        return this.linkmanjob;
    }
    
    public void setLinkmanjob(String linkmanjob) {
        this.linkmanjob = linkmanjob;
    }

    public String getSupplierName() {
        return this.supplierName;
    }
    
    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }
   








}