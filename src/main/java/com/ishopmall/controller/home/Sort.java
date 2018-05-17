package com.ishopmall.controller.home;

import com.ishopmall.model.ItemCat;
import com.ishopmall.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 商城分类控制器
 * @author JAM
 * 2017年11月22日14:16:20
 */
@Controller
@RequestMapping("/sort")
public class Sort {
    @Autowired
    private IndexService indexService;

    /**
     * 查询当前商品类下的所有子类
     * @param id 父类id
     * @param model
     * @return 返回当前父类下的子商品
     */
    @RequestMapping("/selectSingle")
    public String selectSingle(int id,Model model){
        List<ItemCat> itemCats = indexService.selectSinglecategory(id);
        model.addAttribute("singleList",itemCats);
        return "forward:/sort";
    }

    @RequestMapping("/selectParentInfo")
    public String slectParentName(Model model){
        List<ItemCat> itemCats = indexService.selectshopItemParent();
        model.addAttribute("ParentInfo",itemCats);
        return "forward:/sort";
    }

}
