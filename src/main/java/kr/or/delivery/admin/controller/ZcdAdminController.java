package kr.or.delivery.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ZcdAdminController {
	
	@RequestMapping(value = "/admin.do")
	public String admin() {
		return "delivery/admin/admin";
	}
}
