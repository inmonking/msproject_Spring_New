package com.msproject.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.msproject.domain.product.ProductDTO;
import com.msproject.service.product.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j	// lombok에서 지원하는 로그기능
public class IndexController {
	//private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	// logger.info("");
	@Inject
	private ProductService service;
	
	@RequestMapping("/")
	public String index(Model model) {
		log.info(">>>>> index 페이지");
		HashMap<String, List<ProductDTO>> map = service.productList();
		model.addAttribute("pLists", map);
		
		return "index2";
	}
}
