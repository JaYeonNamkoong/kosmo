package kr.co.kosmo.mvc.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.controller.service.BookService;
import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.BookVO;
import kr.co.kosmo.mvc.vo.ChargeMVO;
import kr.co.kosmo.mvc.vo.MemberVO;
import kr.co.kosmo.mvc.vo.MembershipVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	@Autowired
	private MemberDaoInter memberdao;
	
	@Autowired
	private BookService booksvc;

	//ȸ������ : signupForm���� �̵�
	@GetMapping(value = "/signUpForm")
	public ModelAndView signUpForm() {
		ModelAndView mav = new ModelAndView("member/signUpForm");
		return mav;
	}
	//ȸ������ : Form���� �ۼ��� ������ ����  => �������� �̵�
	@PostMapping(value = "/signUpProcess")
	public String signUpProcess(MemberVO vo) {
		memberdao.addMember(vo);
		return "redirect:/main";
	}
//====================================================
	//����������
	@GetMapping(value = "/mypage")
	public ModelAndView mypage(String mid) {
		ModelAndView mav = new ModelAndView("member/mypage");
		//���+�����------------------------------------
		MembershipVO mbsvo = memberdao.memMembership(mid);
		mav.addObject("mbsvo", mbsvo);
		//--------------------------------------------
		return mav;
	}
	//���������� ������
	@GetMapping(value = "/mypageDetail" , produces = "application/json;charset=utf-8")
	public ModelAndView mypageDetail(String mid) {
		ModelAndView mav = new ModelAndView("member/mypageDetail");
		//���+�����------------------------------------
		MembershipVO mbsvo = memberdao.memMembership(mid);
		mav.addObject("mbsvo", mbsvo);
		//--------------------------------------------
		return mav;
	}
	//���ǿ��ฮ��Ʈ
	@GetMapping(value = "/UseHistoryList")
	public ModelAndView UseHistoryList(int mnum , int chk) {
		ModelAndView mav;
		//����Ʈ ��� or �ֱ��̿볻��TOP3 ��� �����ϱ� => listchk ����
		int listchk = chk;
		BookVO vo = new BookVO();
		vo.setMid(mnum);
		vo.setListchk(listchk);

		//listchk ���� �� View ���� �ٸ��� �̵�
		//System.out.println("listchk : "+listchk);
		if(listchk==1) {
			mav = new ModelAndView("member/useHistoryTop3");			
		}else{
			mav = new ModelAndView("member/useHistoryList");			
		}
		
		//������ �ֱ�
		List<BookVO> blist = booksvc.listBook(vo);
		mav.addObject("blist", blist);
		//System.out.println(blist.size());
		
		return mav;
	}

	//���������� ��Ʈ
	@GetMapping(value = "/mypageChart")
	public ModelAndView mypageChart(String mid) {
		ModelAndView mav = new ModelAndView("member/mypageChart");
		//���+�����------------------------------------
		MembershipVO mbsvo = memberdao.memMembership(mid);
		mav.addObject("mbsvo", mbsvo);
		//--------------------------------------------
		return mav;
	}	
	
	
	
	//���������� �� Ķ����
	@GetMapping(value = "/mypageTest")
	public ModelAndView mypageTest() {
		ModelAndView mav = new ModelAndView("member/mypage_Test");
		return mav;
	}
	
	
//====================================================
	//ȸ������ : ȸ������Form���� �̵�
	@GetMapping(value = "/upmemForm")
	public ModelAndView upmemForm() {
		ModelAndView mav = new ModelAndView("member/upmemForm");
		return mav;
	}
	//ȸ������ : ȸ������Form���� �ۼ��� ������ ����  => �������� �̵�
	@PostMapping(value = "/updateProcess")
	public String updateProcess(MemberVO vo) {
		memberdao.upMember(vo);
		return "redirect:/main";
	}
//====================================================
	//ȸ��Ż�� : ȸ������ �� main���� �̵�
	@GetMapping(value = "/delmem")
	public String delMember(String mid , HttpSession session) {
		memberdao.delMember(mid);
		//����� ���� ����
		session.removeAttribute("sessionNum");
		session.removeAttribute("sessionID");
		session.removeAttribute("sessionName");
		return "redirect:/main";
	}
}
