package miniproject;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

// 방문예약 mapper

@Mapper
public interface reservation_mapper {
	public int reserve_count(reservation_DTO dto);	// 예약 여부 확인
	
	public int insert_reserve(reservation_DTO dto);	// 방문예약 등록
	
	public reservation_DTO reserve_detail(reservation_DTO dto);	// 예약 확인
	
	public List<reservation_DTO> reserve_list(String remail);	// 내 예약 리스트
	
	public int reserve_delete(reservation_DTO dto);	// 방문예약 취소
}