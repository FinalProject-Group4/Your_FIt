package com.kh.yourfit.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectOneMember(String userId) {
		return sqlSession.selectOne("memberMapper.loginMember",userId);
	}

	@Override
	public int idChk(HashMap<String, Object> hmap) {
		sqlSession.selectOne("memberMapper.idChk", hmap);
		return (Integer) hmap.get("result");
	}

	@Override
	public int nickChk(HashMap<String, Object> hmap) {
		sqlSession.selectOne("memberMapper.nickChk", hmap);
		return (Integer) hmap.get("result");
	}

	@Override
	public int joinMember(Member member) {
		return sqlSession.insert("memberMapper.joinMember",member);
	}
}
