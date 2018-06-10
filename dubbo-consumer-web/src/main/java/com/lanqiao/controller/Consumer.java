package com.lanqiao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.dubbo.demo.IProviderService;
import com.alibaba.dubbo.demo.IProviderService2;
import com.alibaba.dubbo.demo.IProviderService3;
@Controller
public class Consumer {
	@Autowired
    private IProviderService providerService;
	@Autowired
    private IProviderService2 providerService2;
	@Autowired
    private IProviderService3 providerService3;
	@RequestMapping("/service1.do")
	public ModelAndView service1(ModelAndView mv,String word){
		String ret = providerService.service1(word);
		mv.setViewName("index.jsp");
		mv.addObject("yword1", word);
		mv.addObject("word1", ret);
		return mv;
	}
	@RequestMapping("/service2.do")
	public ModelAndView service2(ModelAndView mv,String word){
		String ret = providerService2.service2(word);
		mv.setViewName("index.jsp");
		mv.addObject("yword2", word);
		mv.addObject("word2", ret);
		return mv;
	}
	@RequestMapping("/service3.do")
	public ModelAndView service3(ModelAndView mv,String word){
		String ret = providerService3.service3(word);
		mv.setViewName("index.jsp");
		mv.addObject("yword3", word);
		mv.addObject("word3", ret);
		return mv;
	}
}
