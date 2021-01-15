package com.one.sugarcane.test.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.sugarcane.test.dao.TestDao;

@Service
@Transactional
public class TestService {
	@Resource
	private TestDao testDao;
	
	public void testService() {
		this.testDao.test();
	}
}
