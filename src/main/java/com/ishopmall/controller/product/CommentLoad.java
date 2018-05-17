package com.ishopmall.controller.product;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ishopmall.model.ProductComment;
import com.ishopmall.service.CommentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/**
 * 用于加载用户评论的控制器
 * 2017年11月26日11:40:38
 *
 * @author JAM
 */
@RequestMapping("/comment")
@Controller
public class CommentLoad {
    @Autowired
    private CommentService commentService;

    @RequestMapping("load")
    public void selectCommentInfo(String id,int pageNum,HttpServletResponse response) throws Exception {
        List<ProductComment> commentList = commentService.selectCommentInfo(id,pageNum);
        PrintWriter out = response.getWriter();
        out.print(commentList);
    }
}
