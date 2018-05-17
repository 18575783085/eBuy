package com.ishopmall.controller.home;

import com.ishopmall.model.ItemCat;
import com.ishopmall.model.MallNotice;
import com.ishopmall.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * 描述：首页控制器，用于加载首页信息
 *
 * @author JAM
 * @create 2017-11-16 23:15
 **/
@Controller
public class Index {
    @Autowired
    private IndexService indexService;

    /**
     * 查询商城公告标题
     *
     * @return 存储公告的标题和ID
     */
    public List<MallNotice> selectNoticeTitle() {
        List<MallNotice> mallNotices = indexService.selectNoticeTitle();
        return mallNotices;
    }


    @RequestMapping("/home")
    public String LoadIndex(Model model) throws Exception {
        List<MallNotice> mallNotices = selectNoticeTitle();
        model.addAttribute("mallNotices", mallNotices);
        model.addAttribute("ParentInfo", indexSort());
        return "shop/index";
    }

    //首页加载下拉
    public List<ItemCat> indexSort() {
        return indexService.selectshopItemParent();
    }

    //加载对应的二级分类
    public List<ItemCat> childItemCat(){
        List<ItemCat> itemCatschild=new ArrayList<>();
        List<ItemCat> itemCats = indexService.selectshopItemParent();
        for (int i=0;i<itemCats.size();i++){
            //找出当前父类所有的二级子类
            List<ItemCat> itemCats1 = indexService.selectSinglecategory(itemCats.get(i).getId());
            //放入list集合中
            for (int x=0;x<itemCats1.size();i++){
                itemCatschild.add(itemCats1.get(x));
            }
        }
        return itemCatschild;
    }


    //用户鼠标移动到一级菜单查询对应的二级栏目,有BUG，只能显示第一个其他显示不了
//    @RequestMapping("/selectShopItemIndex")
//    public void selectShopItemIndex(String parentId,HttpServletResponse response) throws IOException {
//        List<ItemCat> itemCats = indexService.selectSinglecategory(parentId);
//        //取出名字遍历写入到网页中
//        for (ItemCat temp:itemCats
//             ) {
//            System.out.println(temp.getName());
//            response.getWriter().write("<dd><a title=\""+temp.getName()+"\" href=\"#\"><span>"+temp.getName()+"</span></a></dd>");
//            response.flushBuffer();
//        }
//        itemCats=null;
//    }

    //用户登录
    @RequestMapping("/userlogin")
    public String userlogin() {
        return "shop/login";
    }

    //用户注册
    @RequestMapping("/userRegister")
    public String userRegister() {
        return "shop/register";
    }

    //商品目录分类
    @RequestMapping("/sort")
    public String userSort(Model model) {
        List<ItemCat> itemCats = indexService.selectshopItemParent();
        model.addAttribute("ParentInfo", itemCats);
        return "shop/sort";
    }

}
