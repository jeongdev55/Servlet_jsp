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
 * Servlet implementation class Telupdate
 */
@WebServlet("/Telupdate")
public class Telupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Telupdate() {
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
		
		//��ü�÷� ������ ����, �׷��Ƿ� �� �Ѱܹ���
		
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		String d=request.getParameter("d");
		
		
		String name2=request.getParameter("name2"); //���� �Ѱܹ��� �̸�
		
		
		//business logic
		try {
			td1 = new TelinfoDAO();
		} catch (ClassNotFoundException e) {	
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//System.out.println(name2); 
		Boolean b=td1.update_nametel(id, name, tel, d, name2); //name2 ���ǿ� ���ؼ� 4���� update
		if(b) {
			request.setAttribute("result1","����good");
		}
		else {
			request.setAttribute("result1","��������");
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
