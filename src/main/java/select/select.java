package select;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBUtils.DBUtils;


public class select extends HttpServlet implements Serializable {
	private String DD;
	private String EE;
	private String CC;
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		
		try {
			conn=DBUtils.getConn();
			stat=conn.prepareStatement("select * from  person");
			rs=stat.executeQuery();
			request.setAttribute("gc", rs);
			request.setAttribute("rs", rs);
			request.getRequestDispatcher("deptManger.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn,stat,rs);
		}
	
	
	}

	public String see(String eyes){
		return "light";
	}
	
	
		
	
}
