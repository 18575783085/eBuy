package com.ishopmall.model;

/**
 * 商品属性实体类
 */
public class ProductAttribute {
    private Integer id;
    private String prodId;
    private Integer typeId;
    private String typeName;
    private ProductAttribute parentAttribute;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProdId() {
        return prodId;
    }

    public void setProdId(String prodId) {
        this.prodId = prodId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public ProductAttribute getParentAttribute() {
        return parentAttribute;
    }

    public void setParentAttribute(ProductAttribute parentAttribute) {
        this.parentAttribute = parentAttribute;
    }

    @Override
    public String toString() {
        return "ProductAttribute{" +
                "id='" + id + '\'' +
                ", prodId='" + prodId + '\'' +
                ", typeId=" + typeId +
                ", typeName='" + typeName + '\'' +
                ", parentAttribute=" + parentAttribute +
                '}';
    }
}
