package com.project.entity;



/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product  implements java.io.Serializable {


    // Fields    

     private Integer productId;
     private Supplier supplier;
     private String productName;
     private String standard;
     private String amount;
     private String manufacturer;
     private String totalprice;
     private String remark;
     private String busLicenseValidity;
     private String institutionCertificate;
     private String taxCertificate;
     private String productCerValidity;
     private String thirdpartyValidity;
     private String attachment;
     private Integer flag0;
     private String supplierName;
     private String perPrice;


    // Constructors

    /** default constructor */
    public Product() {
    }

    
    /** full constructor */
    public Product(Supplier supplier, String productName, String standard, String amount, String manufacturer, String totalprice, String remark, String busLicenseValidity, String institutionCertificate, String taxCertificate, String productCerValidity, String thirdpartyValidity, String attachment, Integer flag0, String supplierName, String perPrice) {
        this.supplier = supplier;
        this.productName = productName;
        this.standard = standard;
        this.amount = amount;
        this.manufacturer = manufacturer;
        this.totalprice = totalprice;
        this.remark = remark;
        this.busLicenseValidity = busLicenseValidity;
        this.institutionCertificate = institutionCertificate;
        this.taxCertificate = taxCertificate;
        this.productCerValidity = productCerValidity;
        this.thirdpartyValidity = thirdpartyValidity;
        this.attachment = attachment;
        this.flag0 = flag0;
        this.supplierName = supplierName;
        this.perPrice = perPrice;
    }

   
    // Property accessors

    public Integer getProductId() {
        return this.productId;
    }
    
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Supplier getSupplier() {
        return this.supplier;
    }
    
    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public String getProductName() {
        return this.productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getStandard() {
        return this.standard;
    }
    
    public void setStandard(String standard) {
        this.standard = standard;
    }

    public String getAmount() {
        return this.amount;
    }
    
    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getManufacturer() {
        return this.manufacturer;
    }
    
    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getTotalprice() {
        return this.totalprice;
    }
    
    public void setTotalprice(String totalprice) {
        this.totalprice = totalprice;
    }

    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getBusLicenseValidity() {
        return this.busLicenseValidity;
    }
    
    public void setBusLicenseValidity(String busLicenseValidity) {
        this.busLicenseValidity = busLicenseValidity;
    }

    public String getInstitutionCertificate() {
        return this.institutionCertificate;
    }
    
    public void setInstitutionCertificate(String institutionCertificate) {
        this.institutionCertificate = institutionCertificate;
    }

    public String getTaxCertificate() {
        return this.taxCertificate;
    }
    
    public void setTaxCertificate(String taxCertificate) {
        this.taxCertificate = taxCertificate;
    }

    public String getProductCerValidity() {
        return this.productCerValidity;
    }
    
    public void setProductCerValidity(String productCerValidity) {
        this.productCerValidity = productCerValidity;
    }

    public String getThirdpartyValidity() {
        return this.thirdpartyValidity;
    }
    
    public void setThirdpartyValidity(String thirdpartyValidity) {
        this.thirdpartyValidity = thirdpartyValidity;
    }

    public String getAttachment() {
        return this.attachment;
    }
    
    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public Integer getFlag0() {
        return this.flag0;
    }
    
    public void setFlag0(Integer flag0) {
        this.flag0 = flag0;
    }

    public String getSupplierName() {
        return this.supplierName;
    }
    
    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getPerPrice() {
        return this.perPrice;
    }
    
    public void setPerPrice(String perPrice) {
        this.perPrice = perPrice;
    }
   








}