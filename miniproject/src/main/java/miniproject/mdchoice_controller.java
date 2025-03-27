package miniproject;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class main_controller {
	@Resource(name="md_choice_DTO")
	public md_choice_DTO dto;
	
	@Resource(name="md_choice_DAO")
	public md_choice_DAO dao;
	
	@GetMapping("/realty/index.do")
	public String md_choice_list(Model m) {
		List<md_choice_DTO> mdList = this.dao.mdchoice_select();
		m.addAttribute("ea", mdList.size());
		m.addAttribute("mdList", mdList);
		return null;
	}
}