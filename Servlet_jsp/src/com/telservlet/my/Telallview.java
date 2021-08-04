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
	
	//����۾� ����
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
		//����ġ�� try catch������ �߰�!
		
		
		//��� �� �Ǵ� ��, business logic�� �������� ��
		try {
			tidao1=new TelinfoDAO();
			alist1=tidao1.getAllInfo();
		} catch (ClassNotFoundException e) {	
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		//�� ���� �۾��� �÷��ǿ� �ִ� ���� ����ϴ� �� ===> ���� x view ����
		request.setAttribute("alist1",alist1); 
		kaja="getAllinfo.jsp"; //�÷��ǿ� ���� ����ִ� ó�� ����� �Բ� jsp�� ��� �����ֱ�
		
		//forward�� �� ��, �츮�� RequestDispatcher��� ��ü�� �̿��ϰ� �ȴ�.
		//RequestDispatcher�� �Ѱ��� ���� �ּҸ� �ְ�, �� ��ü�� ������ �ִ� forward �޼ҵ�� forward�� �����Ѵ�.

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
