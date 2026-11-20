package miniproject;

import org.springframework.stereotype.Repository;

import lombok.Data;

// 상담신청 DTO

@Data

@Repository("counsel_DTO")
public class counsel_DTO {
	int cidx;
	String cname, cemail, ctel;
	String crent, chouse, cdate, ccontent, cregdate;
}
