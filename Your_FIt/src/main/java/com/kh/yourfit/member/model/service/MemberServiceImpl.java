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

	@Override
	public int idChk(String userId) {
		HashMap<String,Object> hmap = new HashMap<String, Object>();
		hmap.put("M_ID", userId);
		return memberDAO.idChk(hmap);
	}

	@Override
	public int nickChk(String userNick) {
		HashMap<String,Object> hmap = new HashMap<String, Object>();
		hmap.put("M_NICK", userNick);
		return memberDAO.nickChk(hmap);
	}

	@Override
	public int joinMember(Member member) {
		return memberDAO.joinMember(member);
	}
}
