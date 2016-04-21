package com.project.entity;



/**
 * Suppliertype entity. @author MyEclipse Persistence Tools
 */

public class Suppliertype  implements java.io.Serializable {


    // Fields    

     private Integer typeId;
     private Supplier supplier;


    // Constructors

    /** default constructor */
    public Suppliertype() {
    }

    
    /** full constructor */
    public Suppliertype(Supplier supplier) {
        this.supplier = supplier;
    }

   
    // Property accessors

    public Integer getTypeId() {
        return this.typeId;
    }
    
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Supplier getSupplier() {
        return this.supplier;
    }
    
    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }
   








}