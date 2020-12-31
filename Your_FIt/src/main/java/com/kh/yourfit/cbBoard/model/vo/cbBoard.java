package com.kh.yourfit.cbBoard.model.vo;

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
public class cbBoard {
	private String cb_no;
	private String cb_foodname;
	private String cb_unit;
	private int cb_cal;
	private float cb_carbohydrate;
	private float cb_protein;
	private float cb_fat;
	private int cb_mno;
}
