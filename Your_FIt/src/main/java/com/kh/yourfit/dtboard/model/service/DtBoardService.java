package com.kh.yourfit.dtboard.model.service;

import java.util.List;
import java.util.Map;


import com.kh.yourfit.dtboard.model.vo.BoardFile;
import com.kh.yourfit.dtboard.model.vo.DtBoard;



public interface DtBoardService {
	
	List<Map<String, Object>> selectBoardList(int cPage, int numPerPage);
	
	int selectBoardTotalContents();

	int insertBoard(DtBoard dtboard, List<BoardFile> fileList);

	DtBoard selectOneBoard(String dt_No);

	List<BoardFile> selectBoardFileList(String dt_No);

	DtBoard updateView(String dt_No);

	int updateBoard(DtBoard dtboard, List<BoardFile> boardfileList);

	int deleteBoard(String dt_No);

	int deleteFile(int fNo);

	

	

	
	
}
