package com.msproject.domain.product;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Data
//:사용하지 않는 내용까지 추가됨

@NoArgsConstructor	// 기본생성자
@AllArgsConstructor // 전체생성자
@Getter	
@Setter
@ToString
public class ProductDTO {
	private String p_code;
	private String p_name;
	private int p_price;
	private String p_type;
	private String p_img;
	private int p_cnt;
	private int p_good;
	private Date date;
	
	//lombok - DTO에서 필요로 하는 생성자, getter,setter 등등을 자동으로 만들어줌
	
}
