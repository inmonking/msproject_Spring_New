package com.msproject.persistence.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.msproject.domain.product.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sqlsession;
	
	@Override
	public List<ProductDTO> bestList() {
		return sqlsession.selectList("pdt.bestList");
	}

	@Override
	public List<ProductDTO> newList() {
		return sqlsession.selectList("pdt.newList");
	}

}
