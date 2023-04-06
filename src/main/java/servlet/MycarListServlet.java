package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.dao.day0322_carDao;
import study.dto.day0322_carDto;

/**
 * Servlet implementation class MycarListServlet
 */
@WebServlet("/mycar/list")
public class MycarListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		day0322_carDao dao = new day0322_carDao();
		List<day0322_carDto> list = dao.getAllCars();
		
		request.setAttribute("list", list);
		request.setAttribute("count", list.size());
		
		RequestDispatcher rd = request.getRequestDispatcher("../day0404_jstl/carlist.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
