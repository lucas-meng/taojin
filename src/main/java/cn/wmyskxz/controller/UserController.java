package cn.wmyskxz.controller;

import cn.wmyskxz.pojo.User;
import cn.wmyskxz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * User 控制器
 *
 * @author: @MPengYu
 * @create: 2019-04-29-上午 9:51
 */
@Controller
@RequestMapping("/admin")
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/listUser")
	public String list(Model model) {
		List<User> users = userService.list();
		model.addAttribute("users", users);
		return "admin/listUser";
	}

	@RequestMapping("/editUser")
	public String edit(Model model, Integer id) {
		User user = userService.get(id);
		model.addAttribute("user", user);
		return "admin/editUser";
	}

	@RequestMapping("/updateUser")
	public String update(Integer id,String name, String password) {
		userService.updateUser(id,name, password);
		return "redirect:listUser";
	}
	@RequestMapping("/insertUser")
	public String insert(User user) {
		userService.add(user);
		return "redirect:listUser";
	}
	@RequestMapping("/deleteUser")
	public String delete(Integer id) {
		userService.delete(id);
		return "redirect:listUser?id="+id;
	}




	
	
}
