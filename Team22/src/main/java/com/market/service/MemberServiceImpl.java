package com.market.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.market.domain.MemberVO;
import com.market.domain.Pay_chargeVO;
import com.market.domain.ProductVO;
import com.market.domain.TradeVO;
import com.market.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO mvo;
	
	@Autowired
	JavaMailSender mailSender;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	
	@Override
	public MemberVO loginMember(MemberVO vo) {
		
		return mvo.loginMember(vo);
	}

	@Override
	public void memberJoin(MemberVO vo) {
		
		mvo.insertMember(vo);
	}

	  @Override
	    public boolean isDuplicated(String member_id) {
	        int count = mvo.getCountById(member_id);
	        return (count > 0);
	    }

	@Override
	public boolean isCopy(String member_nickname) {
		int count =mvo.getCountByNick(member_nickname);
		return (count>0);
	}

	@Override
	public List<ProductVO> memProdList(String id) throws Exception {

		return mvo.getProdList(id);
	}

	@Override
	public List<Map<String, Object>> memSellReview(String id) throws Exception {
		logger.info("@@@@@@@@@@memberSERVICE@@@@@@@@@@@@"+id);
		return mvo.memProdReview(id);
	}

	@Override
	public MemberVO memberInfo(String id) throws Exception {
		return mvo.memberInfo(id);
	}

	@Override
	public void memberInfoUpdate(MemberVO vo) throws Exception {
		mvo.memberInfoUpdate(vo);
		
	}

	@Override
	public void modifyUimage(String id, String memberPicPath) throws Exception {
		mvo.updateMemberPic(id, memberPicPath);
	}
	@Override
	public List<MemberVO> findId(String memberEmail)throws Exception{
		return mvo.findId(memberEmail);
	}
	
	@Override
	public int findIdCheck(String memberEmail)throws Exception{
		return mvo.findIdCheck(memberEmail);
	}

	@Override
	public void removeMember(MemberVO vo) throws Exception {
		mvo.memberDelete(vo);
	}
	@Override
	public List<Map<String, Object>> userInfo(String id) throws Exception {
		return mvo.userInfo(id);
	}
	
	@Override
	public Double memberScore(String id) throws Exception {
		return mvo.avgScore(id);
	}
	
	@Override
	public Integer savePayCharge(Pay_chargeVO vo)throws Exception {
		return mvo.insertPayCharge(vo);
	}

	@Override
	public Integer memberPayCharge(Pay_chargeVO vo)throws Exception{
		return mvo.memberPayCharge(vo);
	}

	@Override
	public Integer payWithdraw(Map<String,Object> vo) throws Exception {
		return mvo.payWithdraw(vo);
	}

	@Override
	public int countTrade(String id) throws Exception {
		return mvo.countTrade(id);
	}

	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {
		
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; 
		String hostSMTPid = "julunseii@gmail.com";
		String hostSMTPpwd = "gcbgnqbvvhxmviph";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "julunseii@gmail.com";
		String fromName = "있지마켓";
		String subject = "비밀번호 찾기를 위한 이메일입니다";
		String msg = "";

		if(div.equals("findPw")) {
			subject = "있지마켓 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getMember_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getMember_pass() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getMember_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setTLS(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); 
//			email.setSmtpPort(465); 
			email.setSSL(true);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(vo.getMember_email(), vo.getMember_id());
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
	}

	@Override
	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		MemberVO ck = mvo.readMember(vo.getMember_id());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		Optional<Integer> result = Optional.ofNullable(mvo.findIdCheck(vo.getMember_id()));
		if (!result.isPresent()) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getMember_email().equals(ck.getMember_email())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setMember_pass(pw);
			// 비밀번호 변경
			mvo.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findPw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}		
	}
	
}
