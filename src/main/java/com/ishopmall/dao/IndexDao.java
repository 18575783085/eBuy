package com.ishopmall.dao;

import com.ishopmall.model.ItemCat;
import com.ishopmall.model.MallNotice;

import java.util.List;

public interface IndexDao {
    /**
     * 查询商品一级分类列表
     * @return
     */
    List<ItemCat> shopItem_list();

    /**
     * 查询商城公告
     * @return
     */
    List<MallNotice> selectNoticeTitle();

    /**
     * 查询一级分类对应下的分类列表
     * @param id 传入一级分类ID
     * @return
     */
    List<ItemCat> selectSinglecategory(int id);

    /**
     * 查询一级分类信息
     * @return
     */
    List<ItemCat> selectshopItemParent();
    
    /**
     * 查询广告路径
     * @param noticeId 广告id
     * @return
     */
	MallNotice findNoticeWriteById(Integer noticeId);

	int getCount();

    /**
     * 根据商品分类显示对应的商品
     * @return
     */
    List<ItemCat> findShopItemList();
}
