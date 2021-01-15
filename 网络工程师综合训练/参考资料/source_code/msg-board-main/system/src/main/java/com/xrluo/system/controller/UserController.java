package com.xrluo.system.controller;

import com.xrluo.common.api.Result;
import com.xrluo.mbg.model.User;
import com.xrluo.system.dto.UserDto;
import com.xrluo.system.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(tags = "用户管理")
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/list")
    public List<User> list() {
        List<User> list = userService.list(2, 3);
        return list;
    }


    @RequestMapping("/list1")
    public Result<List<User>> list(@RequestParam(value = "pageSize", defaultValue = "1") Integer pageSize, @RequestParam(defaultValue = "10") Integer pageNum) {
        System.out.println(pageSize + "=========================================================" + pageNum);
        List<User> list = userService.list(pageSize, pageNum);

        return Result.success(list);
    }


    @RequestMapping("list2")
    public Result<String> list(@RequestParam(defaultValue = "5", name = "integer2") Integer integer) {

        return Result.success(integer + "");
    }


    @RequestMapping("list3/{id}")
    public Result<String> list(@PathVariable(name = "id") String string) {
        return Result.success(string);
    }


    @RequestMapping("list4")
    public Result<UserDto> list1(@RequestBody UserDto userDto) {
        return Result.success(userDto);
    }


    @ApiOperation(value = "列表查询", notes = "notes是备注的意思吗????", response = UserDto.class)
    @RequestMapping("list5")
    public Result<Object> list5(@Validated @RequestBody UserDto userDto, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Result.success(error.getDefaultMessage());
            }
        }
        return Result.success(userDto);
    }
}
