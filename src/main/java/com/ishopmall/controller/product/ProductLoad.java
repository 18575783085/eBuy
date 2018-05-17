package com.ishopmall.controller.product;

import com.github.pagehelper.PageInfo;
import com.ishopmall.model.ItemCat;
import com.ishopmall.model.Product;
import com.ishopmall.model.ProductAttribute;
import com.ishopmall.model.ProductComment;
import com.ishopmall.service.CommentService;
import com.ishopmall.service.GoodsDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 用于加载商品的控制器
 * @author JAM
 * 2017年11月24日15:51:50
 */

@Controller

@RequestMapping("/introduction")
public class ProductLoad {
    @Autowired
    private GoodsDetails goodsDetails;
    @Autowired
    private CommentService commentService;
    /**
     * 加载商品总控制器
     * @param id
     * @param pageNum
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/intro")
    public String loadProuductAll(String id, Integer pageNum,Integer minproPageNum,Model model) throws Exception{
        //防止空的情况出现
        if (id==null || id.equals("") || pageNum==null || minproPageNum==null){
            return "message/404";
        }
        Product nowproduct = loadProductInfo(id);
        //防止商品为空的情况出现
        if (nowproduct==null){
            return "message/404";
        }
        //取出图片进行处理
        String imgUrls = nowproduct.getImgUrl();
        //处理逗号进行分割
        String[] splitUrl = imgUrls.split(",");
        //处理成每个src里面的地址
        String[] splitSrcImgUrl = splitSrc(splitUrl);
        //拼接成整体的显示
        String bigPic = "";
        for (int i=0;i<=splitUrl.length-1;i++){
                bigPic+=splitUrl[i];
        }
        //商品评论总数
        int countComment = selectCommentCount(nowproduct.getId());
        //获取商品属性
        List<ProductAttribute> attributeList=loadProductType(nowproduct.getId());
        //加载商品评价【第一次加载为评论的第一页的5条记录】
        List<ProductComment> commentList = commentService.selectCommentInfo(nowproduct.getId(),pageNum);
        //通过分页插件进行转换
        PageInfo<ProductComment> commentPageInfo = new PageInfo<>(commentList);
        //加载推荐商品信息
        List<Product> minproducts = loadRecommended(nowproduct.getClassId(),minproPageNum);
        //通过分页插件进行转换
        PageInfo<Product> minProduct = new PageInfo<Product>(minproducts);
        //加载商品的基础信息
        model.addAttribute("Product_Info",nowproduct);
        //返回详细介绍，把数组中截取出来进行拼接,如果不这样拼接起来导致页面出现逗号
        model.addAttribute("Prdouct_main_img",bigPic);
        //获得父类ID查询当前在什么类别下面
        model.addAttribute("Product_Item",loadProductItem(nowproduct.getClassId()));
        //每个详细页面进行拆分后的连接
        model.addAttribute("splitSrcImgUrl",splitSrcImgUrl);
        //返回商品的一级属性信息
        model.addAttribute("Product_Attr",attributeList);
        //加载商品评价
        model.addAttribute("comments",commentPageInfo);
        //加载推荐商品信息
        model.addAttribute("productminItem",minProduct);
        //加载商品评论总数
        model.addAttribute("countComment",countComment);
        //返回商品视图
        return "shop/introduction";
    }

    //加载商品基础信息（product_info）
    public Product loadProductInfo(String id){
        return goodsDetails.loadProductInfo(id);
    }
    //加载商品对应类的名称(tb_item)
    public ItemCat loadProductItem(String categoryId){
        return goodsDetails.loadProductItem(categoryId);
    }
    //加载商品属性信息(prduct_type)
    public List<ProductAttribute> loadProductType(String id){
        return goodsDetails.loadProductAttribute(id);
    }
    //根据当前商品的二级分类ID查询出类似的商品
    public List<Product> loadRecommended(String ItemCatId,int pageNum){
        return goodsDetails.loadRecommended(ItemCatId,pageNum);
    }
    public int selectCommentCount(String prodId){
        return commentService.selectCommentCount(prodId);
    }

    /**
     * 处理商品URL
     * @param splitTarget 需要切分的商品数组
     * @return 返回切分好的imgUrl
     */
    public String[] splitSrc(String[] splitTarget){
        String [] splitSrcImgUrl=new String[splitTarget.length];
        for (int i=0;i<=splitTarget.length-1;i++){
            splitSrcImgUrl[i]=splitTarget[i].substring(10,splitTarget[i].length()-2);
        }
        return splitSrcImgUrl;
    }
}
