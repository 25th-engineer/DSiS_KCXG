package com.veveup.controller;

import com.veveup.dao.MessageDao;
import com.veveup.domain.Message;
import com.veveup.domain.User;
import com.veveup.utils.DateConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {
    @Autowired
    private MessageDao messageDao;

    @RequestMapping("/getAll")
    public String getAll(Model model, HttpServletRequest request, String al) {
        System.out.println("message/getAll run and al=" + al);
        List<Message> all = null;
        Object user = request.getSession().getAttribute("user");
        if ("1".equals(al)) {
            if (user instanceof User) {
                if (((User) user).getLevel().equals(User.Admin)) {
                    // 管理员 可见所有留言 包括被隐藏的（删除的、审核中的）
                    all = messageDao.findAll();
                }
            }
        }
        if (all == null) {
            all = messageDao.findAllVisiable();
        }

        // 测试管理员 权限 不需要全部打开
        // 反转 根据时间顺序显示
        Collections.reverse(all);
        // 格式化时间 显示为友好的方式
        for (Message m :
                all) {
//            System.out.println("Date:"+m.getDate());
            m.setDate(DateConvertUtils.getNiceTime(m.getDate()));
            // 若m.date 字符串长度大于 10 则代表已经大于了一天 返回的是日期 后面的内容不再需要遍历
            if (m.getDate().length() > 10) {
                break;
            }
        }
        model.addAttribute("list", all);
        return "messages";
    }

//    @RequestMapping("/getOne")
//    public String getOne(Integer i,Model model){
//        Message messageById = messageDao.findMessageById(i);
//        model.addAttribute("message",messageById);
//        return "message";
//    }

    @RequestMapping("/save")
    public void saveMessage(String author, String content, HttpServletResponse response, HttpServletRequest request) throws IOException {
        System.out.println("message/save run");
        // 判断是否由发言权限 存在频繁操作 等不正常的行为

        Message message1 = new Message();
        message1.setAuthor(author);
        message1.setContent(content);

        Object user = request.getSession().getAttribute("user");
        if (user instanceof User) {
            message1.setAuthorId(((User) user).getUid());
        }
        messageDao.InsertMessage(message1);
        System.out.println("message/save Dao done");
        response.sendRedirect(request.getContextPath() + "/message/getAll");
        return;
    }

    // 以post方式 将json格式message 保存 用于Ajax异步请求
    @RequestMapping(value = "/saveAjax", method = {RequestMethod.POST})
    public @ResponseBody
    Object saveMessagePost(@RequestBody Message message, HttpServletRequest request) {
        System.out.println("message/save.Ajax run");
        // 判断是否由权限
        Object user = request.getSession().getAttribute("user");
        if (user instanceof User) {
            message.setAuthorId(((User) user).getUid());
        }
        // 不允许指定id
        message.setId(null);
        messageDao.InsertMessageAndReturnId(message);
        Integer id = message.getId();

        System.out.println("保存后的message：" + message.toString());
        HashMap<String, String> map = new HashMap<>();
        map.put("status", "ok");
        map.put("msg", "添加完成");
        map.put("id", String.valueOf(id));
        map.put("time", String.valueOf(new Date().getTime()));
        return map;
    }


    @RequestMapping(value = "/updateAjax", method = {RequestMethod.POST})
    public @ResponseBody
    Object updateMessagePost(@RequestBody Message message, HttpServletRequest request) {
        System.out.println("message/update.Ajax run");
        HashMap<String, String> map = new HashMap<>();
        // 判断是否由权限
        Object user = request.getSession().getAttribute("user");
        map.put("id", String.valueOf(message.getId()));
        if (user instanceof User) {
            if (((User) user).getLevel().equals(User.Admin)) {
                messageDao.updateMessage(message);
                map.put("status", "success");
                map.put("msg", "使用管理员权限 修改留言成功");
                map.put("time", String.valueOf(new Date().getTime()));
                return map;
            } else {
                Message messageById = messageDao.findMessageById(message.getId());
                if (((User) user).getUid().equals(messageById.getAuthorId())) {
                    messageDao.updateMessage(message);
                    map.put("status", "success");
                    map.put("msg", "修改自己的留言成功");
                    map.put("time", String.valueOf(new Date().getTime()));
                    return map;
                }
            }
        }
        map.put("status", "error");
        map.put("msg", "没有权限 只允许修改自己的留言");
        map.put("time", String.valueOf(new Date().getTime()));
        return map;
    }

    @RequestMapping("/deleteById")
    public String deleteById(Integer id, Model model, HttpServletRequest request) {
        // 判断是否有删除权限 自己发的留言 管理员 均可删除 但是游客没有权限
        Object user = request.getSession().getAttribute("user");
        if (user instanceof User) {
            // 管理员 直接允许
            if (((User) user).getLevel().equals(User.Admin)) {
                messageDao.setHiddenById(id);
                model.addAttribute("msg", "使用管理员权限 隐藏留言成功");
                return "success";
            } else {
                Message messageById = messageDao.findMessageById(id);
                Integer aid = messageById.getAuthorId();
                if (aid instanceof Integer && aid.equals(((User) user).getUid())) {
                    messageDao.setHiddenById(id);
                    model.addAttribute("msg", "删除成功！");
                    return "success";
                }
            }
        }
        if (true) {
            model.addAttribute("msg", "没有删除权限/只允许删除自己的留言！");
            return "error";
        }
        messageDao.setHiddenById(id);
        model.addAttribute("msg", "删除留言成功！");
        return "success";
    }

    /**
     * Ajax 方式请求删除 返回Jaon
     *
     * @param id
     * @param request
     * @return
     */
    @RequestMapping("/deleteByIdAjax")
    public @ResponseBody
    Object deleteByIdAjax(Integer id, HttpServletRequest request) {
        // 判断是否有删除权限 自己发的留言 管理员 均可删除 但是游客没有权限
        Object user = request.getSession().getAttribute("user");
        HashMap<String, String> map = new HashMap<>();
        map.put("time", String.valueOf(new Date().getTime()));
        if (user instanceof User) {
            // 管理员 直接允许
            if (((User) user).getLevel().equals(User.Admin)) {
                messageDao.setHiddenById(id);
                map.put("msg", "使用管理员权限 隐藏留言成功");
                map.put("status", "success");
                return map;
            } else {
                Message messageById = messageDao.findMessageById(id);
                Integer aid = messageById.getAuthorId();
                if (aid instanceof Integer && aid.equals(((User) user).getUid())) {
                    messageDao.setHiddenById(id);
                    map.put("msg", "删除成功！");
                    map.put("status", "success");
                    return map;
                }
            }
        }
        if (true) {
            map.put("msg", "没有删除权限/只允许删除自己的留言！");
            map.put("status", "error");
            return map;
        }
        messageDao.setHiddenById(id);
        map.put("msg", "删除留言成功！");
        map.put("status", "success");
        return map;
    }

    @RequestMapping("/likes")
    public @ResponseBody
    Object likes(Integer id, HttpServletResponse response) {
        // 判断用户是否有点赞权
        System.out.println("message/likes run");
        messageDao.addLikesById(id);
        HashMap map = new HashMap();
        map.put("status", "ok");
        map.put("msg", "success");
        response.setStatus(200);
        return map;
    }

    @RequestMapping("updateMessage")
    public @ResponseBody
    Object updateMessageAjax(@RequestBody Message message, HttpServletRequest request) {
        HashMap<String, String> map = new HashMap<>();
        // 鉴权 是否是管理员 或者是自己发送的
        Object user = request.getSession().getAttribute("user");
        if (user instanceof User) {
            // 管理员 直接允许
            if (((User) user).getLevel().equals(User.Admin)) {
                messageDao.updateMessage(message);
                map.put("status", "success");
                map.put("msg", "使用管理员权限修改内容成功");
                map.put("time", String.valueOf(new Date().getTime()));
                return map;
            } else {
                Message messageById = messageDao.findMessageById(message.getId());
                Integer aid = messageById.getAuthorId();
                if (aid instanceof Integer && aid.equals(((User) user).getUid())) {
                    messageDao.updateMessage(message);
                    map.put("msg", "修改自己的留言成功");
                    map.put("status", "success");
                    map.put("time", String.valueOf(new Date().getTime()));
                    return map;
                }
            }
        }
        map.put("status", "error");
        map.put("msg", "只能修改自己的留言哦！");
        map.put("time", String.valueOf(new Date().getTime()));
        return map;
    }


}
