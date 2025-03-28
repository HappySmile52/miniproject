package miniproject;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface type_info_mapper {
	List<type_info_DTO> type_info_select();
}