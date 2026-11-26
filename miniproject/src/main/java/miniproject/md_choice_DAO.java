package miniproject;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

// 추천 분양 정보 DAO

@Repository("md_choice_DAO")
public class md_choice_DAO implements md_choice_mapper {
	@Resource(name="template")
	public SqlSessionTemplate st;
	
	@Override
	public List<md_choice_DTO> mdchoice_select() {	// 리스트 출력
		List<md_choice_DTO> mdList = this.st.selectList("mdchoice_select");
		return mdList;
	}
	
	@Override
	public int mdchoice_insert(md_choice_DTO dto) {	// 게시판 글쓰기
		int result = 0;
		
		try {
			result = this.st.insert("mdchoice_insert", dto);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	@Override
	public int board_count() {	// 게시판 전체 글 수
		int result = 0;
		
		try {
			result = this.st.selectOne("board_count");
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	@Override
	public List<md_choice_DTO> board_list(Map<String, Object> map) {	// 게시판 리스트 출력(페이징 포함)
		List<md_choice_DTO> result = null;
		
		try {
			result = this.st.selectList("board_list", map);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
}