package com.veveup.dao;

import com.veveup.domain.Account;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountDao {

//    @Select("select * from message")
    public List<Account> findAll();

//    @Insert("insert into message(content,author) values(#{content},#{author})")
    public void saveAccount(String content,String author);

}
