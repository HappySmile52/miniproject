package miniproject;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("web_info_DAO")
public class web_info_DAO implements web_info_mapper {
	@Resource(name="template")
	public SqlSessionTemplate st;
	
	@Override
	public web_info_DTO web_info_select() {
		web_info_DTO copyright = this.st.selectOne("webinfo_select");
		return copyright;
	}
}
