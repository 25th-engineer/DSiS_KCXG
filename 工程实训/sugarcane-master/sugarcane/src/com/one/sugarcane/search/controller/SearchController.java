package com.one.sugarcane.search.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.sugarcane.entity.Searcher;
import com.one.sugarcane.search.service.CourseSearchService;
import com.one.sugarcane.search.service.SellerInfoSearchService;

@Controller
@RequestMapping("search")
public class SearchController {
	public ArrayList<Searcher> list = new ArrayList<Searcher>();
	@Resource
	private CourseSearchService courseSearchService;
	@Resource
	private SellerInfoSearchService SellerInfoSearchService;

	@RequestMapping("/searchByCourse")
	public void searchByCourse(@RequestParam("searchName") String name,
			@RequestParam("currentPage") Integer currentPage, HttpServletResponse response, HttpSession sessione)
			throws Exception {
		list = this.courseSearchService.searchByCourseName(name, currentPage);
		String b[] = this.courseSearchService.totalNumber(name);
		sessione.setAttribute("pageIndex", b[0]);
		sessione.setAttribute("totalNumber", b[1]);
		sessione.setAttribute("currentPage", currentPage);
		sessione.setAttribute("courseName", name);
		sessione.setAttribute("courseSearcher", list);
		response.sendRedirect("/Sugarcane/front/searchResult.jsp");
	}

	@RequestMapping("/searchBySeller")
	public void serachBySeller(@RequestParam("searchName") String name, HttpServletResponse response,
			HttpSession sessione ,@RequestParam("currentPage") Integer currentPage) throws Exception {
		list = this.SellerInfoSearchService.searchBySellerName(name, currentPage);

		String b[] = this.SellerInfoSearchService.totalNumber(name);
		sessione.setAttribute("pageIndex1", b[0]);
		sessione.setAttribute("totalNumber1", b[1]);
		sessione.setAttribute("currentPage", currentPage);
		sessione.setAttribute("sellerName", name);
		sessione.setAttribute("sellerSearcher", list);
		response.sendRedirect("/Sugarcane/front/searchResult1.jsp");
	}
}
