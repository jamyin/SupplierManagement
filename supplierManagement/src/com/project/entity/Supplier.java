package com.project.entity;

import java.util.HashSet;
import java.util.Set;


/**
 * Supplier entity. @author MyEclipse Persistence Tools
 */

public class Supplier  implements java.io.Serializable {


    // Fields    

     private Integer supplierId;
     private String supplierName;
     private String productName;
     private String contacter;
     private String legalPerson;
     private String companyProperty;
     private String tel;
     private String fax;
     private String bank;
     private String bankAccount;
     private String taxCertificateNo;
     private String foodCerValidity;
     private String productCerValidity;
     private String thirdpartyValidity;
     private String businessLicense;
     private String busLicenseValidity;
     private String institutionCertificate;
     private String institutionValidity;
     private String companyAddr;
     private String website;
     private String email;
     private String speciality;
     private String servedProject;
     private String remark;
     private String inputDate;
     private Integer groupRemark;
     private String contractOrder;
     private String attachment;
     private String supplierStatus;
     private Integer flag0;
     private String briefIntroduction;
     private String registeredFund;
     private String brandName;
     private String industry;
     private String companySize;
     private String turnover;
     private String advantage;
     private String area;
     private String classicCase;
     private String cooperation;
     private String accountLicense;
     private String typeName;
     private String bigSort;
     private String sort;
     private Integer flagRed;
     private Set<Suppliertype> suppliertypes = new HashSet();
     private Set<Linkman> linkmans = new HashSet();
     private Set<Product> products = new HashSet();
     private Set<Contract> contracts = new HashSet();


    // Constructors

    /** default constructor */
    public Supplier() {
    }

    
    /** full constructor */
    public Supplier(String supplierName, String productName, String contacter, String legalPerson, String companyProperty, String tel, String fax, String bank, String bankAccount, String taxCertificateNo, String foodCerValidity, String productCerValidity, String thirdpartyValidity, String businessLicense, String busLicenseValidity, String institutionCertificate, String institutionValidity, String companyAddr, String website, String email, String speciality, String servedProject, String remark, String inputDate, Integer groupRemark, String contractOrder, String attachment, String supplierStatus, Integer flag0, String briefIntroduction, String registeredFund, String brandName, String industry, String companySize, String turnover, String advantage, String area, String classicCase, String cooperation, String accountLicense, String typeName, String bigSort, String sort, Integer flagRed, Set suppliertypes, Set linkmans, Set products, Set contracts) {
        this.supplierName = supplierName;
        this.productName = productName;
        this.contacter = contacter;
        this.legalPerson = legalPerson;
        this.companyProperty = companyProperty;
        this.tel = tel;
        this.fax = fax;
        this.bank = bank;
        this.bankAccount = bankAccount;
        this.taxCertificateNo = taxCertificateNo;
        this.foodCerValidity = foodCerValidity;
        this.productCerValidity = productCerValidity;
        this.thirdpartyValidity = thirdpartyValidity;
        this.businessLicense = businessLicense;
        this.busLicenseValidity = busLicenseValidity;
        this.institutionCertificate = institutionCertificate;
        this.institutionValidity = institutionValidity;
        this.companyAddr = companyAddr;
        this.website = website;
        this.email = email;
        this.speciality = speciality;
        this.servedProject = servedProject;
        this.remark = remark;
        this.inputDate = inputDate;
        this.groupRemark = groupRemark;
        this.contractOrder = contractOrder;
        this.attachment = attachment;
        this.supplierStatus = supplierStatus;
        this.flag0 = flag0;
        this.briefIntroduction = briefIntroduction;
        this.registeredFund = registeredFund;
        this.brandName = brandName;
        this.industry = industry;
        this.companySize = companySize;
        this.turnover = turnover;
        this.advantage = advantage;
        this.area = area;
        this.classicCase = classicCase;
        this.cooperation = cooperation;
        this.accountLicense = accountLicense;
        this.typeName = typeName;
        this.bigSort = bigSort;
        this.sort = sort;
        this.flagRed = flagRed;
        this.suppliertypes = suppliertypes;
        this.linkmans = linkmans;
        this.products = products;
        this.contracts = contracts;
    }

   
    // Property accessors

    public Integer getSupplierId() {
        return this.supplierId;
    }
    
    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public String getSupplierName() {
        return this.supplierName;
    }
    
    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getProductName() {
        return this.productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getContacter() {
        return this.contacter;
    }
    
    public void setContacter(String contacter) {
        this.contacter = contacter;
    }

    public String getLegalPerson() {
        return this.legalPerson;
    }
    
    public void setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson;
    }

    public String getCompanyProperty() {
        return this.companyProperty;
    }
    
    public void setCompanyProperty(String companyProperty) {
        this.companyProperty = companyProperty;
    }

