package com.ishopmall.dao;

import com.ishopmall.model.ProductComment;

import java.util.List;

public interface CommentDao {
    /**
     * 查询当前商品对应的评论基础信息
     * @param prodId 商品ID
     * @return 所有评论的集合
     */
    List<ProductComment> selectCommentInfo(String prodId);

    /**
     * 查询当前商品对应的评论条数
     * @param prodId 商品ID
     * @return 评论条数
     */
    int selectCommentCount(String prodId);
}
