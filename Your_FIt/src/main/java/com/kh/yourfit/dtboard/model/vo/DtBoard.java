package com.kh.yourfit.dtboard.model.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DtBoard {
	
	private String dt_No;  
	private String dt_Type;  
	private String dt_Title;
	private String dt_Content;
	private int dt_Count;
	private int dt_Mno;
	
	private List<BoardFile> files = new ArrayList<>();
}