    public String getTel() {
        return this.tel;
    }
    
    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getFax() {
        return this.fax;
    }
    
    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getBank() {
        return this.bank;
    }
    
    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getBankAccount() {
        return this.bankAccount;
    }
    
    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    public String getTaxCertificateNo() {
        return this.taxCertificateNo;
    }
    
    public void setTaxCertificateNo(String taxCertificateNo) {
        this.taxCertificateNo = taxCertificateNo;
    }

    public String getFoodCerValidity() {
        return this.foodCerValidity;
    }
    
    public void setFoodCerValidity(String foodCerValidity) {
        this.foodCerValidity = foodCerValidity;
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

    public String getBusinessLicense() {
        return this.businessLicense;
    }
    
    public void setBusinessLicense(String businessLicense) {
        this.businessLicense = businessLicense;
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

    public String getInstitutionValidity() {
        return this.institutionValidity;
    }
    
    public void setInstitutionValidity(String institutionValidity) {
        this.institutionValidity = institutionValidity;
    }

    public String getCompanyAddr() {
        return this.companyAddr;
    }
    
    public void setCompanyAddr(String companyAddr) {
        this.companyAddr = companyAddr;
    }

    public String getWebsite() {
        return this.website;
    }
    
    public void setWebsite(String website) {
        this.website = website;
    }

    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public String getSpeciality() {
        return this.speciality;
    }
    
    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getServedProject() {
        return this.servedProject;
    }
    
    public void setServedProject(String servedProject) {
        this.servedProject = servedProject;
    }

    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getInputDate() {
        return this.inputDate;
    }
    
    public void setInputDate(String inputDate) {
        this.inputDate = inputDate;
    }

    public Integer getGroupRemark() {
        return this.groupRemark;
    }
    
    public void setGroupRemark(Integer groupRemark) {
        this.groupRemark = groupRemark;
    }

    public String getContractOrder() {
        return this.contractOrder;
    }
    
    public void setContractOrder(String contractOrder) {
        this.contractOrder = contractOrder;
    }

    public String getAttachment() {
        return this.attachment;
    }
    
    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getSupplierStatus() {
        return this.supplierStatus;
    }
    
    public void setSupplierStatus(String supplierStatus) {
        this.supplierStatus = supplierStatus;
    }

    public Integer getFlag0() {
        return this.flag0;
    }
    
    public void setFlag0(Integer flag0) {
        this.flag0 = flag0;
    }

    public String getBriefIntroduction() {
        return this.briefIntroduction;
    }
    
    public void setBriefIntroduction(String briefIntroduction) {
        this.briefIntroduction = briefIntroduction;
    }

    public String getRegisteredFund() {
        return this.registeredFund;
    }
    
    public void setRegisteredFund(String registeredFund) {
        this.registeredFund = registeredFund;
    }

    public String getBrandName() {
        return this.brandName;
    }
    
    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getIndustry() {
        return this.industry;
    }
    
    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getCompanySize() {
        return this.companySize;
    }
    
    public void setCompanySize(String companySize) {
        this.companySize = companySize;
    }

    public String getTurnover() {
        return this.turnover;
    }
    
    public void setTurnover(String turnover) {
        this.turnover = turnover;
    }

    public String getAdvantage() {
        return this.advantage;
    }
    
    public void setAdvantage(String advantage) {
        this.advantage = advantage;
    }

    public String getArea() {
        return this.area;
    }
    
    public void setArea(String area) {
        this.area = area;
    }

    public String getClassicCase() {
        return this.classicCase;
    }
    
    public void setClassicCase(String classicCase) {
        this.classicCase = classicCase;
    }

    public String getCooperation() {
        return this.cooperation;
    }
    
    public void setCooperation(String cooperation) {
        this.cooperation = cooperation;
    }

    public String getAccountLicense() {
        return this.accountLicense;
    }
    
    public void setAccountLicense(String accountLicense) {
        this.accountLicense = accountLicense;
    }

    public String getTypeName() {
        return this.typeName;
    }
    
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getBigSort() {
        return this.bigSort;
    }
    
    public void setBigSort(String bigSort) {
        this.bigSort = bigSort;
    }

    public String getSort() {
        return this.sort;
    }
    
    public void setSort(String sort) {
        this.sort = sort;
    }

    public Integer getFlagRed() {
        return this.flagRed;
    }
    
    public void setFlagRed(Integer flagRed) {
        this.flagRed = flagRed;
    }

    public Set getSuppliertypes() {
        return this.suppliertypes;
    }
    
    public void setSuppliertypes(Set suppliertypes) {
        this.suppliertypes = suppliertypes;
    }

    public Set getLinkmans() {
        return this.linkmans;
    }
    
    public void setLinkmans(Set linkmans) {
        this.linkmans = linkmans;
    }

    public Set getProducts() {
        return this.products;
    }
    
    public void setProducts(Set products) {
        this.products = products;
    }

    public Set getContracts() {
        return this.contracts;
    }
    
    public void setContracts(Set contracts) {
        this.contracts = contracts;
    }
   








}