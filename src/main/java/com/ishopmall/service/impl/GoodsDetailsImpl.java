package com.ishopmall.service.impl;


import com.github.pagehelper.PageHelper;
import com.ishopmall.dao.ProductDao;
import com.ishopmall.model.ItemCat;
import com.ishopmall.model.Product;
import com.ishopmall.model.ProductAttribute;
import com.ishopmall.service.GoodsDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsDetailsImpl implements GoodsDetails {
    @Autowired
    private ProductDao productDao;

    @Override
    public Product loadProductInfo(String id) {
        return productDao.loadProductInfo(id);
    }

    @Override
    public ItemCat loadProductItem(String categoryId) {
        return productDao.loadProductItem(categoryId);
    }

    @Override
    public List<ProductAttribute> loadProductAttribute(String id) {
        return productDao.loadProductAttribute(id);
    }

    @Override
    public List<Product> loadRecommended(String ItemCatId,int pageNum) {
        PageHelper.startPage(pageNum, 12);
        return productDao.loadRecommended(ItemCatId);
    }
    //无需分页
    @Override
    public List<Product> loadRecommended(String ItemCatId) {
        return productDao.loadRecommended(ItemCatId);
    }
}
