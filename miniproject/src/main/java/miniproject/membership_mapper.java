package miniproject;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

// 회원정보 mapper

@Mapper
public interface membership_mapper {
	public String email_check(String memail);	// 이메일 중복체크
	
	public int insert_mem(membership_DTO dto);	// 회원가입
}