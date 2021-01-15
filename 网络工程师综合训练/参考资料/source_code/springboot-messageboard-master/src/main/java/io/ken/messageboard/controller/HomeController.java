package io.ken.messageboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    @Autowired
    MessageController messageController;

    @RequestMapping("/")
    ModelAndView index(HttpServletRequest request, @RequestParam(required = false) Integer page) {
        return messageController.list(request, page);
    }
}
