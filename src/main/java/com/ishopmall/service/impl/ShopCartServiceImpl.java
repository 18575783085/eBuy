package com.ishopmall.service.impl;

import com.ishopmall.dao.ShopCartDao;
import com.ishopmall.model.ShopCart;
import com.ishopmall.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopCartServiceImpl implements ShopCartService {
    @Autowired
    private ShopCartDao shopCartDao;

    @Override
    public List<ShopCart> selectShopCart(String id) {
        return shopCartDao.selectShopCart(id);
    }

    @Override
    public void deleteShopCart(int cartId) {
        shopCartDao.deleteShopCart(cartId);
    }

    @Override
    public void deleteSelectShopCart(String[] cartIds) {
        shopCartDao.deleteSelectShopCart(cartIds);
    }

    @Override
    public void updateShopCart(int cardId,int buyNum) {
        shopCartDao.updateShopCart(cardId,buyNum);
    }

    @Override
    public Integer selectShopCartExist(String prodId, String userId) {
        Integer res = shopCartDao.selectShopCartExist(prodId, userId);
        if (res!=null){
            return res;
        }
        return 0;
    }

    @Override
    public void insertShopCart(ShopCart shopCart) {
       shopCartDao.insertShopCart(shopCart);
    }

    @Override
    public int selectShopCartProdNum(int cartId) {
        return shopCartDao.selectShopCartProdNum(cartId);
    }

}
