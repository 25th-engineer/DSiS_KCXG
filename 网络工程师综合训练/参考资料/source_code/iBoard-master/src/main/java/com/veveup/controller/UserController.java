package com.veveup.controller;

import com.veveup.domain.User;
import com.veveup.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserServiceImpl userService;

    /**
     * 获得数据库中 所有的用户 并打印出来
     *
     * @param model
     * @return
     */
    @RequestMapping("/getAll")
    public String getAll(Model model) {
        System.out.println("user/getAll run");
        List<User> all = userService.getAll();
        System.out.println(all);
        model.addAttribute("users", all);
        return "users";
    }

    /**
     * 保存注册用户到数据库 还需要前后端共同验证用户信息
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "/saveUser", method = {RequestMethod.POST})
    public String saveUser(User user, Model model) {
//        先判断user是否存在 若存在 则不允许注册

        // 不允许传入 level 权限 所有权限改成普通用户
        user.setLevel(User.User);
        userService.saveUser(user);

        model.addAttribute("msg", "恭喜注册成功");
//        model.addAttribute("goto","")
        return "success";
    }

    /**
     * 跳转到 注册 用户页面，若已经登陆则不允许注册
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/register")
    public String register(HttpServletRequest request, Model model) {
        System.out.println("user/register run");
        System.out.println("跳转前网址：" + request.getHeader("Referer"));
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        if (user == null) {
            request.getSession().setAttribute("directAfterDone", request.getHeader("Referer"));
            return "register";
        } else {
            model.addAttribute("msg", "已经登陆不需要注册了！");
            return "error";
        }
    }

    /**
     * 对登陆行为 处理 判断用户是否存在
     *
     * @param user
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String login(User user, HttpServletRequest request, Model model) {
        System.out.println("user/login.POST run ");
        System.out.println("登陆信息：" + user);
        User userByName = userService.getUserByName(user.getName());
        System.out.println("数据库存在用户:" + userByName);
        if (userByName instanceof User) {
            if (user.getPassword().equals(userByName.getPassword())) {
                request.getSession().setAttribute("user", userByName);
                model.addAttribute("msg", "欢迎回来！");
                return "success";
            }
        }
        model.addAttribute("msg", "未知错误！");
        return "error";
    }

    /**
     * 对请求获取 登陆 页面处理
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String loginContro(HttpServletRequest request, Model model) {
        System.out.println("user/login.GET run ");
        if (request.getSession().getAttribute("user") != null) {
            model.addAttribute("msg", "已经登陆过了 不需要重复登陆");
            return "error";
        } else {
            request.getSession().setAttribute("directAfterDone", request.getHeader("Referer"));
            return "login";
        }
    }

    /**
     * 注销用户 并判断是否登陆
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/signout")
    public String signout(HttpServletRequest request, Model model) {
        if (request.getSession().getAttribute("user") != null) {
            request.getSession().setAttribute("user", null);
            request.getSession().setAttribute("directAfterDone", request.getHeader("Referer"));
            model.addAttribute("msg", "注销成功");
            return "success";
        } else {
            model.addAttribute("msg", "没有登陆，不需要注销！");
            return "error";
        }
    }

}
