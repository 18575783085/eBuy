package com.ishopmall.service;

import com.ishopmall.model.ItemCat;
import com.ishopmall.model.Product;
import com.ishopmall.model.ProductAttribute;

import java.util.List;

/**
 * 商品展示页面查询
 * @author JAM
 * 2017年11月24日16:47:59
 */

public interface GoodsDetails {
    /**
     * 根据商品ID查询出商品详细信息（主表）
     * @param id 商品ID
     * @return 返回一个商品对象
     */
    Product loadProductInfo(String id);

    /**
     * 加载当前商品的所属类及父类
     * @param categoryId
     * @return
     */
    ItemCat loadProductItem(String categoryId);

    /**
     * 加载商品信息
     * @param id 商品id
     * @return
     */
    List<ProductAttribute> loadProductAttribute(String id);

    /**
     * 用于加载推荐【适合小数据量加载，仅仅加载商品id，商品名称】
     * @param ItemCatId
     * @return
     */
    List<Product> loadRecommended(String ItemCatId,int pageNum);

    /**
     * 用于加载推荐【适合小数据量加载，仅仅加载商品id，商品名称】
     * @param ItemCatId
     * @return
     */
    List<Product> loadRecommended(String ItemCatId);
}
