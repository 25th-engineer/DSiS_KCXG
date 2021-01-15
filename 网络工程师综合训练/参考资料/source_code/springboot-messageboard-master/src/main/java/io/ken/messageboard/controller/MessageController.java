package io.ken.messageboard.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import io.ken.messageboard.dao.MessageMapper;
import io.ken.messageboard.model.Message;
import io.ken.messageboard.model.Result;
import io.ken.messageboard.util.AesUtil;
import io.ken.messageboard.util.AuthUserUtil;
import io.ken.messageboard.util.PagingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    MessageMapper messageMapper;

    int pageSize = 10;

    int defaultParentId = 0;

    @RequestMapping("/list")
    ModelAndView list(HttpServletRequest request, @RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView();
        AuthUserUtil.AuthUser authUser = new AuthUserUtil().getAuthUser(request);
        if (authUser != null) {
            modelAndView.addObject("username", authUser.getUserName());
            int dataCount = messageMapper.countAll();
            int pageTotal = dataCount / pageSize;
            if (dataCount % pageSize != 0) pageTotal += 1;
            if (page == null || page <= 0) page = 1;
            if (page > pageTotal) page = pageTotal;
            List<Message> messageList = messageMapper.queryListPaging(pageSize * (page - 1), pageSize, defaultParentId);
            for (Message message : messageList) {
                message.setReplyList(messageMapper.queryListPagingAsc(0, 100, message.getId()));
            }
            modelAndView.addObject("messageList", messageList);
            modelAndView.addObject("pagination", PagingUtil.getPagingHtml(request.getServletPath() + "?page=", page, pageSize, dataCount));
        } else {
            List<Message> messageList = messageMapper.queryListPaging(0, pageSize, defaultParentId);
            modelAndView.addObject("messageList", messageList);
        }

        modelAndView.setViewName("message/list");
        return modelAndView;
    }

    @RequestMapping("/submit")
    @ResponseBody
    String submit(HttpServletRequest request, Message message) throws Exception {
        Result result = new Result();
        ObjectMapper objectMapper = new ObjectMapper();
        AuthUserUtil.AuthUser authUser = new AuthUserUtil().getAuthUser(request);
        if (authUser == null) {
            result.setCode(-1);
            result.setMessage("please login");
        } else if (message.getBody() == null || message.getBody().equals("")) {
            result.setCode(1);
            result.setMessage("message is empty");
        } else {
            message.setUserId(Integer.parseInt(authUser.getUserId()));
            message.setUserName(authUser.getUserName());
            message.setInsertTime(LocalDateTime.now());
            message.setUpdateTime(LocalDateTime.now());
            if (messageMapper.add(message) > 0) {
                result.setCode(0);
                result.setMessage("success");
                result.setContent(message.getId());
            } else {
                result.setCode(2);
                result.setMessage("failed");
            }
        }
        return objectMapper.writeValueAsString(result);
    }
}
