package com.ishopmall.service;


import com.ishopmall.model.ItemCat;
import com.ishopmall.model.MallNotice;

import java.util.List;

public interface IndexService {
    List<ItemCat> shopItem_list();

    List<MallNotice> selectNoticeTitle();

    List<ItemCat> selectSinglecategory(int id);

    List<ItemCat> selectshopItemParent();
    
    MallNotice findNoticeWriteById(Integer noticeId);

	int getCount();

    List<ItemCat> findShopItemList();
}
