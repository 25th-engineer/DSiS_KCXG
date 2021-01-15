package com.one.sugarcane.question.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.sugarcane.entity.QuestionBank;
import com.one.sugarcane.question.service.QuestionServiceImpl;

/**
 * 
 * @author 崔允松
 * @date 2018/06/05
 * 答题页面相关方法
 */

@Controller
@RequestMapping("ques")
public class GetQuestion {
	@Resource
	private QuestionServiceImpl questionServiceImpl;
	
	
	
	@RequestMapping("getquest")
	String Getquestion(@RequestParam String courseType,HttpServletRequest req) {
		HttpSession hs = req.getSession();
		List<QuestionBank> relist = new ArrayList<QuestionBank>();
		relist = (List<QuestionBank>) req.getSession().getAttribute("questions");
		
		if(relist != null) {
			for(int i=0;i<relist.size();i++){    
			    relist.remove(i);
			}
		}
		
		List<QuestionBank> list = new ArrayList<QuestionBank>();
		list = (List<QuestionBank>)this.questionServiceImpl.findQuesByType(courseType);

        List<QuestionBank> queslist = new ArrayList<QuestionBank>();
        //设置题目的数量
        for(int i=0;i<7;i++) {
        queslist.add(list.get(i));    
        }
        //将queslist保存到session中
        System.out.println("3");
        req.getSession().setAttribute("questions", queslist);
		
		
		return "front/questions";
	}
	
	

	@RequestMapping("getanswer")
	String Getanswer(@RequestParam String answer1,@RequestParam String answer2,@RequestParam String answer3,@RequestParam String answer4,@RequestParam String answer5,@RequestParam String answer6,@RequestParam String answer7,HttpServletRequest req) {
		HttpSession hs = req.getSession();
		List<QuestionBank> list = new ArrayList<QuestionBank>();
		list = (List<QuestionBank>) req.getSession().getAttribute("questions");
		int num = 0;
		List<String> a = new ArrayList<String>();
		a.add(answer1);
		a.add(answer2);
		a.add(answer3);
		a.add(answer4);
		a.add(answer5);
		a.add(answer6);
		a.add(answer7);
		
		//对比所有题的答案然后根据对错给出分数
		for(int i=0;i<7;i++) {
		String a1 = list.get(i).getAnswer();
		String a2 = a.get(i);
		System.out.println(a1);
		System.out.println(a2);
		if (a1.equals(a2)) {
			num+=1;
		}else {
			num+=0;
		}
		}
		String message ="";
		if(num == 7) {
			message="您的成绩等级为S+";
		}else if(num == 6) {
			message="您的成绩等级为S";
		}else if(num == 5) {
			message="您的成绩等级为A";
		}else if(num == 4){
			message="您的成绩等级为B";
		}else {
			message="您的成绩等级为C";
		}
		req.getSession().setAttribute("message", message);
		
		return "front/courseListsover";
	}
	
	
	
	

}
	
	
	
