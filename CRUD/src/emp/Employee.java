package emp;

public class Employee {
	private int empid;
	private String emp_name;
	private int dept;
	private String job;
	private int salary;

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public void setDept(int dept) {
		this.dept = dept;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getEmpid() {
		return empid;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public int getDept() {
		return dept;
	}

	public String getJob() {
		return job;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int getSalary() {
		return salary;
	}
}