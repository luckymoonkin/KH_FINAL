package com.kh.earth.member.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.dao.MemberMapper;
import com.kh.earth.member.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	

	@Override
	public Member findMemberById(String id) {
		
		return mapper.findMemberById(id);
	}

	@Override
	public Member login(String id, String password) {
		Member member = null;

		member = this.findMemberById(id);

		return member != null && 
				passwordEncoder.matches(password, member.getPassword()) ? member : null;
	}

	@Override
	@Transactional
	public int save(Member member) {
		int result = 0;
		
		if(member.getNo() != 0) {
			// update
		}else {
			// insert
			member.setPassword(passwordEncoder.encode(member.getPassword()));
			result = mapper.insertMember(member);
		}
		
		return result;

	}

	@Override
	public Boolean isDuplicateID(String userId) {
		
		return null;
	}


}
