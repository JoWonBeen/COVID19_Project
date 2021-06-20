package com.covid19.model.CenterAdmin;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CenterVaccineReservaionBean {
	private String memberId;
	private String name;
	private String birth;
	private String age;
	private String gender;
	private String phone;
    private String gubun;
    private String vaccine;
    private String hospitalAdd;
    private String rsDate; 
    private Date regDate;
}
