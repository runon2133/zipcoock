package kr.or.zipcoock.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.zipcoock.board.service.MainBoardService;
import kr.or.zipcoock.board.vo.ProductPageArgs;
import kr.or.zipcoock.board.vo.SearchTool;

@Controller
public class MainBoardController {
	@Autowired
	private MainBoardService service;

	@RequestMapping(value = "/mainboard.do")
	public String callMainboard(SearchTool tool, Model model) {

		model.addAttribute("cards", service.MainBoard(tool));
		
		model.addAttribute("tool", tool);

		return "zipcoock/board/mainboard";
	}

	@RequestMapping(value = "/mainboardView.do")
	public String callMainboarView(ProductPageArgs args, Model model) {

		model.addAttribute("tool", new SearchTool());
		
		model.addAttribute("pp", service.getProductPage(args));
		
		model.addAttribute("pi", service.getProductImg(args));
				
		return "zipcoock/board/mainboardView";
	}
	
	
    @ResponseBody
	@RequestMapping(value = "/getReview.do", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String getReview(ProductPageArgs args) {
		return new Gson().toJson(service.getReview(args));	
    };
	@ResponseBody
	@RequestMapping(value = "/getQna.do", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String getQna(ProductPageArgs args) {
		return new Gson().toJson(service.getQna(args));
		
	};
	
}
