package com.one.sugarcane.sellerloginlog.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.sugarcane.sellerloginlog.service.SellerLoginLogServiceImpl;

@Controller
@RequestMapping("sellerLoginLog")
public class SellerLoginLogController {
	@Resource
	private SellerLoginLogServiceImpl sellerLoginLogServiceImpl;
}
