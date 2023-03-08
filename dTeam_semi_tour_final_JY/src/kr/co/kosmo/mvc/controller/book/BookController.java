package kr.co.kosmo.mvc.controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.controller.service.BookService;
import kr.co.kosmo.mvc.vo.ChargeMVO;
import kr.co.kosmo.mvc.vo.LocalVO;
import kr.co.kosmo.mvc.vo.BookVO;

@Controller
@RequestMapping(value = "/book")
public class BookController {
	@Autowired
	private BookService booksvc;

	// 예약폼으로 이동
	@GetMapping(value = "/bookForm")
	public ModelAndView bookForm(int lid) {
		ModelAndView mav = new ModelAndView("book/bookForm");
		LocalVO lvo = booksvc.detailLocalTotal(lid);
		mav.addObject("vo", lvo);
		return mav;
	}

	// 예약 insert
	// 예약 + 결제 (+멤버십포인트)
	@PostMapping(value = "/bookProcess")
	public String reservProcess(BookVO bookvo, ChargeMVO chvo, HttpServletRequest request, HttpSession session) {
		String mid = (String) session.getAttribute("sessionID");

		//System.out.println("index" + request.getParameter("index"));
		int index = Integer.parseInt(request.getParameter("index"));
		char itype = 'A';

		for (int i = 0; i <= index; i++) {
			if (i == index) {
				bookvo.setItype(String.valueOf(itype));
			}
			itype++;
		}
		booksvc.addBookCh(bookvo, chvo, mid);
		return "redirect:/main";
	}
//====================================================
	// 예약 수정폼으로 이동
	@GetMapping(value = "/bookUpdateForm")
	public ModelAndView bookUpdateForm(BookVO bookvo) {
		ModelAndView mav = new ModelAndView("book/bookUpdateForm");
		//LocalVO lvo = booksvc.detailLocalTotal(lid);
		//mav.addObject("vo", lvo);
		return mav;
	}
	// 예약 수정 : 예약수정 및 결제수정 + 캘린더로 이동
	@GetMapping(value = "/bookUpdate")
	public String bookUpdate(BookVO bookvo, ChargeMVO chvo, HttpServletRequest request, HttpSession session) {
		String mid = (String) session.getAttribute("sessionID");

		System.out.println("index" + request.getParameter("index"));
		int index = Integer.parseInt(request.getParameter("index"));
		char itype = 'A';

		for (int i = 0; i <= index; i++) {
			if (i == index) {
				bookvo.setItype(String.valueOf(itype));
			}
			itype++;
		}

		booksvc.updateBookCh(bookvo, chvo, mid);
		return "redirect:/calendar/calendarList";
	}
//====================================================
	// 예약 취소 : 예약취소 및 캘린더로 이동 + 결제내역도 같이 삭제됨
	@GetMapping(value = "/delBook")
	public String delBook(BookVO bookvo) {
		booksvc.delBook(bookvo);
		return "redirect:/calendar/calendarList";
	}
}
