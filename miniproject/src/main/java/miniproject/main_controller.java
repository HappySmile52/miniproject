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
	
	@Resource(name="counsel_DAO")
	public counsel_DAO counsel_dao;
	
	@Resource(name="reservation_DAO")
	public reservation_DAO reserve_dao;
	
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
	
	// 비밀번호 찾기 화면
	@GetMapping("/realty/passwd_search.do")
	public String passwd_search() {
		
		return null;
	}
	
	// 비밀번호 찾기 (회원 확인)
	@PostMapping("/realty/search_mypass.do")
	public String search_mypass(membership_DTO dto, HttpSession session, ServletResponse res) {
		res.setContentType("text/html; charset=utf-8");
		
		String memail = this.mem_dao.passwd_search(dto);
		
		if(memail == null) {
			try {
				this.pw = res.getWriter();
				this.pw.write("<script>alert('가입하신 정보는 확인 되지 않습니다.'); history.go(-1);</script>");
			}
			catch(Exception e) {
				System.out.println(e);
			}
			
			return null;
		}
		
		// 확인된 이메일 세션 저장(비밀번호 변경 시 사용)
		session.setAttribute("pw_email", memail);
		return "realty/search_mypass";
	}
	
	// 비밀번호 변경
	@PostMapping("/realty/mypass_change.do")
	public String mypass_change(@RequestParam(name = "mpass") String mpass, HttpSession session, ServletResponse res) {
		res.setContentType("text/html; charset=utf-8");
		
		try {
			this.pw = res.getWriter();
			
			String memail = (String)session.getAttribute("pw_email");
			
			if(memail == null) {	// 회원 확인 없이 접근한 경우
				this.pw.write("<script>alert('잘못된 접근입니다.'); location.href='./passwd_search.do';</script>");
				
				return null;	
			}
			
			membership_DTO dto = new membership_DTO();
			dto.setMemail(memail);
			dto.setMpass(mpass);
			
			int result = this.mem_dao.passwd_update(dto);
			
			if(result > 0) {
				session.removeAttribute("pw_email");
				
				this.pw.write("<script>alert('비밀번호가 변경되었습니다.'); location.href='./login.do';</script>");
			}
			else {
				this.pw.write("<script>alert('비밀번호 변경에 실패했습니다.'); history.go(-1);</script>");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	// 상담신청 화면
	@GetMapping("/realty/counsel.do")
	public String counsel(HttpSession session, ServletResponse res) {
		res.setContentType("text/html;charset=utf-8");
		
		if(session.getAttribute("memail") == null) {	// 비로그인
			try {
				this.pw = res.getWriter();
				this.pw.write("<script>alert('로그인 후 이용 가능합니다.'); location.href='./login.do';</script>");
			}
			catch (Exception e) {
				System.out.println(e);
			}
			
			return null;
		}
		
		return "realty/counsel";
	}
	
	// 상담신청 처리
	@PostMapping("/realty/counselok.do")
	public String counselok(counsel_DTO dto, HttpSession session, ServletResponse res) {
		res.setContentType("text/html;charset=utf-8");
		
		try {
			this.pw = res.getWriter();
			
			if(session.getAttribute("memail") == null) {	// 세션 만료 등
				this.pw.write("<script>alert('로그인 후 이용 가능합니다.'); location.href='./login.do';</script>");
				
				return null;
			}
			
			// 상담자 정보는 세션 값으로 저장
			dto.setCname((String)session.getAttribute("mname"));
			dto.setCemail((String)session.getAttribute("memail"));
			dto.setCtel((String)session.getAttribute("mtel"));
			
			int result = this.counsel_dao.insert_counsel(dto);
			
			if(result > 0) {
				this.pw.write("<script>alert('담당자가 확인 후 해당 상담일시에 맞춰서 연락 드립니다.'); location.href='./index.do';</script>");
			}
			else {
				this.pw.write("<script>alert('상담신청에 실패했습니다. 다시 시도해주세요.'); history.go(-1);</script>");
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	// 금주분양 매물 상세
	@GetMapping("/realty/week_tails.do")
	public String week_tails(@RequestParam(name = "bidx", defaultValue = "0") int bidx,
			 HttpSession session, Model m, ServletResponse res) {
		res.setContentType("text/html;charset=utf-8");
		
		try {
			this.pw = res.getWriter();
			
			// 비로그인 (주소창 직접 접근 차단)
			if(session.getAttribute("memail") == null) {
				this.pw.write("<script>alert('로그인 후 이용 가능합니다.'); location.href='./login.do';</script>");
				
				return null;
			}
			
			// 매물 조회
			type_info_DTO tdata = this.type_dao.type_info_detail(bidx);
			
			if(tdata == null) {	// 없는 매물 번호
				this.pw.write("<script>alert('존재하지 않는 매물입니다.'); location.href='./index.do';</script>");
				
				return null;
			}
			
			m.addAttribute("tdata", tdata);
			
			// 예약 여부 확인 -> 방문 예약 / 방문 예약 완료 버튼 전환
			reservation_DTO rdto = new reservation_DTO();
			rdto.setRemail((String)session.getAttribute("memail"));
			rdto.setBidx(bidx);
			m.addAttribute("reserved", this.reserve_dao.reserve_count(rdto));
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return "realty/week_tails";
	}
	
	// 방문 예약 화면
	@GetMapping("/realty/reservation.do")
	public String reservation(@RequestParam(name = "bidx", defaultValue = "0") int bidx,
			  HttpSession session, Model m, ServletResponse res) {
		res.setContentType("text/html;charset=utf-8");
		
		try {
			this.pw = res.getWriter();
			
			if(session.getAttribute("memail") == null) {	// 비로그인
				this.pw.write("<script>alert('로그인 후 이용 가능합니다.'); location.href='./login.do';</script>");
				
				return null;
			}
			
			type_info_DTO tdata = this.type_dao.type_info_detail(bidx);
			
			if(tdata == null) {	// 없는 매물
				this.pw.write("<script>alert('존재하지 않는 매물입니다.'); location.href='./index.do';</script>");
				
				return null;
			}
			
			// 이미 예약한 매물
			reservation_DTO rdto = new reservation_DTO();
			rdto.setRemail((String)session.getAttribute("memail"));
			rdto.setBidx(bidx);
			
			if(this.reserve_dao.reserve_count(rdto) > 0) {
				this.pw.write("<script>alert('이미 방문예약한 매물입니다.'); location.href='./week_tails.do?bidx=" + bidx + "';</script>");
				
				return null;
			}
			
			m.addAttribute("tdata", tdata);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return "realty/reservation";
	}
	
	// 방문 예약 등록
	@PostMapping("/realty/reservationok.do")
	public String reservationok(reservation_DTO dto, HttpSession session, ServletResponse res) {
		res.setContentType("text/html;charset=utf-8");
		
		try {
			this.pw = res.getWriter();
			
			if(session.getAttribute("memail") == null) {	// 비로그인
				this.pw.write("<script>alert('로그인 후 이용 가능합니다.'); location.href='./login.do';</script>");
				
				return null;
			}
			
			// 방문자 정보는 세션 값으로 저장
			dto.setRemail((String)session.getAttribute("memail"));
			dto.setRname((String)session.getAttribute("mname"));
			dto.setRtel((String)session.getAttribute("mtel"));
			
			// 중복 예약 확인
			if(this.reserve_dao.reserve_count(dto) > 0) {
				this.pw.write("<script>alert('이미 방문예약한 매물입니다.'); location.href='./week_tails.do?bidx=" + dto.getBidx() + "';</script>");
				
				return null;
			}
			
			int result = this.reserve_dao.insert_reserve(dto);
			
			if(result > 0) {
				this.pw.write("<script>alert('방문예약이 등록되었습니다.'); location.href='./week_tails.do?bidx=" + dto.getBidx() + "';</script>");
			}
			else {
				this.pw.write("<script>alert('방문예약에 실패했습니다. 다시 시도해주세요.'); history.go(-1);</script>");
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	// 방문 예약 확인
	@GetMapping("/realty/reservation_check.do")
	public String reservation_check(@RequestParam(name = "bidx", defaultValue = "0") int bidx,
			HttpSession session, Model m, ServletResponse res) {
		res.setContentType("text/html;charset=utf-8");
		
		try {
			this.pw = res.getWriter();
			
			if(session.getAttribute("memail") == null) {	// 비로그인
				this.pw.write("<script>alert('로그인 후 이용 가능합니다.'); location.href='./login.do';</script>");
				
				return null;
			}
			
			// 내 예약 조회
			reservation_DTO rdto = new reservation_DTO();
			rdto.setRemail((String)session.getAttribute("memail"));
			rdto.setBidx(bidx);
			reservation_DTO rdata = this.reserve_dao.reserve_detail(rdto);
			
			if(rdata == null) {	// 예약 내역 없음
				this.pw.write("<script>alert('방문예약 내역이 없습니다.'); location.href='./index.do';</script>");
				
				return null;
			}
			
			// 아파트명 출력용 매물 정보
			type_info_DTO tdata = this.type_dao.type_info_detail(bidx);
			
			m.addAttribute("rdata", rdata);
			m.addAttribute("tdata", tdata);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return "realty/reservation_check";
	}
	
	// 방문예약 리스트
	@GetMapping("/realty/reservation_list.do")
	public String reservation_list(HttpSession session, Model m, ServletResponse res) {
		res.setContentType("text/html;charset=utf-8");
		
		try {
			this.pw = res.getWriter();
			
			if(session.getAttribute("memail") == null) {	// 비로그인
				this.pw.write("<script>alert('로그인 후 이용 가능합니다.'); location.href='./login.do';</script>");
				
				return null;
			}
			
			List<reservation_DTO> rlist = this.reserve_dao.reserve_list((String)session.getAttribute("memail"));
			m.addAttribute("rlist", rlist);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return "realty/reservation_list";
	}
}