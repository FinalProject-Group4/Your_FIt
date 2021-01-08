package com.kh.yourfit.member.model.service;

import com.kh.yourfit.member.model.vo.Member;

public interface MemberService {

	Member selectOneMember(String userId);

	int idChk(String userId);

	int nickChk(String userNick);

	int joinMember(Member member);

}
