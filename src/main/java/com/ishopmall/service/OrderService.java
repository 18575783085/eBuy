package com.ishopmall.service;

import java.util.List;

import com.ishopmall.model.Order;
import com.ishopmall.model.OrderItem;
import com.ishopmall.model.Shipping;

public interface OrderService {

	/**
	  * 添加订单相关信息
	 * （向orders添加一条，向orderItem表中添加oiList.size()条数据，修改Products表对应商品的库存）
	 * @param orders ：封装了订单信息的对象
	 */
	int addOrder(Order order);
	/**
	 * 向商品订单表添加一条订单信息
	 * @param orderItems
	 */
	void addOrderItem(List<OrderItem> orderItems);

	/**
	 * 查找物流信息
	 * @param shippingName
	 * @return
	 */
	Shipping findShipping(String shippingName);
	
	/**
	 * 修改订单的信息
	 * @param orderInfo
	 */
	void changeOrderStatus(Order orderInfo);
	
	

}
