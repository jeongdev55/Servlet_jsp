package com.telservlet.my;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import telinfoDAO.TelinfoDAO;
import telinfoVO.TelinfoVO;

/**
 * Servlet implementation class Telallview
 */
@WebServlet("/Telallview")
public class Telallview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	//계산작업 여기
    public Telallview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kaja=null;
		TelinfoDAO tidao1=null;
		ArrayList<TelinfoVO> alist1=null;
		
		
		//tidao1=new TelinfoDAO();
		//alist1=tidao1.getAllInfo();
		//두줄치고 try catch나오면 추가!
		
		
		//계산 및 판단 즉, business logic은 서블릿에서 함
		try {
			tidao1=new TelinfoDAO();
			alist1=tidao1.getAllInfo();
		} catch (ClassNotFoundException e) {	
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		//그 다음 작업은 컬렉션에 있는 것을 출력하는 것 ===> 서블릿 x view 에서
		request.setAttribute("alist1",alist1); 
		kaja="getAllinfo.jsp"; //컬렉션에 전부 들어있는 처리 결과와 함께 jsp로 경로 정해주기
		
		//forward를 할 때, 우리는 RequestDispatcher라는 객체를 이용하게 된다.
		//RequestDispatcher에 넘겨줄 곳의 주소를 넣고, 이 객체가 가지고 있는 forward 메소드로 forward를 수행한다.

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
