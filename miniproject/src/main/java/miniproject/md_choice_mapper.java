package miniproject;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

// 추천 분양 정보 mapper

@Mapper
public interface md_choice_mapper {
	List<md_choice_DTO> mdchoice_select();
}