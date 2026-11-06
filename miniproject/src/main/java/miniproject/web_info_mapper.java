package miniproject;

import org.apache.ibatis.annotations.Mapper;

// copyright mapper

@Mapper
public interface web_info_mapper {
	web_info_DTO web_info_select();
}