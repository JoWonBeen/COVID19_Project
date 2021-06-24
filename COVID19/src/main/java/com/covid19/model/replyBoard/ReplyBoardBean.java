package com.covid19.model.replyBoard;
import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;


@Component
@Data
public class ReplyBoardBean {
	private int no;
	private String subject;
	private Date regDate;
	private int ref;        
	private int reStep;     
	private int reLevel; 
	private int readCount;  
	private String contents;
	private String memberId;

}
