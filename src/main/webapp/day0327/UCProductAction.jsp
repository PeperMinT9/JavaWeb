<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="study.dao.ChargerDao"%>
<%@page import="study.dto.ChargerDto"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	MultipartRequest mulRequest = null;
	// 저장할 경로
	ServletContext context = getServletContext();
	String realPath = context.getRealPath("/save");
	System.out.println(realPath);
	
	// 업로드할 사진 사이즈
	int uploadSize = 1024 * 1024 * 5; // 5mb
	
	try {
		mulRequest = new MultipartRequest(request, realPath, uploadSize, "utf-8",
				new DefaultFileRenamePolicy());
		// 데이터 읽기
		int id = Integer.parseInt(mulRequest.getParameter("id"));
		String name = mulRequest.getParameter("name");
		int max_watt = Integer.parseInt(mulRequest.getParameter("max_watt"));
		String img_src = mulRequest.getFilesystemName("img_src");
		
		System.out.println(img_src);
				
		// dao 선언
		ChargerDao dao = new ChargerDao();
		
		// update
		dao.updateCharger(id, name, max_watt, img_src);
		
		// 목록으로 이동
		response.sendRedirect("AdminPage.jsp");
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>