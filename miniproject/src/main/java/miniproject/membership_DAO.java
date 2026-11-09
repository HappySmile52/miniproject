package miniproject;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

// 회원정보 DAO

@Repository("membership_DAO")
public class membership_DAO implements membership_mapper {
	@Resource(name="template")
	public SqlSessionTemplate st;
	
	@Override
	public int insert_mem(membership_DTO dto) {	// 회원가입
		int result = 0;
		
		try {
			result = this.st.insert("insert_mem", dto);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	@Override
	public String email_check(String memail) {	// 이메일 중복체크
		String result = null;
		
		try {
			result = this.st.selectOne("email_check", memail);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	@Override
	public membership_DTO login_mem(membership_DTO dto) {	// 로그인
		membership_DTO result = null;
		
		try {
			result = this.st.selectOne("login_mem", dto);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	@Override
	public String email_search(membership_DTO dto) {	// 이메일 찾기
		String result = null;
		
		try {
			result = this.st.selectOne("email_search", dto);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
}