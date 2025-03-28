package miniproject;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

@Repository("type_info_DTO")
public class type_info_DTO {
	int bidx, b_house, b_building;
	String b_title, b_add, b_part, b_info, b_date, b_date2;
	String b_img, b_str, b_company, b_present, bdate;
}