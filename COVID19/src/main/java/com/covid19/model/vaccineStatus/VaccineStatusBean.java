package com.covid19.model.vaccineStatus;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class VaccineStatusBean {
	private int no;
	private String baseDate;
	private String area;
	private int firstCnt;
	private int secondCnt;
	private int totalFirstCnt;
	private int totalSecondCnt;

}
