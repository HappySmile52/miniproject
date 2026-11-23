package miniproject;

import org.springframework.stereotype.Repository;

import lombok.Data;

// 방문예약 DTO

@Data

@Repository("reservation_DTO")
public class reservation_DTO {
	int ridx, bidx, rcount;
	String remail, rname, rtel, rdate, rtime, rregdate;
}