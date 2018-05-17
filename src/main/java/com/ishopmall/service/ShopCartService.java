package com.ishopmall.service;


import com.ishopmall.model.ShopCart;

import java.util.List;

public interface ShopCartService {
    /**
     * 根据用户id查询当前购物车的物品
     * @param id 商品id
     * @return
     */
    List<ShopCart> selectShopCart(String id);

    /**
     * 删除对应商品的购物车
     * @param cartId 购物车id
     */
    void deleteShopCart(int cartId);

    /**
     * 删除用户选中的对应商品的购物车
     * @param cartIds 购物车id
     */
    void deleteSelectShopCart(String[] cartIds);

    void updateShopCart(int cardId,int buyNum);

    /**
     * 加入购物车判读该商品在购物车是否已经存在
     * @param prodId 商品ID
     * @param userId 用户ID
     * @return 存在则返回对应的购物车编号，不存在则会返回空
     */
    Integer selectShopCartExist(String prodId,String userId);

    /**
     * 插入一条新的购物车数据
     * @param shopCart 购物车对象
     */
    void insertShopCart(ShopCart shopCart);

    /**
     * 查询对应购物车现在的加入数量
     * @param cartId 购物车编号
     * @return 数量
     */
    int selectShopCartProdNum(int cartId);

}
