package com.covid19.model.member;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class AdminBean {
	private int no;
	private String id;
	private String name;
	private String password;
	private String centerName;
	private String phone;
	private int type;
}
