package miniproject;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

// 금주 분양 정보 mapper

@Mapper
public interface type_info_mapper {
	List<type_info_DTO> type_info_select();	// 매물 리스트
	
	type_info_DTO type_info_detail(int bidx);	// 매물 상세
}