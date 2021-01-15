package com.veveup.test;

import com.veveup.dao.AccountDao;
import com.veveup.dao.MessageDao;
import com.veveup.domain.Account;
import com.veveup.domain.Message;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class MybatisTest {

    private InputStream in;
    private SqlSession session;
    private AccountDao accountDao;
    private MessageDao messageDao;

    @Before
    public void init() throws IOException {
        // 加载配置文件
        in = Resources.getResourceAsStream("mybatis.xml");
        // 陈建factory对象
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        // 创建 Sqlsession 对象
        session = factory.openSession();

        //获取代理对象
        accountDao = session.getMapper(AccountDao.class);
        messageDao = session.getMapper(MessageDao.class);
    }

    @After
    public void destroy() throws IOException {
        //关闭资源
        session.commit();
        session.close();
        in.close();
    }

    @Test
    public void testMain() {
        //查询所有数据
        List<Account> all = accountDao.findAll();
        for (Account i : all) {
            System.out.println(i);
        }
    }

    /**
     * 测试数据插入
     */
    @Test
    public void testInsert() {
        Message message = new Message();
        message.setContent("Hello3");
        message.setAuthor("demo1");
        messageDao.InsertMessage(message);
    }

    @Test
    public void testfindAll() {
        List<Message> messages = messageDao.findAll();
        for (Message m :
                messages) {
            System.out.println(m);
        }
    }

}
