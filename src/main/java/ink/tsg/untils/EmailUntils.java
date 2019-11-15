package ink.tsg.untils;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class EmailUntils {

	private static final String hostName = "smtp.qq.com";
    private static final String userInfo = "frvzijzfhowxbagd"; //服务器验证码 -- 非发件人邮箱密码
    
    private static final String chartset = "UTF-8";
    //发件人
    private static final String senderEmail = "1528474876@qq.com";
    //发件人昵称
    private static final String senderNick = "项遇您美食馆";
    //主题
    private static final String emailSubject = "来自“项遇您”美使馆的优惠卷";
    
    
    public static boolean sendEmail(String receive ,String code,String discountName) {
        try {
            HtmlEmail email = new HtmlEmail();
            // 配置信息
            email.setHostName(hostName);
            email.setFrom(senderEmail,senderNick);
            email.setAuthentication(senderEmail,userInfo);
            email.setCharset(chartset);
            email.setSubject(emailSubject);
            String sendHtml = "为了感谢您的反馈，我们给您一张<span style='color:orange;'>&nbsp;&nbsp;&nbsp;&nbsp;"+discountName+"</span>,凭校验码："+code+"&nbsp;&nbsp;使用！";
            email.setHtmlMsg(sendHtml);
            // 收件人
            if (null != receive) {
               email.addTo(receive);
            }
            //发送
            email.send();
            return true;
        } catch (EmailException e) {
            e.printStackTrace();
            return false;
        } 
    }
}

