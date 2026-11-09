package miniproject;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class main_controller {	
	
	@Resource(name="md_choice_DAO")
	public md_choice_DAO md_dao;

	@Resource(name="web_info_DAO")
	public web_info_DAO web_dao;

	@Resource(name="type_info_DAO")
	public type_info_DAO type_dao;
	
	@Resource(name="membership_DAO")
	public membership_DAO mem_dao;
	
	PrintWriter pw = null;
	
	// 메인 화면
	@GetMapping("/realty/index.do")
	public String index(Model m) {
		// 추천 분양 매물 정보
		List<md_choice_DTO> mdList = this.md_dao.mdchoice_select();
		m.addAttribute("mdList", mdList);
		
		// 카피라이터
		web_info_DTO copyright = this.web_dao.web_info_select();
		m.addAttribute("copyright", copyright);
		
		// 금주 분양 매물 정보
		List<type_info_DTO> typeList = this.type_dao.type_info_select();
		m.addAttribute("typeList", typeList);
		
		return null;
	}
	
	// 로그인 화면
	@GetMapping("/realty/login.do")
	public String login(Model m) {
		
		return null;
	}
	
	// 회원가입 화면
	@GetMapping("/realty/member_join.do")
	public String member_join() {
		
		return null;
	}
	
	// 이메일 중복체크
	@PostMapping("/realty/email_ck.do")
	public String email_ck(@RequestParam(name = "memail") String memail, ServletResponse res) {
		
		try {
			this.pw = res.getWriter();
			
			String result = this.mem_dao.email_check(memail);
			// System.out.println(result);
			
			if(result == null || result.equals("0")) {
				this.pw.write("ok");
			}
			else {
				this.pw.write("no");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		// System.out.println(memail);
		
		return null;
	}
	
	// 회원가입
	@PostMapping("realty/member_joinok.do")
	public String member_joinok(membership_DTO dto, ServletResponse res) {
		res.setContentType("text/html; charset=utf-8");
		
		// 마케팅 수신 동의 미선택 시 -> N
		if(dto.getMag4() == null) {
			dto.setMag4("N");
		}
		
		try {
			this.pw = res.getWriter();
			
			int result = this.mem_dao.insert_mem(dto);
			
			if(result > 0) {
				this.pw.write("<script>alert('회원가입이 완료되었습니다.'); location.href='./login.do';</script>");
			}
			else {
				this.pw.write("<script>alert('회원가입에 실패했습니다. 다시 시도해주세요.'); history.go(-1);</script>");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	// 로그인
	@PostMapping("/realty/loginok.do")
	public String loginok(@RequestParam(name = "lemail") String lemail,
							@RequestParam(name = "lpass") String lpass,
							HttpSession session, ServletResponse res) {
		res.setContentType("text/html; charset=utf-8");
		
		membership_DTO dto = new membership_DTO();
		dto.setMemail(lemail);
		dto.setMpass(lpass);
		
		try {
			this.pw = res.getWriter();
			membership_DTO member = this.mem_dao.login_mem(dto);
			
			if(member != null) {	// 로그인 성공
				session.setAttribute("memail", member.getMemail());
				session.setAttribute("mname", member.getMname());
				session.setAttribute("mtel", member.getMtel());
				
				this.pw.write("<script>alert('" + member.getMname() + "님 환영합니다.'); location.href='./index.do';</script>");
			}
			else {
				this.pw.write("<script>alert('이메일 또는 비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	// 로그아웃
	@GetMapping("/realty/logout.do")
	public String logout(HttpSession session, ServletResponse res) {
		res.setContentType("text/html; charset=utf-8");
		session.invalidate();	// 세션 전체 삭제
		
		try {
			this.pw = res.getWriter();
			this.pw.write("<script>alert('로그아웃 되었습니다.'); location.href='./index.do';</script>");
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	// 이메일 찾기 화면
	@GetMapping("/realty/email_search.do")
	public String email_search() {
		
		return null;
	}
	
	// 이메일 찾기 결과
	@PostMapping("/realty/search_myinfo.do")
	public String search_myinfo(membership_DTO dto, Model m) {
		String memail = this.mem_dao.email_search(dto);
		m.addAttribute("memail", memail);
		
		return null;
	}
}