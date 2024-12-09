<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	JSONArray memberArray = new JSONArray();

	MemberDAO dao = new MemberDAO();
	
	ArrayList<MemberVO> list = dao.selectAll();
	
	for (MemberVO vo : list){
		JSONObject member = new JSONObject();
		member.put("memno", vo.getMemno());
		member.put("name", vo.getName());
		member.put("id", vo.getId());
		member.put("gender", vo.getGender());
		
		memberArray.add(member);
		
	}
	
	out.println(memberArray.toJSONString());




%>