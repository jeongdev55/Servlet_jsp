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
 * Servlet implementation class Telinsert
 */
@WebServlet("/Telinsert")
public class Telinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Telinsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		TelinfoDAO td1=null;
		
		try {
			td1=new TelinfoDAO();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		String d=request.getParameter("d");
		
		Boolean b=td1.insertInfo(id, name, tel, d);
		
		if(b) {
			request.setAttribute("result1","입력good");
		}
		else {
			request.setAttribute("result1","입력오류");
		}
		
		RequestDispatcher rd1=request.getRequestDispatcher("result.jsp");
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
