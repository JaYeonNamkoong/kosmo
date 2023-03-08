package kr.co.kosmo.mvc.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.MembershipVO;

@RestController
public class MemberRestController {
	@Autowired
	private MemberDaoInter memberdao;
	
	@RequestMapping(value = "/tab1" , produces = "application/json;charset=utf-8")
	public String tab1(Model model) {
		model.addAttribute("tab", "�� 1 ����");
		return "tab";
	}

	@RequestMapping("/tab2")
	public String tab2(Model model) {
		model.addAttribute("tab", "�� 2 ����");
		return "tab";
	}

	@RequestMapping("/tab3")
	public String tab3(Model model) {
		model.addAttribute("tab", "�� 3 ����");
		return "tab";
	}
}
