package com.ishopmall.controller.home;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ishopmall.model.MallNotice;
import com.ishopmall.service.IndexService;

@Controller
@RequestMapping("/shop")
public class Notice {

	@Autowired
	private IndexService indexService;
	@Autowired
	private Index index;

	@RequestMapping("/blog")
	public String tonotice(HttpServletRequest request,HttpServletResponse response,Integer noticeId, Model model) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<MallNotice> mallNotices = index.selectNoticeTitle();
        model.addAttribute("mallNotices",mallNotices);
		MallNotice mallNotice = indexService.findNoticeWriteById(noticeId);
		String noticeWrite = mallNotice.getNoticeWrite();
		model.addAttribute("mallNotice", mallNotice);
		
		String outPut = "";
		String fileName = request.getSession().getServletContext()
				.getRealPath("/")
				+ noticeWrite;
		fileName = fileName.replace("\\", "/");
		
		File file = new File(fileName);

		StringBuilder result = new StringBuilder();

		try {
			BufferedReader br = new BufferedReader(new FileReader(file));
			String text = null;
			while ((text = br.readLine()) != null) {
				result.append(text + "\n");
				outPut = result.toString();
			}
			model.addAttribute("txt", outPut);
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		return "shop/blog";
	}

	// 上一页
	@RequestMapping("/laquo")
	public String laquo(Integer noticeId,Model model) {
		if(noticeId==0){
			MallNotice mallNotice = indexService.findNoticeWriteById(noticeId+1);
			noticeId=noticeId+1;
			model.addAttribute("noticeId", noticeId);
			
			return "forward:/shop/blog";
		}else{
			MallNotice mallNotice = indexService.findNoticeWriteById(noticeId);
			
			model.addAttribute("mallNotice", mallNotice);
			
			return "forward:/shop/blog";
		}
		
	}

	// 下一页
	@RequestMapping("/raquo")
	public String raquo(Integer noticeId,Model model) {
        
		//获取总条数
		int recordCount = indexService.getCount();
		model.addAttribute("recordCount", String.valueOf(recordCount));
		if(recordCount<=noticeId){
			MallNotice mallNotice = indexService.findNoticeWriteById(recordCount);
			model.addAttribute("mallNotice", mallNotice);
			return "redirect:/shop/blog";
		}else{
			
		
		//当前页数
		//int pageNo =  Integer.parseInt(noticeId);
		
		/*if (pageNo<recordCount) {
			++ pageNo ;
		}*/
		
		MallNotice mallNotice = indexService.findNoticeWriteById(noticeId);
		
		model.addAttribute("mallNotice", mallNotice);
		//model.addAttribute("noticeId", pageNo.toString());
		
		
		return "redirect:/shop/blog";
		}
	}

}
