package com.ishopmall.dao;

import com.ishopmall.model.ShopCart;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShopCartDao {
    List<ShopCart> selectShopCart(String id);

    void deleteShopCart(int cartId);

    void updateShopCart(@Param("cardId") int cardId, @Param("buyNum") int buyNum);

    void deleteSelectShopCart(String[] cartIds);

    Integer selectShopCartExist(@Param("prodId") String prodId,@Param("userId")String userId);

    void insertShopCart(ShopCart shopCart);

    int selectShopCartProdNum(int cartId);
}
