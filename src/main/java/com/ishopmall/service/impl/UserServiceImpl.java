package com.ishopmall.service.impl;

import com.ishopmall.dao.UserDao;
import com.ishopmall.model.User;
import com.ishopmall.model.UserAddress;
import com.ishopmall.model.UserInfo;
import com.ishopmall.service.UserService;
import com.ishopmall.utils.SendEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    @Override
    public List<User> selectUser(User user) {
        return userDao.selectUser(user);
    }

    /**
     * 用于判断是否注册成功
     * @param user 用户对象
     * @param userInfo 用户附表对象
     * @return 返回一个int值，1表示执行失败事务回滚，2表示成功
     */

    @Override
    public int insertUserInfo(final User user, UserInfo userInfo){
        int resultUser = 0;
        int resultUserInfo = 0;
        try {
            resultUser = userDao.saveUser(user);
            resultUserInfo = userDao.saveUserInfo(userInfo);
        } catch (Exception e) {
            //有可能非法用户字段已存在仍然强制注册
            e.printStackTrace();
            return 1;
        }
        return 2;
    }

    @Override
    public boolean resgisterUser(final User user, UserInfo userInfo) {
        int res = insertUserInfo(user, userInfo);
        if (res==1){
            return false;
        }
        //假如2条插入语句都成功，使用多线程执行发送邮件操作避免单线程长时间等待
        if (res == 2) {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    //邮件发送
                    SendEmail.sample(user);
                }
            }).start();
            return true;
        }
        return false;
    }

    /* ---手机用户注册---*/
    public boolean resgisterPhone(final User user, UserInfo userInfo) {
        int res = insertUserInfo(user, userInfo);
        if (res==1){
            return false;
        }
        if (res == 2) {
            return true;
        }
        return false;
    }

    @Override
    public int updateUserInfo(User user, String activationCode) {
        String userid = user.getUserId();
        List<User> users = userDao.selectUser(user);
        List<UserInfo> userInfos = userDao.selectUserInfo_inv(userid);
        //当恶意用户修改链接，修改为一个不存在用户名报500错误，需要跳转到错误页面
        if (userInfos.isEmpty() && users.isEmpty()) {
            return 1;
        }
        User selectUser = users.get(0);
        UserInfo selectUserInfo = userInfos.get(0);
        //检验该用户id对应的email，激活码是否一致
        boolean res = validationEmail(selectUser, selectUserInfo, user,activationCode);
        if (res){
            return 0;
        }
        return 1;
    }

    @Override
    public boolean validationEmail(User selectUser,UserInfo selectUserInfo,User nowUser,String activationCode){
        String userid = nowUser.getUserId();
        if (userid.equals(selectUser.getUserId()) && activationCode.equals(selectUserInfo.getUserCode()) && nowUser.getUserEmail().equals(selectUser.getUserEmail())) {
            //一致：更改status状态为1，表示用户已经通过验证
            int res = userDao.updateUserInfo_status(userid);
            if (res == 0) {
                return false;
            }
            //表示成功修改
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<UserInfo> selectUserInfo(UserInfo userInfo) {
        return userDao.selectUserInfo(userInfo);
    }

    @Override
    public int updateUserInfo_Code(UserInfo userInfo) {
        return userDao.updateUserInfo_Code(userInfo);
    }

    @Override
    public int upadateUser_Email(User user) {
        return userDao.upadateUser_Email(user);
    }

    @Override
    public List<User> selectUserLogin(User user) {
        List<User> users = userDao.selectUserLogin(user);
        System.out.println("users:"+users);
        //判断用户是否存在
        if (users.isEmpty() && users !=null) {
            return new ArrayList<User>();
        }
        User tempuser = null;
        try {
            tempuser = users.get(0);
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<User>();
        }
        //判断密码是否正确
        if (!user.getUserPassword().equals(tempuser.getUserPassword())) {
            //不正确返回一个空集合
            return new ArrayList<User>();
        }
        //正确
        //先判断该用户是否有地址
    	List<UserAddress> userAddressInfo= userDao.findAddress(tempuser.getUserId());
    	System.out.println("userAddressInfo："+userAddressInfo);
    	if (userAddressInfo.isEmpty()) {//有：false,无：true
    		//没有地址->返回用户数据
			return users;
		}else {
			//有地址->查询获取用户地址集合
    		List<User> users2 = userDao.selectUserLogin2(user);
    		//返回正确的数据
			return users2;
		}
    }
    @Override
    public List<User> autoLogin(User user){
        List<User> users = userDao.selectUserLogin(user);
        if (users.isEmpty() && users !=null) {
            return new ArrayList<User>();
        }
        User tempuser = null;
        try {
            tempuser = users.get(0);
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<User>();
        }
        //正确
        //先判断该用户是否有地址
    	List<UserAddress> userAddressInfo= userDao.findAddress(tempuser.getUserId());
    	if (userAddressInfo.isEmpty()) {//有：false,无：true
    		//没有地址->返回用户数据
			System.out.println("u1:"+users);
			return users;
		}else {
			//有地址->查询获取用户地址集合
    		List<User> users2 = userDao.selectUserLogin2(user);
    		//返回正确的数据
    		System.out.println("u2:"+users2);
			return users2;
		}
    }

    @Override
    public List<User> selectUserExist(User user) {
        List<User> users = userDao.selectUserLogin(user);
        //如果没查询到有用户则返回一个空集合
        if (users.isEmpty()) {
            return new ArrayList<>();
        }
        //查询到返回一个用户对象
        return users;
    }
        /* --------------------插入 或者 修改 手机号码 ----------------*/

    /**
     * 插入新手机号码/修改旧手机号码
     */
    @Override
    public boolean updateUser_Phone(User user) {
        //判断是否插入成功
        int rowNewPhone = userDao.updateUser_Phone(user);
        return rowNewPhone > 0;
    }

    /**
     * 用户登录
     */
    @Override
    public User UserLoginByOne(User user) {
    	User userLoginByOne = userDao.UserLoginByOne(user);
    	//先判断该用户是否有地址
    	List<UserAddress> userAddressInfo= userDao.findAddress(userLoginByOne.getUserId());
    	
    	if (userAddressInfo.isEmpty()) {//有：false,无：true
    		//没有地址->返回用户数据
			System.out.println("u1:"+userLoginByOne);
			return userLoginByOne;
		}else {
			//有地址->查询获取用户地址集合
    		User userLoginByOne2 = userDao.UserLoginByOne2(user);
    		//返回用户+地址数据
    		System.out.println("u2:"+userLoginByOne2);
			return userLoginByOne2;
		}
    	
    }
    
    
    /*---------------------个人中心的地址管理-----------------------*/
    
    /**
     * 根据用户id查询该用户的所有地址
     */
    @Override
	public List<UserAddress> findAddress(String userId) {
    	
		return userDao.findAddress(userId);
	}

	/**
	 * 新增地址
	 */
	@Override
	public boolean addAddress(UserAddress userAddress) {
		//获取插入行数
		int addressAdd = userDao.addAddress(userAddress);
		//true:插入成功 false:失败
		return addressAdd == 1;
	}

	/**
	 * 修改用户地址为默认
	 */
	@Override
	public int changeDefaultStatus(int status, String addressId, String userId) {
		
		return userDao.changeDefaultStatus(status, addressId, userId);
	}

	/**
	 * 修改该用户的其余地址为不默认
	 */
	@Override
	public int changeNoDefaultStatus(int status, String addressId, String userId) {
		return userDao.changeNoDefaultStatus(status,addressId,userId);
	}

	/**
	 * 删除地址
	 */
	@Override
	public int deleteAddress(String addressId, String userId) {
		return userDao.deleteAddress(addressId,userId);
	}

	/**
	 * 查询该地址所有信息（回显地址数据）
	 */
	@Override
	public UserAddress findAddressByOne(String addressId, String userId) {
		return userDao.findAddressByOne(addressId,userId);
	}

	/**
	 * 根据用户id和地址id修改该地址信息
	 */
	@Override
	public int updateAddress(UserAddress userAddressInfo) {
		return userDao.updateAddress(userAddressInfo);
	}

	/**
	 * 查找该用户的默认地址
	 */
	@Override
	public UserAddress findAddressDefaultStatus(int status, String userId) {
		return userDao.findAddressDefaultStatus(status,userId);
	}
	@Override
	public void updatePassword(String newPassword, String username) {
		userDao.updatePassword(newPassword,username);
	}
	
	@Override
	public String[] changeBirthday(Date userBirthday) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(userBirthday!=null){
			String bir = sdf.format(userBirthday);
			return bir.split("-");
		}else{
			return new String[]{};
		}
		
	}

	@Override
	public void updateInformation(User user,String year,String month,String day) {
		// TODO Auto-generated method stub
		String bir = year+"-"+month+"-"+day;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = new Date();
		try {
			birthday = sdf.parse(bir);
			user.getUserInfo().setUserBirthday(birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userDao.updateUserInformation(user);
		userDao.updateUserInfoInformation(user);
	}

	@Override
	public User findByUserId(String userId) {
		// TODO Auto-generated method stub
		return userDao.findByUserId(userId);
	}

	@Override
	public UserInfo findMoney(String userId) {
		// TODO Auto-generated method stub
		return userDao.findMoney(userId);
	}
}
