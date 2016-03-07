package com.henu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnalysisController {
	@RequestMapping("admin/tradeAnalysis")
	public String getAnalysis(){
		return "admin/transactionAnalysis";	
	}
}
