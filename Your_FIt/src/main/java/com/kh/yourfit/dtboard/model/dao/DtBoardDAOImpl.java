package com.kh.yourfit.dtboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.board_file.model.vo.board_file;

import com.kh.yourfit.dtboard.model.vo.DtBoard;

@Repository
public class DtBoardDAOImpl implements DtBoardDAO{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("dtBoardMapper.selectBoardList", null, rows);
	}

	@Override
	public int selectBoardTotalContents() {
		
		return sqlSession.selectOne("dtBoardMapper.selectBoardTotalContents");
	}

	@Override
	public int insertBoard(DtBoard dtboard) {
		
		return sqlSession.insert("dtBoardMapper.insertBoard", dtboard);
	}

	@Override
	public int insertBoardFile(board_file bf) {
		
		return sqlSession.insert("dtBoardMapper.insertBoardFile", bf);
	}

	@Override
	public DtBoard selectOneBoard(String dt_No) {
		
		return sqlSession.selectOne("dtBoardMapper.selectOneBoard", dt_No);
	}

	@Override
	public List<board_file> selectBoardFileList(String dt_No) {
		
		return sqlSession.selectList("dtBoardMapper.selectBoardFileList", dt_No);
	}

	@Override
	public int updateReadCount(String dt_No) {
		
		return sqlSession.update("dtBoardMapper.updateReadCount", dt_No);
	}

	@Override
	public int updateBoard(DtBoard dtboard) {
		
		return sqlSession.update("dtBoardMapper.updateBoard", dtboard);
	}

	@Override
	public int updateBoardFile(board_file bf) {
		
		return sqlSession.insert("dtBoardMapper.updateBoardFile", bf);
	}

	@Override
	public int deleteBoardFile(String dt_No) {
		
		return sqlSession.delete("dtBoardMapper.deleteBoardFile", dt_No);
	}

	@Override
	public int deleteBoard(String dt_No) {
		
		return sqlSession.delete("dtBoardMapper.deleteBoard", dt_No);
	}

	@Override
	public int deleteFile(int fNo) {
		
		return sqlSession.delete("dtBoardMapper.deleteFile", fNo);
	}

	

}
