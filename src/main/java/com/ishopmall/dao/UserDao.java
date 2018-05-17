package com.ishopmall.dao;

import com.ishopmall.model.User;
import com.ishopmall.model.UserAddress;
import com.ishopmall.model.UserInfo;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    /**
     * 根据id查询用户
     *
     * @param user 用户对象
     * @return 用户对象
     */
    List<User> selectUser(User user);

    /**
     * 保存用户主表信息
     *
     * @param user 用户对象
     */
    int saveUser(User user);

    /**
     * 保存用户表附加信息
     *
     * @param userInfo 用户副表信息对象
     */
    int saveUserInfo(UserInfo userInfo);

    int updateUserInfo(String userId, String userEmail, String userCode);

    /**
     * 验证邮件信息
     *
     * @return 用户副表信息对象
     */
    List<UserInfo> selectUserInfo_inv(String userId);

    /**
     * 邮箱验证状态码更新
     *
     * @return 是否更新成功
     */
    int updateUserInfo_status(String userId);

    /**
     * 用户登录(没有用户地址)
     *
     * @param user 用户对象
     * @return 用户对象
     */
    List<User> selectUserLogin(User user);
    /**
     * 用户登录(有用户地址)
     * @param user
     * @return 用户对象+用户地址
     */
    List<User> selectUserLogin2(User user);
    

    User selectUserLoginByone(User user);

    List<UserInfo> selectUserInfo(UserInfo userInfo);

    int updateUserInfo_Code(UserInfo userInfo);

    int upadateUser_Email(User user);

     /* --------------新增或修改手机----------*/
    /**
     * 新增/修改用户主表信息（新插手机号码/修改旧手机号码）
     * @param user 已新增/修改的用户主表信息
     * @return 1：插入成功 0：插入失败
     */
    int updateUser_Phone(User user);

    /**
     * 用户登录(没有用户地址)
     * @param user
     * @return 用户对象+用户信息
     */
    User UserLoginByOne(User user);
    /**
     * 用户登录(有用户地址)
     * @param user
     * @return 用户对象+用户信息+用户地址
     */
    User UserLoginByOne2(User user);
    
    
    /**
     * 根据用户id查询该用户有多少个地址
     * @param userId 用户id
     * @return 返回一个用户地址集合
     */
	List<UserAddress> findAddress(String userId);

	/**
	 * 添加地址 
	 * @param userAddress 用户地址实体
	 * @return 插入的行数
	 */
	int addAddress(UserAddress userAddress);

	/**
	 * 修改用户地址为默认地址
	 * @param status 1-默认 0-不默认
	 * @param addressId 用户地址id
	 * @param userId 用户id
	 * @return 修改的行数
	 */
	int changeDefaultStatus(@Param("status")int status, @Param("addressId")String addressId, @Param("userId")String userId);

	/**
	 * 修改该用户的其余地址为不默认
	 * @param status 0-不默认
	 * @param addressId 用户地址id
	 * @param userId 用户id
	 * @return 修改的行数
	 */
	int changeNoDefaultStatus(@Param("status")int status, @Param("addressId")String addressId, @Param("userId")String userId);

	/**
	 * 根据用户id和地址id删除地址
	 * @param addressId 地址id
	 * @param userId 用户id
	 * @return
	 */
	int deleteAddress(@Param("addressId")String addressId, @Param("userId")String userId);

	/**
	 * 根据用户id和地址id查询该地址的所有信息（回显地址数据）
	 * @param addressId 地址id
	 * @param userId 用户id
	 * @return 地址信息
	 */
	UserAddress findAddressByOne(@Param("addressId")String addressId, @Param("userId")String userId);

	/**
	 * 根据用户id和地址id修改该地址的信息
	 * @param userAddressInfo 用户地址实体
	 * @return 成功修改的行数
	 */
	int updateAddress(UserAddress userAddressInfo);

	/**
	 * 查找该用户的默认地址
	 * @param status 
	 * @param userId 用户id
	 * @return
	 */
	UserAddress findAddressDefaultStatus(@Param("status")int status, @Param("userId")String userId);
	@Update("update user set user_password=#{newPassword} where user_name=#{username}")
	void updatePassword(@Param("newPassword")String newPassword, @Param("username")String username);
	
	void updateUserInformation(User user);

	void updateUserInfoInformation(User user);

	User findByUserId(String userId);
	
	UserInfo findMoney(String userId);
}
