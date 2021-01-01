package com.kh.yourfit.dtboard.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.dtboard.model.vo.DtBoard;

public interface DtBoardDAO {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);
	
	int selectBoardTotalContents();
	
	int insertBoard(DtBoard dtboard);

	int insertBoardFile(board_file bf);
	
	DtBoard selectOneBoard(String dt_No);
	
	List<board_file> selectBoardFileList(String dt_No);

	int updateReadCount(String dt_No);
	
	int updateBoard(DtBoard dtboard);
	
	int updateBoardFile(board_file bf);

	int deleteBoardFile(String dt_No);

	int deleteBoard(String dt_No);

	int deleteFile(int fNo);

	

	
}
