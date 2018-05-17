package com.ishopmall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishopmall.controller.prodsInfo.ProdsList;
import com.ishopmall.dao.ProdsInfoDao;
import com.ishopmall.model.ProdsInfo;
import com.ishopmall.service.ProdsInfoService;

@Service
public class ProdsInfoServiceImpl implements ProdsInfoService {

	@Autowired
	ProdsInfoDao ProdsInfoDao;
	
	@Override
	public List<ProdsInfo> findProductByName(String name) {
		
		return ProdsInfoDao.findProductByName(name);
	}

}
