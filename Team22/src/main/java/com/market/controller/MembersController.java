package com.market.controller;

import java.io.File;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.util.UploadFileUtils;
import com.market.domain.MemberVO;
import com.market.domain.ProductVO;
import com.market.service.MemberService;


@Controller
@RequestMapping(value = "/members")
public class MembersController {
	
	
	@Inject
	private MemberService service;

	@Inject
	@Named("uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(MembersController.class);
	
	//http://localhost:8080/main
	
	// 로그인 - 정보입력
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() {
		
		return "/members/loginForm";
	}
	// 로그인 - 정보처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpSession session, MemberVO vo) {
		
		MemberVO result = service.loginMember(vo);
		
		if(result != null) {
			session.setAttribute("id", result.getMember_id());
			
			return "redirect:/main";
		}else {
			return "redirect:/members/login";
		}
		
	}
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutGET(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main";
	}
	// 마이페이지
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPageGET(Model model, HttpSession session)throws Exception{
		String id = (String)session.getAttribute("id");
	
		model.addAttribute("memberInfo",service.memberInfo(id));
		return "/members/myPage";
	}
	

	// 회원가입-정보입력
	@RequestMapping(value = "/insert", method=RequestMethod.GET)
	public String insertGET() {
		logger.info("insertGET() 호출");
		logger.info(" /insert 주소에 연결된 view페이지(./members/insertForm.jsp)�� �̵� ");
		return "/members/insertForm";
	}
	// 회원가입-정보처리
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insertPOST(MemberVO vo,MultipartFile file)throws Exception {
		logger.info("insertPOST() 호출");
		logger.info(vo+"toString");
	
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setMember_pic(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

		service.memberJoin(vo);
		
		return "redirect:/members/login";
				
	}

	// 아이디 중복체크
    @RequestMapping(value="/idCheck")
    @ResponseBody
    public boolean idCheck(@RequestBody String member_id) throws Exception {
        return service.isDuplicated(member_id);
    }
    
    // 닉네임 중복체크 
    @RequestMapping(value="/nickCheck")
    @ResponseBody
    public boolean nickCheck(@RequestBody String member_nickname) throws Exception{
    	return service.isCopy(member_nickname);
    }
    
    // 다른 회원 판매 목록
    @RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
    public String memberInfoGET(Model model, HttpServletRequest request) throws Exception {
    	String id =  request.getParameter("mem_id");
    	List<ProductVO> memProdList = service.memProdList(id);
		model.addAttribute("memProdList",memProdList);
    	return "/members/memberInfo";
    }
    // 다른 회원 리뷰 목록
    @RequestMapping(value = "/review", method = RequestMethod.GET)
    public String memberReviewGET(Model model,HttpServletRequest request) throws Exception {
    	String id =  request.getParameter("mem_id");
    	List<Map<String,Object>> memReview = service.memSellReview(id);
    	model.addAttribute("memReview",memReview);
    	return "/members/memReview";
    }
    
    // 회원 정보 수정 페이지
    @RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
    public String memberUpdateGET(HttpSession session,Model model) throws Exception {
    	String id = (String)session.getAttribute("id");
    	
    	model.addAttribute("memberInfo",service.memberInfo(id));
    	
    	if (id == null) {
    		return "redirect:/members/login";
    	}
    	
    	return "/members/updateForm";
    }
    
    // 회원 정보 수정 입력
    @RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
    public String memberUpdatePOST(MemberVO vo, MultipartFile file, HttpServletRequest req,RedirectAttributes rttr) throws Exception {
    	
    	
    	logger.info("@@@@@@@@@@@@@@memberUpdate"+vo);
    	File convFile = new File(file.getOriginalFilename());
    	file.transferTo(convFile);

    	
    	 // 새로운 파일이 등록되었는지 확인
    	 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
    	  // 기존 파일을 삭제
    	  new File(uploadPath + req.getParameter("member_pic")).delete();
    	  
    	  // 새로 첨부한 파일을 등록
    	  String imgUploadPath = uploadPath + File.separator + "imgUpload";
    	  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
    	  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
    	  
    	  vo.setMember_pic(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

    	 } else {  // 새로운 파일이 등록되지 않았다면
    	  // 기존 이미지를 그대로 사용
    	  vo.setMember_pic(req.getParameter("member_pic"));
    	  
    	  
    	 }
    	 
    	 rttr.addFlashAttribute("update","update");
    	 service.memberInfoUpdate(vo);
    	 
    	
    	return "redirect:/members/myPage";
    		
    }
    
    
    
    
}
