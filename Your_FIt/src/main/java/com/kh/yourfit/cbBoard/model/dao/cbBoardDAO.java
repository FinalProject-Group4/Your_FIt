package com.kh.yourfit.cbBoard.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.yourfit.cbBoard.model.vo.cbBoard;

public interface cbBoardDAO {

	List<Map<String, String>> selectcbBoard(int cPage, int numPerPage);
	
	int selectcbBoardTotalContents();

	int insertcbBoard(cbBoard cbBoard);

	cbBoard selectOnecbBoard(String cb_no);

	int updatecbBoard(cbBoard cbBoard);

	int deletecbBoard(String cb_no);

	List<Map<String, String>> cbBoardSearch(int cPage, int numPerPage, String keyword);

	int cbBoardSearchCnt(String keyword);

}
