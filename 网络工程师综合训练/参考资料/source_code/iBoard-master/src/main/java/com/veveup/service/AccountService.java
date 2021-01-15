package com.veveup.service;

import com.veveup.domain.Account;
import org.springframework.stereotype.Service;

import java.util.List;


public interface AccountService {

    public List<Account> findAll();

    public void saveAccount(String content,String author);
}
