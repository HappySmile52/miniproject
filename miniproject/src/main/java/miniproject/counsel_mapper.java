package miniproject;

import org.apache.ibatis.annotations.Mapper;

// 상담신청 mapper

@Mapper
public interface counsel_mapper {
	public int insert_counsel(counsel_DTO dto);	// 상담신청
}
