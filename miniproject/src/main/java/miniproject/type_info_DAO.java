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
	public List<type_info_DTO> type_info_select() {	// 매물 리스트
		List<type_info_DTO> typeList = this.st.selectList("typeinfo_select");
		return typeList;
	}
	
	@Override
	public type_info_DTO type_info_detail(int bidx) {	// 매물 상세
		type_info_DTO result = null;
		
		try {
			result = this.st.selectOne("typeinfo_detail", bidx);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
}