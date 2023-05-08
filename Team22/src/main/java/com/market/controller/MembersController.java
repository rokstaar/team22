package com.market.controller;

import java.io.File;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.itwillbs.util.JsonParser;
import com.itwillbs.util.NaverLoginBO;
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
	
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	
	@Inject 
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO; 
	}
	 
	private static final Logger logger = LoggerFactory.getLogger(MembersController.class);
	
	//http://localhost:8080/main
	
	// 로그인  + 간편 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(Model model, HttpSession session) {
		
		// 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		logger.info("네이버 : " + naverAuthUrl);
		
		model.addAttribute("naverurl", naverAuthUrl);
 
        /* 생성한 인증 URL을 View로 전달 */
		return "/members/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(Model model, HttpSession session,
				MemberVO vo ) {
		  
		if(service.loginMember(vo) != null) { 
			session.setAttribute("id", vo.getMember_id()); 
			} 
		else { service.memberJoin(vo);
			session.setAttribute("id", vo.getMember_id()); 
		}
		
		return "redirect:/main";
	}
	
	// 네이버 로그인 성공시 callback 호출 
	@RequestMapping(value = "callback", method = { RequestMethod.GET,RequestMethod.POST })
	public String callbackNaver(Model model, HttpSession session, MemberVO vo, 
								@RequestParam String code, @RequestParam String state) throws Exception {
	  
		logger.info("로그인 성공 callbackNaver");
		JsonParser json = new JsonParser();
		  
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		  
		// 로그인 사용자 정보를 읽어옴
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		  
		vo = json.changeJson(apiResult);
		  
		logger.info("apiResult {}",apiResult);
		  
		if(service.loginMember(vo) != null) { 
			session.setAttribute("id", vo.getMember_id());
		} else{ 
			service.memberJoin(vo);
			session.setAttribute("id", vo.getMember_id());
		}
	
		model.addAttribute("result", apiResult);
		  
		return "redirect:/main";
		 
	}
	 
	// 로그아웃
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
	
	// �쉶�썝媛��엯-�젙蹂댁엯�젰
	@RequestMapping(value = "/insert", method=RequestMethod.GET)
	public String insertGET() {
		logger.info("insertGET() �샇異�");
		return "/members/insertForm";
	}
	
	// �쉶�썝媛��엯-�젙蹂댁쿂由�
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insertPOST(MemberVO vo,MultipartFile file,RedirectAttributes rttr)throws Exception {
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
		rttr.addFlashAttribute("result","O");
		
		service.memberJoin(vo);
		
		return "redirect:/members/login";
				
	}

	// �븘�씠�뵒 以묐났泥댄겕
    @RequestMapping(value="/idCheck")
    @ResponseBody
    public boolean idCheck(@RequestBody String member_id) throws Exception {
        return service.isDuplicated(member_id);
    }
    
    // �땳�꽕�엫 以묐났泥댄겕 
    @RequestMapping(value="/nickCheck")
    @ResponseBody
    public boolean nickCheck(@RequestBody String member_nickname) throws Exception{
    	return service.isCopy(member_nickname);
    }
    
    // �떎瑜� �쉶�썝 �뙋留� 紐⑸줉
    @RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
    public String memberInfoGET(Model model, HttpServletRequest request) throws Exception {
    	String id =  request.getParameter("mem_id");
    	List<ProductVO> memProdList = service.memProdList(id);
		model.addAttribute("memProdList",memProdList);
    	return "/members/memberInfo";
    }
    
    // �떎瑜� �쉶�썝 由щ럭 紐⑸줉
    @RequestMapping(value = "/review", method = RequestMethod.GET)
    public String memberReviewGET(Model model,HttpServletRequest request) throws Exception {
    	String id =  request.getParameter("mem_id");
    	List<Map<String,Object>> memReview = service.memSellReview(id);
    	model.addAttribute("memReview",memReview);
    	return "/members/memReview";
    }
    
    // �쉶�썝 �젙蹂� �닔�젙 �럹�씠吏�
    @RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
    public String memberUpdateGET(HttpSession session,Model model) throws Exception {
    	String id = (String)session.getAttribute("id");
    	
    	model.addAttribute("memberInfo",service.memberInfo(id));
    	
    	if (id == null) {
    		return "redirect:/members/login";
    	}
    	
    	return "/members/updateForm";
    }
    
    // �쉶�썝 �젙蹂� �닔�젙 �엯�젰
    @RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
    public String memberUpdatePOST(MemberVO vo, MultipartFile file, HttpServletRequest req,RedirectAttributes rttr) throws Exception {
    	
    	
    	logger.info("@@@@@@@@@@@@@@memberUpdate"+vo);
    	File convFile = new File(file.getOriginalFilename());
    	file.transferTo(convFile);

    	
    	 // �깉濡쒖슫 �뙆�씪�씠 �벑濡앸릺�뿀�뒗吏� �솗�씤
    	 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
    	  // 湲곗〈 �뙆�씪�쓣 �궘�젣
    	  new File(uploadPath + req.getParameter("member_pic")).delete();
    	  
    	  // �깉濡� 泥⑤��븳 �뙆�씪�쓣 �벑濡�
    	  String imgUploadPath = uploadPath + File.separator + "imgUpload";
    	  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
    	  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
    	  
    	  vo.setMember_pic(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

    	 } else {  // �깉濡쒖슫 �뙆�씪�씠 �벑濡앸릺吏� �븡�븯�떎硫�
    	  // 湲곗〈 �씠誘몄�瑜� 洹몃�濡� �궗�슜
    	  vo.setMember_pic(req.getParameter("member_pic"));
    	  
    	 }
    	 
    	 rttr.addFlashAttribute("update","update");
    	 service.memberInfoUpdate(vo);
    	 
    	
    	return "redirect:/members/myPage";
    		
    }
    
    // 占쎈툡占쎌뵠占쎈탵 筌≪뼐由�
    @RequestMapping(value="/findIdView", method=RequestMethod.GET)
	public String findIdView() throws Exception{
		return"/members/findIdView";
	}
	
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public String findId(MemberVO memberVO,Model model) throws Exception{
		logger.info("memberEmail"+memberVO.getMember_email());
				
		if(service.findIdCheck(memberVO.getMember_email())==0) {
		model.addAttribute("msg", "占쎌뵠筌롫뗄�뵬占쎌뱽 占쎌넇占쎌뵥占쎈퉸雅뚯눘苑�占쎌뒄");
		return "/members/findIdView";
		}else {
		model.addAttribute("member", service.findId(memberVO.getMember_email()));
		return "/members/findId";
				
		}
	}
	
	@RequestMapping(value="/pay", method=RequestMethod.GET)
	public String payGET(HttpSession session,Model model,MemberVO vo) throws Exception{
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("memberInfo",service.memberInfo(id));
		
//		MemberVO result = service.loginMember(vo);
		model.addAttribute("id",id);
//		model.addAttribute("result",result);
		
//		model.addAttribute("memberInfo", service.memberInfo(id));
		
			return "/members/pay";
	}
	
	@RequestMapping(value="/pay", method=RequestMethod.POST)
	public String payPOST(@ModelAttribute("memberInfo") MemberVO vo) throws Exception{
		logger.info("@@@@@@@@@@@@@@@@@@@"+vo);
//		model.addAttribute("memberInfo", service.memberInfo(id));
		
		return "/members/pay";
	}
    
	@RequestMapping(value = "/updatePwCk", method = RequestMethod.GET)
    public String updatePwCkGET() {
    	return "/members/updatePwCk";
    }
	
	@RequestMapping(value = "/updatePwCk", method = RequestMethod.POST)
	public String updatePwCkPOST(Model model,@RequestParam("member_pass") String member_pass,
					@RequestParam("member_id")String id,RedirectAttributes rttr)throws Exception {
			MemberVO vo = service.memberInfo(id);
			
			if(vo == null || !vo.getMember_pass().equals(member_pass)) {
				return "/members/updatePwCk";
			}else {
				rttr.addFlashAttribute("result","O");
				return "redirect:/members/memberUpdate";
			}
		 
	}
	
	@RequestMapping(value = "/deletePwCk", method = RequestMethod.GET)
    public String deletePwCkGET() {
		
    	return "/members/deletePwCk";
    }
	
	@RequestMapping(value = "/deletePwCk", method = RequestMethod.POST)
	public String deletePwCkPOST(Model model,@RequestParam("member_pass") String member_pass,
					@RequestParam("member_id")String id,RedirectAttributes rttr)throws Exception {
			MemberVO vo = service.memberInfo(id);
			if(vo == null || !vo.getMember_pass().equals(member_pass)) {
				return "/members/deletePwCk";
			}else {
				rttr.addFlashAttribute("result","O");
				return "redirect:/members/remove";
			}
			
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String removeGET(HttpSession session,Model model) throws Exception{
		
		String id = (String)session.getAttribute("id");
    	
    	model.addAttribute("memberInfo",service.memberInfo(id));
    	
	    	if (id == null) {
	    		return "redirect:/members/login";
	    	}
			
			return "/members/removeForm";
		}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePOST(RedirectAttributes rttr,
							@RequestParam("member_id")String id,
							@RequestParam("member_pass") String member_pass,
							Model model,HttpSession session) throws Exception{
		
		MemberVO vo = service.memberInfo(id);
		logger.info("@@@@@@@@@@@@@@memberdelete"+vo);
		
		if(vo == null || !vo.getMember_pass().equals(member_pass)) {
			model.addAttribute("memberInfo", vo) ;
			rttr.addFlashAttribute("result",false);
			return "/members/removeForm";
		}else {
			service.removeMember(vo);
			session.invalidate();
			rttr.addFlashAttribute("result","delete");
			return "redirect:/main";
		}
    	 
    	
	}
	
	
}
