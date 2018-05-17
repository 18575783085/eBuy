package com.ishopmall.service;

import java.util.List;

import com.ishopmall.controller.prodsInfo.ProdsList;
import com.ishopmall.model.ProdsInfo;

public interface ProdsInfoService {
	
	List<ProdsInfo> findProductByName(String name);
	
}
