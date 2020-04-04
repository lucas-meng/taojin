package cn.wmyskxz.controller;

import cn.wmyskxz.pojo.Admin;
import cn.wmyskxz.pojo.Category;
import cn.wmyskxz.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	


	@RequestMapping("/editCategory")
	public String edit(Category category,Model model) {
		model.addAttribute("category", category);
		return "admin/editCategory";
	}

	@RequestMapping("/updateCategory")
	public String update(Category category) {
		categoryService.update(category);
		return "redirect:listCategory";
	}
	@RequestMapping("/listCategory")
	public String list(Model model,HttpServletRequest request,HttpServletResponse response) {
		if(request.getSession().getAttribute("admin_name") != null && !request.getSession().getAttribute("admin_name").equals("")) {
			List<Category> categories = categoryService.list();
			model.addAttribute("categories", categories);
			return "admin/listCategory";
		}else {
			return "admin/login";
		}
		
	}
	@RequestMapping("/adminLogin")
	public String adminLogin(Admin admin,Model model,HttpServletRequest request,HttpServletResponse response) {
		System.out.println("进入登陆");
		Admin ad=categoryService.selAdmin(admin);
		request.getSession().setAttribute("admin_name", ad);
		System.out.println(ad);
		if(ad!=null) {
			return "redirect:listCategory";
		}else {
			model.addAttribute("msg","alert('登陆失败');");
			return "admin/login";
		}
	}
		@RequestMapping("/adminExit")
		public String adminExit(Model model,HttpServletRequest request,HttpServletResponse response, HttpSession session) {
			session.removeAttribute("admin_name");
			return "admin/login";
		
		
	}


	
}
