package com.xrluo.common.api;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Result<T> {
    private long code;
    private String message;
    private T data;

    public Result() {
    }

    public Result(long code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }


    /**
     * 成功返回结果
     *
     * @param data
     * @param <T>
     * @return
     */
    public static <T> Result<T> success(T data) {
        return new Result<T>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), data);
    }
}
