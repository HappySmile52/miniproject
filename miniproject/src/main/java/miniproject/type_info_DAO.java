package miniproject;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

// 금주 분양 정보 DAO

@Repository("type_info_DAO")
public class type_info_DAO implements type_info_mapper {
	@Resource(name="template")
	public SqlSessionTemplate st;
	
	@Override
	public List<type_info_DTO> type_info_select() {
		List<type_info_DTO> typeList = this.st.selectList("typeinfo_select");
		return typeList;
	}
}