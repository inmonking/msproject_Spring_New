package com.msproject.domain.member;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemberDTO {
	
	private int idnum;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String zipcode;
	private String addr1;
	private String addr2;
	private int birth_year;
	private int birth_month;
	private int birth_day;
	private Date regdate;
}
