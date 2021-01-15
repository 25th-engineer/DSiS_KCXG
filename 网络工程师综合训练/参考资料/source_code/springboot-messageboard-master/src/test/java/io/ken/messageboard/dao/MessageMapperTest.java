package io.ken.messageboard.dao;

import io.ken.messageboard.model.Message;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

@SpringBootTest
public class MessageMapperTest {

    @Autowired
    MessageMapper messageMapper;

    @Test
    public void add() {
        Message message = new Message();
        message.setUserId(1);
        message.setUserName("Ken");
        message.setBody("这是一个测试留言" + Math.random());
        message.setParentId(0);
        message.setInsertTime(LocalDateTime.now());
        message.setUpdateTime(LocalDateTime.now());
        int result = messageMapper.add(message);
        System.out.println(String.format("result:%s,id:%s", result, message.getId()));
        assert (result > 0) : "添加失败";
    }

    @Test
    public void queryListPaging() {
        List<Message> messageList = messageMapper.queryListPaging(1, 1, 0);
        for (Message message : messageList) {
            System.out.println(String.format("id:%s,user:%s,message:%s", message.getId(), message.getUserName(), message.getBody()));
        }
        assert (messageList != null && messageList.size() > 0) : "查询出错";
    }

    @Test
    public void addBatch() {
        int num = 1000;
        Message message = new Message();
        message.setParentId(0);
        message.setInsertTime(LocalDateTime.now());
        message.setUpdateTime(LocalDateTime.now());
        HashMap<Integer, String> userMap = new HashMap<>();
        userMap.put(1, "Ken");
        userMap.put(2, "Frank");
        userMap.put(3, "Candy");
        for (int i = 0; i < num; i++) {
            int randomNum = (int) (Math.random() * 1000);
            int userId = randomNum % 3 + 1;
            message.setUserId(userId);
            message.setUserName(userMap.get(userId));
            message.setBody("这是一个测试留言" + randomNum);
            messageMapper.add(message);
        }
    }

    @Test
    void countAll() {
        int num = messageMapper.countAll();
        System.out.println(num);
        assert (num > 0);
    }
}
