package cn.wmyskxz.email;


public class RandomUtil {
	public static void main(String[] args) {
		// 控制台打印
		System.out.println(RandomUtil.getRandom());
	}
	//  获取6为随机验证码
	public static String getRandom() {
		String[] letters = new String[] {"0","1","2","3","4","5","6","7","8","9"};
		String code ="";
		for (int i = 0; i < 6; i++) {
			code = code + letters[(int)Math.floor(Math.random()*letters.length)];
		}
		return code;
	}
}