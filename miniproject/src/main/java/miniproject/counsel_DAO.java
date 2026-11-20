package miniproject;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

// 상담신청 DAO

@Repository("counsel_DAO")
public class counsel_DAO implements counsel_mapper {
	@Resource(name="template")
	public SqlSessionTemplate st;
	
	@Override
	public int insert_counsel(counsel_DTO dto) {	// 상담신청
		int result = 0;
		
		try {
			result = this.st.insert("insert_counsel", dto);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
}
