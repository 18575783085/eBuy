package com.ishopmall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ishopmall.model.Order;
import com.ishopmall.model.OrderItem;
import com.ishopmall.model.Shipping;

public interface OrderDao {

	/**
	 * 向订单表中添加一条订单信息的数据
	 * @param order 封装了订单相关信息的对象
	 * @return 
	 */
	int addOrder(Order order);

	/**
	 * 向商品订单表添加一条订单信息
	 * @param item
	 * @return
	 */
	 void addOrderItem(OrderItem item);

	 /**
	  * 查找物流信息
	  * @param shippingName 物流名称
	  * @return
	  */
	Shipping findShipping(String shippingName);

	/**
	 * 修改订单的信息
	 * @param orderInfo
	 */
	void changeOrderStatus(Order orderInfo);
	
	

}
