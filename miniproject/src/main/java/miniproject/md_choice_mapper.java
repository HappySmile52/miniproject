package miniproject;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

// 추천 분양 정보 mapper

@Mapper
public interface md_choice_mapper {
	List<md_choice_DTO> mdchoice_select();	// 리스트 출력
	
	public int mdchoice_insert(md_choice_DTO dto);	// 게시판 글쓰기
	
	public int board_count(String search);	// 게시판 전체 글 수 (검색 포함)
	
	public List<md_choice_DTO> board_list(Map<String, Object> map);	// 게시판 리스트 출력 (검색 + 페이징)
}