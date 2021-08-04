package fromtController.wooricom.main;

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
 * Servlet implementation class SawonFrontController
 */
@WebServlet("*.do")  //.do�� ������ ��� ���⸦ ã�ƿ�
public class SawonFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SawonFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// System.out.println(request.getRequestURI()); // /Servlet_jsp_version3/getAllinfo.do
		
		// System.out.println(request.getContextPath()); // /Servlet_jsp_version3
		
		String c=request.getRequestURI().substring(request.getContextPath().length());
		//���ڿ� �ڸ��� �ᱹ getAllInfo.do �� ��
		
		String str=null;
		switch(c) {
		
		//��� ��� ����
		case "/getAllinfo.do":
			TelinfoDAO tidao1=null;
			try {
				tidao1=new TelinfoDAO();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			ArrayList<TelinfoVO> alist1=null;
			try {
				alist1=tidao1.getAllInfo();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("alist1", alist1);
			str="getAllinfo.jsp";
			break;
			
			
		// ��� �߰�
		case "/sawonInsertForm.do":
			String sabun=request.getParameter("sabun");
			int sabun1=Integer.parseInt(sabun);
			String name1=request.getParameter("irum");
			String tel1=request.getParameter("tel");
			String date1=request.getParameter("date");
			
			TelinfoDAO tidao2=null;
			try {
				tidao2=new TelinfoDAO();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			tidao2.insertInfo(sabun1, name1, tel1, date1);
			str="getAllinfo.jsp";
			break;
			
		case "/sawonSearchOne.do":
			TelinfoDAO tidao3=null;
			TelinfoVO tv1=null;
			
			try {
				tidao3=new TelinfoDAO();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			String name=request.getParameter("name");
			try {
				tv1=tidao3.getInfo(name);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("sname",name); //�̸��� �ѱ������ �Ӽ�
			request.setAttribute("stv",tv1);	//�ѻ�� ��ü ������
			str="sawonUpdateForm.jsp";
			break;	
			
		case "/sawonUpdate.do":
			TelinfoDAO tidao4 =null;
			TelinfoVO tv2 =null;
			
			int id2=Integer.parseInt(request.getParameter("id"));
			String name2=request.getParameter("name");
			String tel2=request.getParameter("tel");
			String d2=request.getParameter("d");
			
			String sname=request.getParameter("sname");
			
			try {
				tidao4=new TelinfoDAO();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			tidao4.update_nametel(id2, name2, tel2, d2, sname);
			// ���δ� update�ϴ� �޼ҵ�
			
			str="getAllinfo.jsp";
			break;
			
		case "/sawonDelete.do":
			TelinfoDAO tidao5 =null;
			TelinfoVO tv3=null;
			String name3=request.getParameter("name");
			
			try {
				tidao5=new TelinfoDAO();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			tidao5.deleteInfo("name3");
			str="getAllinfo.jsp";
			break;
			
			
			
		} //switch-end
		
		
		
		RequestDispatcher rd1=request.getRequestDispatcher(str);
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
