package com.kh.yourfit.member.model.dao;

import java.util.HashMap;

import com.kh.yourfit.member.model.vo.Member;

public interface MemberDAO {

	Member selectOneMember(String userId);

	int idChk(HashMap<String, Object> hmap);

	int nickChk(HashMap<String, Object> hmap);

	int joinMember(Member member);
	
}