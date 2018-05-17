package com.ishopmall.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ishopmall.controller.prodsInfo.ProdsList;
import com.ishopmall.model.ProdsInfo;

public interface ProdsInfoDao {

	public List<ProdsInfo> findProductByName(String name);
	
}
