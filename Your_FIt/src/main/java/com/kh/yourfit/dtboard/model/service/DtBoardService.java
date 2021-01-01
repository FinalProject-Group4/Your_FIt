package com.kh.yourfit.dtboard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.board_file.model.vo.board_file;

import com.kh.yourfit.dtboard.model.vo.DtBoard;



public interface DtBoardService {
	
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);
	
	int selectBoardTotalContents();

	int insertBoard(DtBoard dtboard, List<board_file> fileList);

	DtBoard selectOneBoard(String dt_No);

	List<board_file> selectBoardFileList(String dt_No);

	DtBoard updateView(String dt_No);

	int updateBoard(DtBoard dtboard, List<board_file> boardfileList);

	int deleteBoard(String dt_No);

	int deleteFile(int fNo);

	

	

	
	
}
