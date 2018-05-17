package com.ishopmall.service.impl;

import com.ishopmall.dao.IndexDao;
import com.ishopmall.model.ItemCat;
import com.ishopmall.model.MallNotice;
import com.ishopmall.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexServiceImpl implements IndexService {
    @Autowired
    private IndexDao indexDao;

    @Override
    public List<ItemCat> shopItem_list() {
        return indexDao.shopItem_list();
    }

    @Override
    public List<MallNotice> selectNoticeTitle() {
        return indexDao.selectNoticeTitle();
    }

    @Override
    public List<ItemCat> selectSinglecategory(int id) {
        return indexDao.selectSinglecategory(id);
    }

    @Override
    public List<ItemCat> selectshopItemParent() {
        return indexDao.selectshopItemParent();
    }
    
    @Override
	public MallNotice findNoticeWriteById(Integer noticeId) {
		return indexDao.findNoticeWriteById(noticeId);
	}

	@Override
	public int getCount() {
		
		return indexDao.getCount();
	}
}
