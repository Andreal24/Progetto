import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class log_in
 */
@WebServlet("/log_in")
public class log_in extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public log_in() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		final String db_url = "jdbc:mysql://localhost:3306/wine_bank"+"?verifyServerCertificate=true"+"&useSSL=true";
		final String user_db = "root";
		final String pass_db = "Calipso";
		Connection connessione;
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connessione = DriverManager.getConnection(db_url,user_db,pass_db);
				Statement cmd = connessione.createStatement();
				String nome = request.getParameter("nome");
				String pass = request.getParameter("pass");
				String query = "select * from user";
				ResultSet ris = cmd.executeQuery(query);
				
				while(ris.next()){
					
					if((ris.getString("ID").equals(nome)) && (ris.getString("password").equals(pass)) && (ris.getString("tipologia").equals("admin"))){
									HttpSession session = request.getSession();
									session.setAttribute("ID", nome);
									request.getRequestDispatcher("/admin_dashboard.jsp").forward(request, response);
									return;
								    }
					
					else if((ris.getString("ID").equals(nome)) && (ris.getString("password").equals(pass)) && (ris.getString("tipologia").equals("responsabile"))){
						HttpSession session = request.getSession();
						session.setAttribute("ID", nome);
						request.getRequestDispatcher("/manager_dashboard.jsp").forward(request, response);
						return;
					    }
					
					else if ((ris.getString("ID").equals(nome)) && (ris.getString("password").equals(pass))){
									System.out.println("Accesso Riuscito");
									HttpSession session = request.getSession();
									session.setAttribute("ID", nome);
								    request.getRequestDispatcher("/index_logged.jsp").forward(request, response);
								    return;
									}
				}			
				   
					                
					
								
								} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (SQLException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
			System.out.println("Password sbagliata o utente non esistente");
            request.setAttribute("errorMessage", "Password errata o utente inesistente");
            request.getRequestDispatcher("/login.jsp").forward(request, response);	
            return;
            
            }
}
				