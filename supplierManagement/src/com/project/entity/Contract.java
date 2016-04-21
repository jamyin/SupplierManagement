package com.project.entity;



/**
 * Contract entity. @author MyEclipse Persistence Tools
 */

public class Contract  implements java.io.Serializable {


    // Fields    

     private Integer contractId;
     private Supplier supplier;
     private String contractName;
     private String operator;
     private String partyA;
     private String partyB;
     private String partyAprincipal;
     private String partyBprincipal;
     private String project;
     private String receiptsPaymentType;
     private String payway;
     private String currency;
     private String operationPerson;
     private String dept;
     private String contractPrice;
     private String contractContent;
     private String contractRemark;
     private String registerDate;
     private String signDate;
     private String startDate;
     private String endDate;
     private String contractState;
     private String companyName;
     private String attachment;
     private Integer flag0;
     private String supplierName;


    // Constructors

    /** default constructor */
    public Contract() {
    }

    
    /** full constructor */
    public Contract(Supplier supplier, String contractName, String operator, String partyA, String partyB, String partyAprincipal, String partyBprincipal, String project, String receiptsPaymentType, String payway, String currency, String operationPerson, String dept, String contractPrice, String contractContent, String contractRemark, String registerDate, String signDate, String startDate, String endDate, String contractState, String companyName, String attachment, Integer flag0, String supplierName) {
        this.supplier = supplier;
        this.contractName = contractName;
        this.operator = operator;
        this.partyA = partyA;
        this.partyB = partyB;
        this.partyAprincipal = partyAprincipal;
        this.partyBprincipal = partyBprincipal;
        this.project = project;
        this.receiptsPaymentType = receiptsPaymentType;
        this.payway = payway;
        this.currency = currency;
        this.operationPerson = operationPerson;
        this.dept = dept;
        this.contractPrice = contractPrice;
        this.contractContent = contractContent;
        this.contractRemark = contractRemark;
        this.registerDate = registerDate;
        this.signDate = signDate;
        this.startDate = startDate;
        this.endDate = endDate;
        this.contractState = contractState;
        this.companyName = companyName;
        this.attachment = attachment;
        this.flag0 = flag0;
        this.supplierName = supplierName;
    }

   
    // Property accessors

    public Integer getContractId() {
        return this.contractId;
    }
    
    public void setContractId(Integer contractId) {
        this.contractId = contractId;
    }

    public Supplier getSupplier() {
        return this.supplier;
    }
    
    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public String getContractName() {
        return this.contractName;
    }
    
    public void setContractName(String contractName) {
        this.contractName = contractName;
    }

    public String getOperator() {
        return this.operator;
    }
    
    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getPartyA() {
        return this.partyA;
    }
    
    public void setPartyA(String partyA) {
        this.partyA = partyA;
    }

    public String getPartyB() {
        return this.partyB;
    }
    
    public void setPartyB(String partyB) {
        this.partyB = partyB;
    }

    public String getPartyAprincipal() {
        return this.partyAprincipal;
    }
    
    public void setPartyAprincipal(String partyAprincipal) {
        this.partyAprincipal = partyAprincipal;
    }

    public String getPartyBprincipal() {
        return this.partyBprincipal;
    }
    
    public void setPartyBprincipal(String partyBprincipal) {
        this.partyBprincipal = partyBprincipal;
    }

    public String getProject() {
        return this.project;
    }
    
    public void setProject(String project) {
        this.project = project;
    }

    public String getReceiptsPaymentType() {
        return this.receiptsPaymentType;
    }
    
    public void setReceiptsPaymentType(String receiptsPaymentType) {
        this.receiptsPaymentType = receiptsPaymentType;
    }

    public String getPayway() {
        return this.payway;
    }
    
    public void setPayway(String payway) {
        this.payway = payway;
    }

    public String getCurrency() {
        return this.currency;
    }
    
    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getOperationPerson() {
        return this.operationPerson;
    }
    
    public void setOperationPerson(String operationPerson) {
        this.operationPerson = operationPerson;
    }

    public String getDept() {
        return this.dept;
    }
    
    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getContractPrice() {
        return this.contractPrice;
    }
    
    public void setContractPrice(String contractPrice) {
        this.contractPrice = contractPrice;
    }

    public String getContractContent() {
        return this.contractContent;
    }
    
    public void setContractContent(String contractContent) {
        this.contractContent = contractContent;
    }

    public String getContractRemark() {
        return this.contractRemark;
    }
    
    public void setContractRemark(String contractRemark) {
        this.contractRemark = contractRemark;
    }

    public String getRegisterDate() {
        return this.registerDate;
    }
    
    public void setRegisterDate(String registerDate) {
        this.registerDate = registerDate;
    }

    public String getSignDate() {
        return this.signDate;
    }
    
    public void setSignDate(String signDate) {
        this.signDate = signDate;
    }

    public String getStartDate() {
        return this.startDate;
    }
    
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return this.endDate;
    }
    
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getContractState() {
        return this.contractState;
    }
    
    public void setContractState(String contractState) {
        this.contractState = contractState;
    }

    public String getCompanyName() {
        return this.companyName;
    }
    
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
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
   








}