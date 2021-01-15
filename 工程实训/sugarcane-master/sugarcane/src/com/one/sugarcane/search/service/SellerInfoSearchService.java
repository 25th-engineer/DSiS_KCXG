package com.one.sugarcane.search.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.lucene.queryparser.classic.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.sugarcane.entity.Searcher;

/**
 * 根据索引搜索培训机构 并且高亮显示 TODO
 * 
 * @author 秦晓宇
 * @date 2018年5月29日
 * 
 */
@Service
@Transactional(readOnly = false)
public class SellerInfoSearchService {
	public static String pt;
	
	private SellerInfoSearch sellerInfoSearch = new SellerInfoSearch() ;

	public ArrayList<Searcher>  searchBySellerName(String name,int currentPage) throws Exception {
		pt = "E:\\gitRepository\\sugarcane\\sugarcane\\src\\com\\one\\sugarcane\\search\\dataIndex\\sellerIndex";
		return sellerInfoSearch.search(pt, name,currentPage);
	}
	public String[] totalNumber(String name) throws IOException, ParseException {
		return this.sellerInfoSearch.findIndex(pt, name);
	}
}
