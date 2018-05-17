package com.ishopmall.service;

import com.ishopmall.model.User;
import com.ishopmall.model.UserAddress;
import com.ishopmall.model.UserInfo;

import java.util.Date;
import java.util.List;

public interface UserService {
    /**
     * 查询用户(根据id)
     *
     * @param user
     * @return
     */
    List<User> selectUser(User user);

    /**
     * 用户注册
     *
     * @param user
     * @param userInfo
     */
    boolean resgisterUser(User user, UserInfo userInfo);
    
    /**
     * 手机用户注册
     * @param user
     * @param userInfo
     * @return
     */
    boolean resgisterPhone(User user, UserInfo userInfo);

    /**
     * 邮箱验证更新验证状态
     *
     * @param user
     * @param activationCode
     * @return
     */
    int updateUserInfo(User user, String activationCode);

    /**
     * 用户登录
     *
     * @param user
     * @return
     */
    List<User> selectUserLogin(User user);

    /**
     * 查询用户是否存在
     *
     * @param user
     * @return
     */
    List<User> selectUserExist(User user);

    /**
     * 检验用户邮箱是否正确
     * @param activationCode
     * @return
     */
    boolean validationEmail(User selectUser, UserInfo selectUserInfo, User nowUser, String activationCode);

    List<UserInfo> selectUserInfo(UserInfo userInfo);

    /**
     * 更新用户状态为1
     * @param userInfo
     * @return
     */
    int updateUserInfo_Code(UserInfo userInfo);

    /**
     * 更新用户邮箱地址
     * @param user 用户主表
     * @return 是否成功
     */
    int upadateUser_Email(User user);

    /**
     * 插入用户信息，包括主表和副表
     * @param user 用户主表
     * @param userInfo 用户附表
     * @return 是否成功
     */
    int insertUserInfo(final User user, UserInfo userInfo);

    /**
     * 用于用户自动登录
     * @param user
     * @return
     */
    List<User> autoLogin(User user);

    /* --------------------插入 或者 修改 手机号码 ----------------*/

    /**
     * 插入新手机号码/修改旧手机号码
     * @param user 已新增/修改的用户主表信息
     * @return true:插入/修改成功 false:失败
     */
    boolean updateUser_Phone(User user);

    User UserLoginByOne(User user);
    
    /**
     * 根据用户id查询该用户有多少个地址
     * @param userId
     * @return
     */
	List<UserAddress> findAddress(String userId);

	/**
	 * 新增用户地址
	 * @param userAddress 用户地址实体
	 * @return true:新增成功 false:失败
	 */
	boolean addAddress(UserAddress userAddress);

	/**
	 * 根据用户id和地址id修改该地址为默认
	 * @param status 1-默认 0-不默认
	 * @param addressId 用户地址id
	 * @param userId 用户id
	 * @return 修改的行数
	 */
	int changeDefaultStatus(int status, String addressId, String userId);

	/**
	 * 当该用户的一个地址被设置为默认时，其余地址都被设置为不默认
	 * @param status 0-不默认
	 * @param addressId 用户地址id
	 * @param userId 用户id
	 * @return 修改的行数
	 */
	int changeNoDefaultStatus(int status, String addressId, String userId);
    
    /**
	 * 根据用户id和地址id删除地址
	 * @param addressId 地址id
	 * @param userId 用户id
	 * @return
	 */
	int deleteAddress(String addressId, String userId);

	/**
	 * 根据用户id和地址id查询该地址所有信息（回显地址数据）
	 * @param addressId 地址id
	 * @param userId 用户id
	 * @return 地址信息
	 */
	UserAddress findAddressByOne(String addressId, String userId);

	/**
	 * 根据用户id和地址id进行对该地址进行修改
	 * @param userAddressInfo 用户地址实体
	 * @return 修改的行数
	 */
	int updateAddress(UserAddress userAddressInfo);

	/**
	 * 查找该用户的默认地址
	 * @param status
	 * @param userId
	 * @return
	 */
	UserAddress findAddressDefaultStatus(int status, String userId);
	public void updatePassword(String newPassword, String username);

	/**
     * 把日期转变为字符串集合
     * @param userBirthday
     * @return
     */
	String[] changeBirthday(Date userBirthday);

	void updateInformation(User user, String year, String month, String day);

	User findByUserId(String userId);

	UserInfo findMoney(String userId);
}
