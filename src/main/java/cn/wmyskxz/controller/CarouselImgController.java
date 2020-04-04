package cn.wmyskxz.controller;

import cn.wmyskxz.pojo.Admin;
import cn.wmyskxz.pojo.Carousel;
import cn.wmyskxz.pojo.Category;
import cn.wmyskxz.pojo.Product;
import cn.wmyskxz.pojo.ProductImage;
import cn.wmyskxz.service.CarouselImgService;
import cn.wmyskxz.service.CategoryService;
import cn.wmyskxz.service.ProductImageService;
import cn.wmyskxz.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Category 的控制类
 *
 * @author: @MPengYu
 * @create: 2019-04-27-下午 16:37
 */
@Controller
@RequestMapping("/admin")
public class CarouselImgController {
	//注入ProductService
	@Autowired
	CarouselImgService carouselImgService;

	//查询
	@RequestMapping("/CarouselImg")
	public String CarouselList(Model model) {
		List<Carousel> carouselImages = carouselImgService.list();
		model.addAttribute("carouselImages", carouselImages);
		System.out.println(carouselImages);
		return "admin/CarouselImg";
	}

	@RequestMapping(value = "/updateCarouselImg")
	public String updateFileUpload(HttpServletRequest request,MultipartFile file,Carousel carousel) throws Exception, IOException {

		/**
		   * 上传图片
         */
        //图片上传成功后，将图片的地址写到数据库
		
		//String filePath = "img/product/";//保存图片的路径,tomcat中有配置
        String filePath = request.getSession().getServletContext()
				.getRealPath("img/product/");
        //获取原始图片的拓展名
        String originalFilename = file.getOriginalFilename();
        //新的文件名字，使用uuid随机生成数+原始图片名字，这样不会重复
        String newFileName = UUID.randomUUID()+originalFilename;
        //封装上传文件位置的全路径，就是硬盘路径+文件名
        File targetFile = new File(filePath,newFileName); 
        //把本地文件上传到已经封装好的文件位置的全路径就是上面的targetFile
        file.transferTo(targetFile);
        carousel.setCarousel_imgs(newFileName);//文件名保存到实体类对应属性上
        
        /**
                          * 保存商品
         */
        carouselImgService.save(carousel);
		return "redirect:CarouselImg";
	}
	
	//查询
		@RequestMapping("/CarouselDel")
		public String CarouselDel(int id,Model model) {
			int count = carouselImgService.del(id);
			if(count>0) {
				model.addAttribute("msg", "alert('成功！');");
			}else{
				model.addAttribute("msg", "alert('失败！');");
			}
			
			return "forward:CarouselImg";
		}

}
