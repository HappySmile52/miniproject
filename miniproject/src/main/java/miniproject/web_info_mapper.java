package miniproject;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface web_info_mapper {
	web_info_DTO web_info(String midx);
}