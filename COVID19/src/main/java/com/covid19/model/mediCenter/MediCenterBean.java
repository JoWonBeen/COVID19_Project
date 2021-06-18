package com.covid19.model.mediCenter;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MediCenterBean {
	private int no;
	private int gubun;
	private String centerName;
	private String address;
	private String phone;
}
