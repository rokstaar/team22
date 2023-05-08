package com.itwillbs.util;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.market.domain.MemberVO;

public class JsonParser {
	
	private static final Logger logger = LoggerFactory.getLogger(JsonParser.class);
	
	public MemberVO changeJson(String string) throws Exception {

		HashMap<String, Object> map = new HashMap<>();
		JSONParser jsonParser = new JSONParser();
		MemberVO vo = new MemberVO();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(string);

		jsonObject = (JSONObject) jsonObject.get("response");

		map.put("member_email", jsonObject.get("email"));
		map.put("member_name", jsonObject.get("name"));
		map.put("member_phone", jsonObject.get("mobile"));
		
		// N_로 구분 하고 이메일 주소 @앞 아이디만 가져와서 naverId에 저장
		// 임시 비밀번호 지정
		String naverId = "N_" + (String) map.get("member_email").toString().split("@")[0];
		String naverPw = "1234";

		// vo에 넣기
		vo.setMember_id(naverId);
		vo.setMember_pass(naverPw);
		vo.setMember_name(map.get("member_name").toString());
		vo.setMember_email(map.get("member_email").toString());
		vo.setMember_phone(map.get("member_phone").toString());
		
		logger.info("json vo : " + vo);
		
		return vo;
	}

}
