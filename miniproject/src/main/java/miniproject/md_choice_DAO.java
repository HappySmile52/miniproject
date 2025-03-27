package miniproject;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("md_choice_DAO")
public class md_choice_DAO implements md_choice_mapper {
	@Resource(name="template")
	public SqlSessionTemplate st;
	
	@Override
	public List<md_choice_DTO> mdchoice_select() {
		List<md_choice_DTO> mdList = this.st.selectList("mdchoice_select");
		return mdList;
	}
}