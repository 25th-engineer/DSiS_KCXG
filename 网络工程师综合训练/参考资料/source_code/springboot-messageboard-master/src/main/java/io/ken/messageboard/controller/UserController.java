package io.ken.messageboard.controller;

import io.ken.messageboard.dao.UserMapper;
import io.ken.messageboard.model.User;
import io.ken.messageboard.util.AesUtil;
import io.ken.messageboard.util.AuthUserUtil;
import io.ken.messageboard.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserMapper userMapper;

    @RequestMapping("/login")
    ModelAndView login(@RequestParam(required = false) String msg) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("msg", msg);
        modelAndView.setViewName("user/login");
        return modelAndView;
    }

    @RequestMapping("/login/submit")
    String loginSubmit(String name, String password, HttpServletResponse response) throws Exception {
        User user = userMapper.queryByName(name);
        if (user == null) {
            return "redirect:/user/login?msg=user not exist";
        }
        if (!user.getPassword().equals(Md5Util.getMD5(password))) {
            return "redirect:/user/login?msg=password wrong";
        }
        AuthUserUtil.setUserAuth(response, user.getId() + "", user.getName());
        return "redirect:/message/list";
    }

    @RequestMapping("/logout")
    String logout(HttpServletResponse response){
        AuthUserUtil.clearUserAuth(response);
        return "redirect:/message/list";
    }
}
