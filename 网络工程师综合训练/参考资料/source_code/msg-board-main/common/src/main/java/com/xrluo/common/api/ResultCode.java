package com.xrluo.common.api;

import lombok.Getter;

/**
 * 枚举一些常用API操作码
 */
@Getter
public enum ResultCode {
    SUCCESS(200, "操作成功"),
    FAILED(500, "操作失败");


    private final long code;

    private final String message;

    private ResultCode(long code, String message) {
        this.code = code;
        this.message = message;
    }
}
