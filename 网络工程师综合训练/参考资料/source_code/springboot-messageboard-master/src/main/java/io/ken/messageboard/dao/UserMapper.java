package io.ken.messageboard.dao;

import io.ken.messageboard.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    //@Select("SELECT *  FROM user WHERE name = #{name}")
    User queryByName(String name);
}
