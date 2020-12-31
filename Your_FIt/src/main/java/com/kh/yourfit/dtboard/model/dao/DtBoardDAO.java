package com.kh.yourfit.dtboard.model.dao;

import java.util.List;
import java.util.Map;


import com.kh.yourfit.dtboard.model.vo.BoardFile;
import com.kh.yourfit.dtboard.model.vo.DtBoard;

public interface DtBoardDAO {

	List<Map<String, Object>> selectBoardList(int cPage, int numPerPage);
	
	int selectBoardTotalContents();
	
	int insertBoard(DtBoard dtboard);

	int insertBoardFile(BoardFile bf);
	
	DtBoard selectOneBoard(String dt_No);
	
	List<BoardFile> selectBoardFileList(String dt_No);

	int updateReadCount(String dt_No);
	
	int updateBoard(DtBoard dtboard);
	
	int updateBoardFile(BoardFile bf);

	int deleteBoardFile(String dt_No);

	int deleteBoard(String dt_No);

	int deleteFile(int fNo);

	

	
}
