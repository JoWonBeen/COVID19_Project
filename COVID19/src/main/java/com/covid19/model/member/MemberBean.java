package com.covid19.model.member;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberBean {
	private int no;
	private String id;
	private String name;
	private String password;
	private String birth;
	private String gender;
	private String phone;
	private int type;
	private int targetCheck;
}
