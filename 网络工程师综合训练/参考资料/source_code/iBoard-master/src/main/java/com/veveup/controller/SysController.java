package com.veveup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys")
public class SysController {
    /**
     * 成功页面
     * @return
     */
    @RequestMapping("/success")
    public String success(){
        return "success";
    }
    /**
     * 发生错误页面
     * @return
     */
    @RequestMapping("/error")
    public String error(){
        return "error";
    }
}
