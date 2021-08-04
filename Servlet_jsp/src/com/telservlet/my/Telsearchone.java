package com.telservlet.my;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import telinfoDAO.TelinfoDAO;
import telinfoVO.TelinfoVO;

/**
 * Servlet implementation class Telsearchone
 */
@WebServlet("/Telsearchone")
public class Telsearchone extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Telsearchone() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		String name=request.getParameter("name");
		String kaja=null;
		TelinfoVO tv1=null;
		
		//business logic
		try {
			TelinfoDAO td1 = new TelinfoDAO();
			tv1=td1.getInfo(name); //1명에 대한 정보를 가져옴
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		//그 다음 작업은 컬렉션에 있는 것을 출력하는 것 ===> 서블릿 x view 에서
		request.setAttribute("tv1",tv1); 
		kaja="getOneinfo.jsp"; //컬렉션에 전부 들어있는 처리 결과와 함께 jsp로 경로 정해주기
		
		RequestDispatcher rd1=request.getRequestDispatcher(kaja);
		rd1.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
