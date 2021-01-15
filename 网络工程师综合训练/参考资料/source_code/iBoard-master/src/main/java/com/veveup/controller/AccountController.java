package com.veveup.controller;

import com.veveup.dao.MessageDao;
import com.veveup.domain.Account;
import com.veveup.domain.Message;
import com.veveup.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {
    
    @Autowired
    private AccountService accountService;

    /**
     * 获得 所有的留言列表 然后显示出来
     * @param model
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(Model model){
        System.out.println("表现层：查询所有账户。。。。");
        // 调用 serviceDao 方法
        List<Account> all = accountService.findAll();
        model.addAttribute("list",all);
        return "list";
    }

    /**
     * 插入留言 到数据库中
     * @param content
     * @param author
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping(value = "/save",method = {RequestMethod.GET,RequestMethod.POST})
    public void save(String content,String author, HttpServletResponse response, HttpServletRequest request) throws IOException {

        accountService.saveAccount(content,author);
        System.out.println("留言成功");
        response.sendRedirect(request.getContextPath()+"/account/findAll");
        return ;
    }

}
