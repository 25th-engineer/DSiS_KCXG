package com.veveup.service.impl;

import com.veveup.dao.AccountDao;
import com.veveup.domain.Account;
import com.veveup.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDao accountDao;

    @Override
    public List<Account> findAll() {
        System.out.println("业务层 查询所有账户。。。。");
        return accountDao.findAll();
    }

    @Override
    public void saveAccount(String content,String author) {
        System.out.println("业务层 保存一个账户 。。。。");
        accountDao.saveAccount(content,author);

    }
}
