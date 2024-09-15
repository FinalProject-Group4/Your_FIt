package com.kh.yourfit.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.member.model.dao.MemberDAO;
import com.kh.yourfit.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public Member selectOneMember(String userId) {
		return memberDAO.selectOneMember(userId);
	}
}
