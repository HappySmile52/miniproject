package miniproject;

import org.springframework.stereotype.Repository;

import lombok.Data;

// 회원정보 DTO

@Data

@Repository("membership_DTO")
public class membership_DTO {
	int midx;
	String memail, mpass, mname, mtel;
	String mag1, mag2, mag3, mag4, mdate;
}