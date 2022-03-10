package com.kh.earth.challenge.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Point {
	private int no;
	
	private int pointNo;
	
	private int memNo;
	
	private String saveDate;
	
	private String content;	
	
	private int point;
	
	private Date disapearDate;
	
}
