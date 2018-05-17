package com.ishopmall.service.impl;

import com.github.pagehelper.PageHelper;
import com.ishopmall.dao.CommentDao;
import com.ishopmall.model.ProductComment;
import com.ishopmall.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Override
    public List<ProductComment> selectCommentInfo(String prodId,int pageNum) {
        //这段代码表示，程序开始分页了，page默认值是1，pageSize默认是1，意思是从第1页开始，每页显示5条记录。
        PageHelper.startPage(pageNum, 5);
        List<ProductComment> productComments = commentDao.selectCommentInfo(prodId);
        return productComments;
    }

    @Override
    public int selectCommentCount(String prodId) {
        return commentDao.selectCommentCount(prodId);
    }
}
