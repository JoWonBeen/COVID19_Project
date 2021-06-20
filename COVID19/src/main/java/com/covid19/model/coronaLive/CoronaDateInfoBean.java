package com.covid19.model.coronaLive;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CoronaDateInfoBean {
	private int no;
	private String startDate;
	private int deathCnt;
	private int decideCnt;
	private int clearCnt;
	private int todayCnt;
}
