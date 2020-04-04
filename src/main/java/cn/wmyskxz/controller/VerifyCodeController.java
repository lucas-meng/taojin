package cn.wmyskxz.controller;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "")
public class VerifyCodeController {

    /**
     * Controller Method
     */

    @RequestMapping(value = "getVerifyCodeImage")
    public void getVerifyCodeImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 设置验证码字符的字体和字号。
        Font mFont = new Font("Arial Black", Font.PLAIN, 22);

        //清除缓存，每次访问该页面时都从服务器端读取
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");

        // 设置验证码图片的长度和高度。
        int width = 240, height = 30;
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);

        //画图画板
        Graphics g = image.getGraphics();
        //定义一个随机数
        Random random = new Random();
        //设置画板背景颜色
//          g.setColor(getRandColor(200, 250));
        g.setColor(new Color(255, 255, 255));
        //设置画板的填充范围
        g.fillRect(1, 1, width - 1, height - 1);
//          g.setColor(new Color(102, 102, 102));
        g.drawRect(0, 0, width - 1, height - 1);
        //设置字体
        g.setFont(mFont);

        //显示字符串，4位长度。
        String sRand = "";
        for (int i = 0; i < 4; i++) {
            String tmp = getRandomChar();
            sRand += tmp;
            //设置每个数字的颜色
            g.setColor(new Color(20 + random.nextInt(110), 20 + random
                    .nextInt(110), 20 + random.nextInt(110)));
            //在画板上写数字，起始位置
            g.drawString(tmp, 60 * i + 5, 27);
        }

        HttpSession session = request.getSession();
        // 把验证码防到session中，用来前台对比。
        session.setAttribute("verifycode", sRand.toLowerCase());
       // System.out.println(sRand.toLowerCase()+"--------------------------》");
        //显示图片
        g.dispose();
        //转换成一张图片，格式为JPEG
        ImageIO.write(image, "JPEG", response.getOutputStream());
    }

    /**
     * 随机获得颜色，RGB格式
     *
     * @param fc
     * @param bc
     * @return
     */
    Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255)
            fc = 255;
        if (bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }

    private String getRandomChar() {
        int rand = (int) Math.round(Math.random() * 2);
        long itmp = 0;
        char ctmp = '\u0000';
        switch (rand) {
            case 1:
                itmp = Math.round(Math.random() * 25 + 65);
                ctmp = (char) itmp;
                return String.valueOf(ctmp);
            case 2:
                itmp = Math.round(Math.random() * 25 + 97);
                ctmp = (char) itmp;
                return String.valueOf(ctmp);
            default:
                itmp = Math.round(Math.random() * 9);
                return String.valueOf(itmp);
        }
    }
}