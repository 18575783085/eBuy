package com.ishopmall.model;

import java.util.Date;

public class ShopCart {
    private String userId;
    private String cartId;
    private String prodId;
    private Integer prodNum;
    private Date created;
    private Date updated;
    private Product product;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

    public String getProdId() {
        return prodId;
    }

    public void setProdId(String prodId) {
        this.prodId = prodId;
    }

    public Integer getProdNum() {
        return prodNum;
    }

    public void setProdNum(Integer prodNum) {
        this.prodNum = prodNum;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "ShopCart{" +
                "userId='" + userId + '\'' +
                ", cartId='" + cartId + '\'' +
                ", prodId='" + prodId + '\'' +
                ", prodNum=" + prodNum +
                ", created=" + created +
                ", updated=" + updated +
                ", product=" + product +
                '}';
    }
}
