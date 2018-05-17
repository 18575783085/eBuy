package com.ishopmall.utils;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dm.model.v20151123.SingleSendMailRequest;
import com.aliyuncs.dm.model.v20151123.SingleSendMailResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.ishopmall.model.User;

import java.io.IOException;
import java.util.Properties;

/**
 * @author JAM
 * 用于阿里云推送邮件模板
 */
public class SendEmail {
    /**
     * 用户注册模板
     *
     * @param user
     */
    private static Properties prop = new Properties();

    static {
        try {
            prop.load(SendEmail.class.getClassLoader().getResourceAsStream("aliyun.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static String regionId = prop.getProperty("regionId");
    private static String accessKeyId = prop.getProperty("accessKeyId");
    private static String secret = prop.getProperty("secret");

    public static void sample(User user) {
        IClientProfile profile = DefaultProfile.getProfile(regionId, accessKeyId, secret);
        IAcsClient client = new DefaultAcsClient(profile);
        SingleSendMailRequest request = new SingleSendMailRequest();
        try {
            request.setAccountName("ishopmall@gzkjzyx.top");
            request.setFromAlias("ishopmall商城");
            request.setAddressType(1);
            request.setTagName("register");
            request.setReplyToAddress(true);
            request.setToAddress(user.getUserEmail());
            request.setSubject("欢迎注册ishopmall商城");
            request.setHtmlBody("<div id=\"mailContentContainer\" class=\"qmbox qm_con_body_content qqmail_webmail_only\">\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "    <div style=\"font:14px/1.14 &quot;Microsoft YaHei&quot;,&quot;微软雅黑&quot;,&quot;宋体&quot;,helvetica,&quot;Hiragino Sans GB&quot;;color:#333;outline:0;background-color:#f5f7fa;width:800px;height:400px;margin:0 auto;padding-top:94px;\">\n" +
                    "        <div style=\"background-color:#ffffff;width:700px;min-height:257px;margin:0 auto;border-radius:2px;\">\n" +
                    "            <div style=\"width:100%;height:45px;background-color:#4d92d6;border-radius:2px 2px 0 0;\"><h1 style=\"color:#fff;font-size:16px;padding-left:33px;line-height:45px;\">ishopmall帐号</h1></div>\n" +
                    "            <div>\n" +
                    "                <p style=\"font-size:16px;padding-left:33px;\">亲爱的" + user.getUserEmail() + ", 您好：</p>\n" +
                    "                <p style=\"padding-top:10px;padding-left:33px;\">感谢您ishopmall帐号！请点击下面的链接完成注册：</p>\n" +
                    "                <p style=\"padding-left:33px;\"><a style=\"word-wrap:break-word;color:#538edb;\" href=\"http://localhost/ishopmall/register/validationEmail.do?&email=" + user.getUserEmail() + "&activationCode=" + MD5Utils.md5(user.getUserEmail()) + "&userid=" + user.getUserId() + "\" target=\"_blank\">\n" +
                    "http://176.114.21.91/ishopmall/register/validationEmail.do?email=" + user.getUserEmail() + "&activationCode=" + MD5Utils.md5(user.getUserEmail() + user.getUserName()) + "&userid=" + user.getUserId() + "\n" +
                    "</a></p>                \n" +
                    "<p style=\"padding-left:33px;\">为了确保您的帐号安全，该链接仅48小时内访问有效，请勿直接回复该邮件。</p> \n" +
                    "                <p style=\"padding-top:20px;padding-left:584px;\">ishopmall商城</p>\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "<style type=\"text/css\">.qmbox style, .qmbox script, .qmbox head, .qmbox link, .qmbox meta {display: none !important;}</style></div>");
            SingleSendMailResponse httpResponse = client.getAcsResponse(request);
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户点击重发送按钮重新发送注册邮件
     *
     * @author JAM
     */
    public static void resendEmail(String email, String code, String userid) {
        IClientProfile profile = DefaultProfile.getProfile(regionId, accessKeyId, secret);
        IAcsClient client = new DefaultAcsClient(profile);
        SingleSendMailRequest request = new SingleSendMailRequest();
        try {
            request.setAccountName("ishopmall@gzkjzyx.top");
            request.setFromAlias("ishopmall商城");
            request.setAddressType(1);
            request.setTagName("register");
            request.setReplyToAddress(true);
            request.setToAddress(email);
            request.setSubject("欢迎注册ishopmall商城");
            request.setHtmlBody("<div id=\"mailContentContainer\" class=\"qmbox qm_con_body_content qqmail_webmail_only\">\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "    <div style=\"font:14px/1.14 &quot;Microsoft YaHei&quot;,&quot;微软雅黑&quot;,&quot;宋体&quot;,helvetica,&quot;Hiragino Sans GB&quot;;color:#333;outline:0;background-color:#f5f7fa;width:800px;height:400px;margin:0 auto;padding-top:94px;\">\n" +
                    "        <div style=\"background-color:#ffffff;width:700px;min-height:257px;margin:0 auto;border-radius:2px;\">\n" +
                    "            <div style=\"width:100%;height:45px;background-color:#4d92d6;border-radius:2px 2px 0 0;\"><h1 style=\"color:#fff;font-size:16px;padding-left:33px;line-height:45px;\">ishopmall帐号</h1></div>\n" +
                    "            <div>\n" +
                    "                <p style=\"font-size:16px;padding-left:33px;\">亲爱的" + email + ", 您好：</p>\n" +
                    "                <p style=\"padding-top:10px;padding-left:33px;\">感谢您ishopmall帐号！请点击下面的链接完成注册：</p>\n" +
                    "                <p style=\"padding-left:33px;\"><a style=\"word-wrap:break-word;color:#538edb;\" href=\"http://localhost/ishopmall/register/validationEmail.do?&email=" + email + "&activationCode=" + code + "&userid=" + userid + "\" target=\"_blank\">\n" +
                    "http://176.114.21.91/ishopmall/register/validationEmail.do?email=" + email + "&activationCode=" + code + "&userid=" + userid + "\n" +
                    "</a></p>                \n" +
                    "<p style=\"padding-left:33px;\">为了确保您的帐号安全，该链接仅48小时内访问有效，请勿直接回复该邮件。</p> \n" +
                    "                <p style=\"padding-top:20px;padding-left:584px;\">ishopmall商城</p>\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "<style type=\"text/css\">.qmbox style, .qmbox script, .qmbox head, .qmbox link, .qmbox meta {display: none !important;}</style></div>");
            SingleSendMailResponse httpResponse = client.getAcsResponse(request);
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
    }

    public static void addemail(User user) {
        IClientProfile profile = DefaultProfile.getProfile(regionId, accessKeyId, secret);
        IAcsClient client = new DefaultAcsClient(profile);
        SingleSendMailRequest request = new SingleSendMailRequest();
        try {
            request.setAccountName("ishopmall@gzkjzyx.top");
            request.setFromAlias("ishopmall商城");
            request.setAddressType(1);
            request.setTagName("register");
            request.setReplyToAddress(true);
            request.setToAddress(user.getUserEmail());
            request.setSubject("欢迎注册ishopmall商城");
            request.setHtmlBody("<div id=\"mailContentContainer\" class=\"qmbox qm_con_body_content qqmail_webmail_only\">\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "    <div style=\"font:14px/1.14 &quot;Microsoft YaHei&quot;,&quot;微软雅黑&quot;,&quot;宋体&quot;,helvetica,&quot;Hiragino Sans GB&quot;;color:#333;outline:0;background-color:#f5f7fa;width:800px;height:400px;margin:0 auto;padding-top:94px;\">\n" +
                    "        <div style=\"background-color:#ffffff;width:700px;min-height:257px;margin:0 auto;border-radius:2px;\">\n" +
                    "            <div style=\"width:100%;height:45px;background-color:#4d92d6;border-radius:2px 2px 0 0;\"><h1 style=\"color:#fff;font-size:16px;padding-left:33px;line-height:45px;\">ishopmall帐号</h1></div>\n" +
                    "            <div>\n" +
                    "                <p style=\"font-size:16px;padding-left:33px;\">亲爱的" + user.getUserEmail() + ", 您好：</p>\n" +
                    "                <p style=\"padding-top:10px;padding-left:33px;\">请点击下面的链接完成添加邮箱账号：</p>\n" +
                    "                <p style=\"padding-left:33px;\"><a style=\"word-wrap:break-word;color:#538edb;\" href=\"http://localhost/ishopmall/usercenter/resetValidationEmail.do?&email=" + user.getUserEmail() + "&activationCode=" + MD5Utils.md5(user.getUserEmail()) + "&userid=" + user.getUserId() + "\" target=\"_blank\">\n" +
                    "http://176.114.21.91/ishopmall/usercenter/resetValidationEmail.do?email=" + user.getUserEmail() + "&activationCode=" + MD5Utils.md5(user.getUserEmail() + user.getUserName()) + "&userid=" + user.getUserId() + "\n" +
                    "</a></p>                \n" +
                    "<p style=\"padding-left:33px;\">为了确保您的帐号安全，该链接仅48小时内访问有效，请勿直接回复该邮件。</p> \n" +
                    "                <p style=\"padding-top:20px;padding-left:584px;\">ishopmall商城</p>\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "<style type=\"text/css\">.qmbox style, .qmbox script, .qmbox head, .qmbox link, .qmbox meta {display: none !important;}</style></div>");
            SingleSendMailResponse httpResponse = client.getAcsResponse(request);
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
    }
}
