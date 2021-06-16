package com.covid19.model.reserve;

import org.springframework.stereotype.Component;

import lombok.Data;
@Component
@Data
public class ReserveBean {

	private String gubun; //예약대상자
	private String vaccine; // 백신
	private String hospitalAdd; // 의료기관 데이터
	private String rsDate; //예약일시 데이터 가져오는 것
}
