package com.ishopmall.controller.prodsInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import org.springframework.web.bind.annotation.RequestMapping;

import com.ishopmall.model.ProdsInfo;
import com.ishopmall.service.ProdsInfoService;

@Controller
@RequestMapping("/shop")
public class ProdsList {

	@Autowired
	ProdsInfoService prodsInfoService;

	@RequestMapping("/search")
	public String search(String name, Model model) {
		model.addAttribute("name", name);
		if (!StringUtils.isEmpty(name)) {
			List<ProdsInfo> produts = prodsInfoService.findProductByName(name);
			for (ProdsInfo prodsInfo : produts) {
				String[] imgurls = prodsInfo.getImgurl().split(",");
				prodsInfo.setImgurl(imgurls[0]);
			}
			// 将所有商品返回给页面
			model.addAttribute("produts", produts);
		}

		return "shop/search";
	}

}
