package miniproject;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class main_controller {
	@Resource(name="md_choice_DTO")
	public md_choice_DTO md_dto;
	
	@Resource(name="md_choice_DAO")
	public md_choice_DAO md_dao;
	
	@Resource(name="web_info_DTO")
	public web_info_DTO web_dto;
	
	@Resource(name="web_info_DAO")
	public web_info_DAO web_dao;
	
	@GetMapping("/realty/index.do")
	public String index(Model m) {
		List<md_choice_DTO> mdList = this.md_dao.mdchoice_select();
		m.addAttribute("mdList", mdList);
		
		web_info_DTO copyright = this.web_dao.web_info_select();
		m.addAttribute("copyright", copyright);
		
		return null;
	}
}