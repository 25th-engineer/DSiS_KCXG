package com.xrluo.system.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.xrluo.mbg.mapper")
public class MybatisConfig {
}
