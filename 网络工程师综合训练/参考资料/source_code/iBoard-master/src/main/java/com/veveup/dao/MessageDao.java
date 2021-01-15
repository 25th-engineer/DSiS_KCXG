package com.veveup.dao;

import com.veveup.domain.Message;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageDao {
//    @Select("select * from message order by date desc")
//    Message findMessageById(Integer id);

    //    @Select("Select * from message order by date desc")
    List<Message> findAll();

    List<Message> findAllVisiable();

    //    @Insert("insert into message(author,content,date) values(#{author},#{content},#{date})")
    void InsertMessage(Message message);

    Integer InsertMessageAndReturnId(Message message);

    void setHiddenById(Integer id);

    void addLikesById(Integer id);

    void minusLikesById(Integer id);

    Message findMessageById(Integer id);

    void updateMessage(Message message);


}
