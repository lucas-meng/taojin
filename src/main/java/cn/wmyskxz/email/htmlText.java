package cn.wmyskxz.email;
public class htmlText {
	//  返回页面Html携带的6位随机码
	public static String html(String code) {
		
		String html = "淘金网邮箱验证<br/>"+ 
		"这封邮件是淘金网发送的。<br/>"+
		"你正在淘金网进行新用户注册<br/>"+
		"你只将下面验证码输入提示框即可：<h3 style='color:red;'>" + code + "</h3><br/>";
		return html;
	}
}