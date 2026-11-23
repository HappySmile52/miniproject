package miniproject;

import org.apache.ibatis.annotations.Mapper;

// 방문예약 mapper

@Mapper
public interface reservation_mapper {
	public int reserve_count(reservation_DTO dto);	// 예약 여부 확인
	
	public int insert_reserve(reservation_DTO dto);	// 방문예약 등록
}