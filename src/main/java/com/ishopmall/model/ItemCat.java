package com.ishopmall.model;

import java.util.Date;

/**
 * 描述：
 * 商品类别
 *
 * @author JAM
 * @create 2017-11-19 12:31
 **/
public class ItemCat {
    private Integer Id;
    private Integer parentId;
    private String name;
    private Integer status;
    private ItemCat parentItemCat;

    public Integer getpId(){
        return parentId;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ItemCat getParentItemCat() {
        return parentItemCat;
    }

    public void setParentItemCat(ItemCat parentItemCat) {
        this.parentItemCat = parentItemCat;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ItemCat{" +
                "Id='" + Id + '\'' +
                ", parentId=" + parentId +
                ", name='" + name + '\'' +
                ", status=" + status +
                ", parentItemCat=" + parentItemCat +
                '}';
    }
}
