package com.covid19.model.coronaLive;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CoronaSidoInfoBean {
	private int no;
	private String startDate;
	private int deathCnt;
	private int todayCnt;
	private String area;
}
