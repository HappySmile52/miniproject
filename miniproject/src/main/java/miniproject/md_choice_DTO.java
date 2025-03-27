package miniproject;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

@Repository("md_choice_DTO")
public class md_choice_DTO {
	int midx;
	String md_title, md_details, md_imgs, md_add;
}