package com.covid19.model.CenterAdmin;

import org.springframework.stereotype.Component;


import lombok.Data;

@Component
@Data
public class CenterVaccineInfoBean {
	private String centerName;
	private String vaccineType;
	private int vaccineCnt;
}
