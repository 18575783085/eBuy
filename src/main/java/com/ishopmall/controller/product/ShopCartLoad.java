package com.ishopmall.controller.product;

import com.ishopmall.model.ShopCart;
import com.ishopmall.model.User;
import com.ishopmall.service.GoodsDetails;
import com.ishopmall.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * 购物车
 * 2017年11月29日18:22:58
 * @author JAM
 */
@Controller
@RequestMapping("/shopcart")
public class ShopCartLoad {
    @Autowired
    private ShopCartService shopCartService;
    @Autowired
    private GoodsDetails goodsDetails;

    /**
     * 加入商品进入购物车
     * 需要判断这件商品在购物车里面是否存在，如果已经存在数量+1，不存在执行insert
     * @param prodId 商品ID
     * @param buyNum 购买数量
     */
    @RequestMapping(value = "/add")
    public String shopCartAdd(String prodId,int buyNum,HttpSession session) throws Exception{
        System.out.println(prodId+buyNum);
        //获取当前用户
        User user = (User) session.getAttribute("User");
        //判断是否存在，返回购物车id
        Integer res = shopCartService.selectShopCartExist(prodId, user.getUserId());
        //已经存在
        if (res>0){
            //TODO bug:有可能里面存在了N件，提交过来满足库存在这里直接添加导致超出实际库存范围
            int insert = res.intValue();
            int oldbuynum = shopCartService.selectShopCartProdNum(insert);
            shopCartService.updateShopCart(res,oldbuynum+buyNum);
            return "forward:/shopcart/select";
        }
        ShopCart shopCart = new ShopCart();
        //用户ID
        shopCart.setUserId(user.getUserId());
        //购买数量
        shopCart.setProdNum(buyNum);
        shopCart.setProdId(prodId);
        //创建时间
        shopCart.setCreated(new Date());
        //最后更新时间
        shopCart.setUpdated(new Date());
        //未存在，插入购物车
        shopCartService.insertShopCart(shopCart);
        return "redirect:/shopcart/select";
    }


    //查询用户购物车的内容
    @RequestMapping("/select")
    public String loadCard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("User");
        //用户未登录操作购物车,遍历本地cookie看看有没之前的加入购物车的记录
        if (user == null) {
            return "/shop/shopcart";
        }
        //根据当前seesion用户查询对应id购物车里面的内容
        List<ShopCart> shopCartsInfo = shopCartService.selectShopCart(user.getUserId());
        for (int i=0;i<shopCartsInfo.size();i++) {
            //设置对应购物车id进行查询对应的商品信息
            shopCartsInfo.get(i).setProduct(goodsDetails.loadProductInfo(shopCartsInfo.get(i).getProdId()));
        }
        model.addAttribute("shopCartsInfo", shopCartsInfo);
        return "/shop/shopcart";
    }

    /**
     * 购物车商品数量更新
     * @param cardId 购物车ID
     * @param buyNum
     * @param userId
     * @param session
     * @return
     */
    @RequestMapping("/update")
    public String updateCount(int cardId,int buyNum,String userId,HttpSession session){
        //用户合法性验证，判断是否为该用户提交的请求
        User user= (User) session.getAttribute("User");
        boolean loginUser = isLoginUser(user, userId);
        //非法请求
            if (!loginUser){
            return "message/404";
        }
        //判断传入是否小于0，小于0则执行删除该商品操作
        if (buyNum<=0){
            removePrdouct(cardId);
            return "forward:select";
        }
        shopCartService.updateShopCart(cardId,buyNum);
        return "forward:select";
    }

    /**
     * 删除购物车该商品
     * @return
     */
    @RequestMapping("/remove")
    public String removePrdouct(int cartId){
        shopCartService.deleteShopCart(cartId);
        return "forward:select";
    }

    /**
     * 购物车批量删除商品
     */
    @RequestMapping(value = "/removeAll", method = {RequestMethod.POST})
    public String removeAllProudct(@RequestBody String[] cartId){
        shopCartService.deleteSelectShopCart(cartId);
        return "forward:select";
    }


    /**
     * 是否为当前用户登录进行操作，进行合法性对比
     * @param user 传入用户对象进行判断
     * @param userId 用户id
     * @return
     */
    public boolean isLoginUser(User user,String userId){
        if (user.getUserId().equals(userId)){
            System.out.println(user.getUserId());
            return true;
        }
        return false;
    }
}
