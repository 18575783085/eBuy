package com.ishopmall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishopmall.dao.OrderDao;
import com.ishopmall.model.Order;
import com.ishopmall.model.OrderItem;
import com.ishopmall.model.Shipping;
import com.ishopmall.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDao orderDao;
	

	/**
	 * 添加一条订单信息
	 */
	@Override
	public int addOrder(Order order) {
		//向订单表中添加一条数据的方法
		return orderDao.addOrder(order);
	}

	/**
	 * 向商品订单列表添加一条订单信息
	 */
	@Override
	public void addOrderItem(List<OrderItem> orderItems) {
		//3.遍历oiList，逐一进行操作
		for(OrderItem item:orderItems){
			//4.判断库存是否存在，不足抛出自定义异常
			//4.1根据订单列表中的商品id在商品表查询该商品的详细信息
//					Product product = prodDao.findProdById(item.getProdId());
//					
//					//4.2判断库存是否充足
//					if(product.getPnum() < item.getProdNum()){
//						//如果商品数量少于订单中商品的数量
//						//throw new MsgException("库存不足，id："+product.getId()+",name："+product.getName()+",pnum："+product.getPnum());
//						
//					}else {
//						//5.如果商品充足，修改商品的库存---等于商品原库存 减去 购买商品的数量
//						prodDao.changePnum(product.getId(),product.getPnum()-item.getProdNum());
//					}
			
			//6.向orderitem表中添加一条信息
			orderDao.addOrderItem(item);
			
		}
	}

	/**
	 * 查找物信息
	 */
	@Override
	public Shipping findShipping(String shippingName) {
		return orderDao.findShipping(shippingName);
	}


	/**
	 * 修改订单的信息
	 */
	@Override
	public void changeOrderStatus(Order orderInfo) {
		orderDao.changeOrderStatus(orderInfo);
	}

}
