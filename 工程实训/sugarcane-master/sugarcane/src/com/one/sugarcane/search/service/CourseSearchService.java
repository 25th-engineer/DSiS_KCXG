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
 * 根据索引搜索课程 并且高亮显示 TODO
 * 
 * @author 秦晓宇
 * @date 2018年5月29日
 * 
 */
@Service
@Transactional(readOnly = false)
public class CourseSearchService {
	public static String pt;

	
	private CourseSearch courseSearch = new CourseSearch();

	public ArrayList<Searcher> searchByCourseName(String name,int currentPage) throws Exception {
		pt = "E:\\gitRepository\\sugarcane\\sugarcane\\src\\com\\one\\sugarcane\\search\\dataIndex\\courseIndex";
		return this.courseSearch.search(pt, name,currentPage);
	}
	public String[] totalNumber(String name) throws IOException, ParseException {
		return this.courseSearch.findIndex(pt, name);
	}
}
