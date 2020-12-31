package com.kh.yourfit.member.model.dao;

import java.util.HashMap;

import com.kh.yourfit.member.model.vo.Member;

public interface MemberDAO {

	Member selectOneMember(String userId);
	
}