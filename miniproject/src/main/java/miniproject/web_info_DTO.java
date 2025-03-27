package miniproject;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

@Repository("web_info_DTO")
public class web_info_DTO {
	String web_company, web_ceo, web_add, web_num;
	String web_sales, web_inc, web_tel, web_fax;
}