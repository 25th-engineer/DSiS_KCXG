package com.xrluo.system.dto;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Data
public class UserDto {

    @NotEmpty(message = "名字不能为空")
    @Size(min = 6, max = 10, message = "长度不符合标准.")
    private String name;
    private String age;
}
