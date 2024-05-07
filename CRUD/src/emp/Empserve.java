package emp;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Empserve")
public class Empserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Dbcon db;

	public void init() throws ServletException {
		super.init();
		db = new Dbcon();

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Employee> list = db.getAllEmp();
		request.setAttribute("ed", list);
		request.getRequestDispatcher("Employees.jsp").forward(request, response);

	}

}