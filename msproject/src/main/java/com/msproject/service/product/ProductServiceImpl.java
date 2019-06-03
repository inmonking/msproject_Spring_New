package com.msproject.service.product;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.msproject.domain.product.ProductDTO;
import com.msproject.persistence.product.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO pDao;
	
	@Override
	public HashMap<String, List<ProductDTO>> productList() {
		// DB에 있는 베스트상품과 신상품을 받아서 index로 전달
		// ProductDAO
		List<ProductDTO> bList = pDao.bestList();
		List<ProductDTO> nList = pDao.newList();
		
		HashMap<String, List<ProductDTO>> map = new HashMap<String, List<ProductDTO>>();
		map.put("bList", bList);
		map.put("nList", nList);
		
		return map;
	}

}
