<%@page import="study.dto.ChargerPortDto"%>
<%@page import="study.dao.ChargerCertiDao"%>
<%@page import="study.dao.ChargerPortDao"%>
<%@page import="study.dao.ChargerDao"%>
<%@page import="study.dto.ChargerCertiDto"%>
<%@page import="study.dto.ChargerDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	MultipartRequest mulRequest = null;
	// 저장할 경로
	ServletContext context = getServletContext();
	String realPath = context.getRealPath("/save");
	System.out.println(realPath);
	int port_cnt = 0;
	int port_c = 0;
	int port_a = 0;
	
	int uploadSize = 1024 * 1024 * 5; // 5mb
	
	try {
		mulRequest = new MultipartRequest(request, realPath, uploadSize, "utf-8",
				new DefaultFileRenamePolicy());
		// 데이터 읽기
		String name = mulRequest.getParameter("name");
		int max_watt = Integer.parseInt(mulRequest.getParameter("max_watt"));
		String img_src = mulRequest.getFilesystemName("img_src");
		if (mulRequest.getParameter("port_cnt").equals("")) {
			port_cnt = -1;
		}
		else {
			port_cnt = Integer.parseInt(mulRequest.getParameter("port_cnt"));
		}
		if (mulRequest.getParameter("port_c").equals("")) {
			port_c = -1;
		}
		else {
			port_c = Integer.parseInt(mulRequest.getParameter("port_c"));
		}
		if (mulRequest.getParameter("port_a").equals("")) {
			port_a = -1;
		}
		else {
			port_a = Integer.parseInt(mulRequest.getParameter("port_a"));
		}
		String port_info = mulRequest.getParameter("port_info");
		String port_certi = mulRequest.getParameter("port_certi");
		
		
		// dto에 넣기
		ChargerDto dto = new ChargerDto(name, max_watt, img_src);
		// ChargerCertiDto cdto = new ChargerCertiDto();
		
		// dao 선언
		ChargerDao dao = new ChargerDao();
		
		// insert
		dao.insetCharger(dto);
		int last_inserte_idx = dao.getLastId();
		
		// 정보와 인증
		ChargerPortDao pdao = new ChargerPortDao();
		ChargerCertiDao cdao = new ChargerCertiDao();
		
		ChargerPortDto pdto = new ChargerPortDto(last_inserte_idx, port_cnt, port_c, port_a, port_info);
		ChargerCertiDto cdto = new ChargerCertiDto(last_inserte_idx, port_certi);
		
		pdao.InsertChargerPort(pdto);
		cdao.InsertChargerCerti(cdto);
		
		// 목록으로 이동
		response.sendRedirect("AdminPage.jsp");
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>