package com.koreaIT.java.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

import com.koreaIT.java.am.config.Config;
import com.koreaIT.java.am.util.DBUtil;
import com.koreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/member/doLogin")
public class MemberDoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		Connection conn = null;
		
		try {
			Class.forName(Config.getDBDriverName());
			String url = Config.getDBUrl();
			
			conn = DriverManager.getConnection(url, Config.getDBUser(), Config.getDBPw());
			
			String loginId = request.getParameter("loginId");
			String loginPw = request.getParameter("loginPw");

			SecSql sql = new SecSql();
			sql.append("SELECT * FROM `member`");
			sql.append("WHERE loginId = ?", loginId);

			Map<String, Object> memberRow = DBUtil.selectRow(conn, sql); 
			
			if (memberRow.isEmpty()) {				
				response.getWriter().append(String.format("<script>alert('존재하지 않는 회원입니다.'); location.replace('../home/login')</script>"));
				return;
			}
			
			if (!memberRow.get("loginPw").equals(loginPw)) {				
				response.getWriter().append(String.format("<script>alert('비밀번호를 확인해주세요'); location.replace('../home/login')</script>"));
				return;
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("loginedMemberId", memberRow.get("id"));
			
			response.getWriter().append(String.format("<script>alert('로그인 성공'); location.replace('../home/main')</script>"));
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("에러: " + e);
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
