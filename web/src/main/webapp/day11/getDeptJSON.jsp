<%@page import="org.json.simple.JSONObject"%>
<%@page import="dao.DeptDAO"%>
<%@page import="vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 부서 정보를 담을 JSON 배열 객체 생성
    JSONArray deptArray = new JSONArray();

    DeptDAO dao = new DeptDAO();

    ArrayList<DeptVO> list = dao.selectAll();

    for(DeptVO vo : list) {
        // 부서 정보 하나가 들어간 JSONObject
        JSONObject dept = new JSONObject();
        // map 구조
        // JSONObject의 put() 메서드를 사용해 key-value 쌍으로 데이터를 추가.
        dept.put("deptno", vo.getDeptno());
        dept.put("dname", vo.getDname());
        dept.put("loc", vo.getLoc());

        // JSON 배열객체에 json object 객체를 담는다
        // 변환된 JSON 객체를 JSON 배열(deptArray)에 추가
        deptArray.add(dept);
    }
        // JSON 배열을 문자열(JSON String)로 변환해 클라이언트에 출력.
        out.println(deptArray.toJSONString());

%>