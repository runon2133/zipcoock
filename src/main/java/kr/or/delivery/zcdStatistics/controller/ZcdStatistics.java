package kr.or.delivery.zcdStatistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ZcdStatistics {
	
	@RequestMapping(value = "/zcdStatistics.do")
	public String zcdStatistics() {
		return "delivery/statistics/zcdStatistics";
	}
}
