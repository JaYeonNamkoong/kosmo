package kr.co.kosmo.mvc.controller.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kosmo.mvc.dao.MemberDao;
import kr.co.kosmo.mvc.dao.BookDao;
import kr.co.kosmo.mvc.vo.ChargeMVO;
import kr.co.kosmo.mvc.vo.ItemVO;
import kr.co.kosmo.mvc.vo.LocalVO;
import kr.co.kosmo.mvc.vo.MemberVO;
import kr.co.kosmo.mvc.vo.MembershipVO;
import kr.co.kosmo.mvc.vo.BookVO;

@Service
public class BookService {
	@Autowired
	private BookDao bookdao;

	@Autowired
	private MemberDao memdao;

	// ���� ���� ����
	public LocalVO detailLocalTotal(int lid) {
		return bookdao.detailLocalTotal(lid);
	}
//=============================================================

	// add
	// ����ó�� (����+����+���������Ʈ)
	@Transactional
	public void addBookCh(BookVO bookvo, ChargeMVO chvo, String id) {
		// ����--------------------------------------------
		bookdao.addBook(bookvo);

		// ����--------------------------------------------
		bookdao.addChage(chvo);

		// ����Ʈ--------------------------------------------
		// �����Ҷ� ���� ����Ʈ �߰� => id / point �ޱ�
		MemberVO mvo = new MemberVO();
		// id
		String mid = id;
		System.out.println("���̵� : " + mid);
		mvo.setMid(mid);

		// point ���
		// �����ݾ� chvo.getChpay()
		int chpay = chvo.getChpay();
		System.out.println("�����ݾ� : " + chpay);
		// ��� �� ����Ʈ ��� 0.02~0.1
		MembershipVO mbsvo = memdao.mbsPoint(mid);
		float mbspoint = mbsvo.getMbspoint();
		System.out.println("��� �� ����Ʈ  : " + mbspoint);

		// �߰��� ����Ʈ : �����ݾ�*��޺� ����Ʈ ����
		int mpoint = (int) (chpay * mbspoint);
		System.out.println("�߰��� ����Ʈ  : " + mpoint);
		mvo.setMpoint(mpoint);

		// db�� ����
		memdao.upMPoint(mvo);
		System.out.println("=====����ƮSvc �����!=====");
	}

//=============================================================
	// update
	// ����ó�� (����+����+���������Ʈ)
	@Transactional
	public void updateBookCh(BookVO bookvo, ChargeMVO chvo, String id) {
		// ����--------------------------------------------
		bookdao.updateBook(bookvo);

		// ����--------------------------------------------
		bookdao.updateChage(chvo);

		// ����Ʈ--------------------------------------------
		// �����Ҷ� ���� ����Ʈ �߰� => id / point �ޱ�
/*		MemberVO mvo = new MemberVO();
		// id
		String mid = id;
		System.out.println("���̵� : " + mid);
		mvo.setMid(mid);

		// point ���
		// �����ݾ� chvo.getChpay()
		int chpay = chvo.getChpay();
		System.out.println("�����ݾ� : " + chpay);
		// ��� �� ����Ʈ ��� 0.02~0.1
		MembershipVO mbsvo = memdao.mbsPoint(mid);
		float mbspoint = mbsvo.getMbspoint();
		System.out.println("��� �� ����Ʈ  : " + mbspoint);

		// �߰��� ����Ʈ : �����ݾ�*��޺� ����Ʈ ����
		int mpoint = (int) (chpay * mbspoint);
		System.out.println("�߰��� ����Ʈ  : " + mpoint);
		mvo.setMpoint(mpoint);

		// db�� ����
		memdao.upMPoint(mvo);
		System.out.println("=====����ƮSvc �����!=====");
*/
	}
//=============================================================
	// �������
	public void delBook(BookVO bookvo) {
		bookdao.delBook(bookvo);
	}

//=============================================================
	// ���� ����Ʈ ��� + �ֱ�Top3 => ��� ��Ʈ�ѷ����� ���
	public List<BookVO> listBook(BookVO bookvo) {
		return bookdao.listBook(bookvo);
	}

//=============================================================
	// ���� Ƚ�� ��� => ��Ʈ ����
	public List<BookVO> tourCount(int mnum) {
		return bookdao.tourCount(mnum);
	}

//=============================================================
	// ��������Ʈ ���
	public List<BookVO> rankLocal() {
		return bookdao.rankLocal();
	}

	// ���� ����
	public List<ItemVO> detailItem(int lid) {
		return bookdao.detailItem(lid);
	}

	// ���� Ȯ��
	public int checkItem(ItemVO vo) {
		return bookdao.checkItem(vo);
	}

	// �����ϼ�
	public int getBookCnt(ItemVO vo) {
		return bookdao.getBookCnt(vo);
	}

}
