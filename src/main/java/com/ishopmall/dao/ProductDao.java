package com.ishopmall.dao;

import com.ishopmall.model.ItemCat;
import com.ishopmall.model.Product;
import com.ishopmall.model.ProductAttribute;

import java.util.List;

public interface ProductDao {

    Product loadProductInfo(String id);

    ItemCat loadProductItem(String categoryId);

    List<ProductAttribute> loadProductAttribute(String id);

    List<Product> loadRecommended(String ItemCatId);
}
