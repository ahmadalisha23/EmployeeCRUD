package emp;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/crudserve")
public class crudserve extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Dbcon db;

	public crudserve() {
		super();
		db = new Dbcon();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String val = request.getParameter("action");
		if (val != null) {
			try {
				switch (val) {
				case "add":
					addEmployee(request, response);
					break;
				case "update":
					updateEmployee(request, response);
					break;
				case "delete":
					deleteEmployee(request, response);
					break;
				case "next":
					nextEmployee(request, response);
					break;
				case "previous":
					previousEmployee(request, response);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void nextEmployee(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.getRequestDispatcher("Employees.jsp").forward(request, response);

	}

	private void previousEmployee(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.getRequestDispatcher("Employees.jsp").forward(request, response);

	}

	private void addEmployee(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {
		String name = request.getParameter("Empname");
		int id = Integer.parseInt(request.getParameter("Empid"));
		String job = request.getParameter("job");
		int department = Integer.parseInt(request.getParameter("Department"));
		int salary = Integer.parseInt(request.getParameter("Sal"));
		db.add(id, name, job, department, salary);

		response.sendRedirect("Empserve");
	}

	private void updateEmployee(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {
		int id = Integer.parseInt(request.getParameter("Empid"));
		String name = request.getParameter("Empname");
		String job = request.getParameter("job");
		int department = Integer.parseInt(request.getParameter("Department"));
		int salary = Integer.parseInt(request.getParameter("Sal"));

		db.update(id, name, job, department, salary);

		response.sendRedirect("Empserve");

	}

	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {
		int id = Integer.parseInt(request.getParameter("Empid"));
		System.out.println("Hi");
		db.delete(id);
		System.out.println("Hi");
		response.sendRedirect("Empserve");
	}

}