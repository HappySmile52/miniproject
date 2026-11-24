package miniproject;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

// 방문예약 DAO

@Repository("reservation_DAO")
public class reservation_DAO implements reservation_mapper {
	@Resource(name="template")
	public SqlSessionTemplate st;
	
	@Override
	public int reserve_count(reservation_DTO dto) {	// 예약 여부 확인
		int result = 0;
		
		try {
			result = this.st.selectOne("reserve_count", dto);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	@Override
	public int insert_reserve(reservation_DTO dto) {	// 방문예약 등록
		int result = 0;
		
		try {
			result = this.st.insert("insert_reserve", dto);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	@Override
	public reservation_DTO reserve_detail(reservation_DTO dto) {	// 예약 확인
		reservation_DTO result = null;
		
		try {
			result = this.st.selectOne("reserve_detail", dto);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	@Override
	public List<reservation_DTO> reserve_list(String remail) {	// 내 예약 리스트
		List<reservation_DTO> result = null;
		
		try {
			result = this.st.selectList("reserve_list", remail);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	@Override
	public int reserve_delete(reservation_DTO dto) {	// 방문예약 취소
		int result = 0;
		
		try {
			result = this.st.delete("reserve_delete", dto);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
}