package com.one.sugarcane.sellerloginlog.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.one.sugarcane.sellerloginlog.dao.SellerLoginLogDaoImpl;
import com.one.sugarcane.entity.SellerLoginLog;

@Service
@Transactional(readOnly=false)
public class SellerLoginLogServiceImpl {
	@Resource
	private SellerLoginLogDaoImpl sellerLoginLogDaoImpl;
}
