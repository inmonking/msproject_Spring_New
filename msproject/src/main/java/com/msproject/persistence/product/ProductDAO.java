package com.msproject.persistence.product;

import java.util.List;

import com.msproject.domain.product.ProductDTO;

public interface ProductDAO {
	public List<ProductDTO> bestList();	//베스트상품
	public List<ProductDTO> newList();	//신상품
}
