import javax.servlet.http.*;
import java.sql.*;

public class trova_prodotto extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
	         final String db_url = "jdbc:mysql://localhost:3306/wine_bank"+"?verifyServerCertificate=true"+"&useSSL=true";
	         final String user_db = "root";
	         final String pass_db = "Calipso";
	         Connection connessione;
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connessione = DriverManager.getConnection(db_url,user_db,pass_db);
			Statement cmd = connessione.createStatement();
			
			String codice_univoco = request.getParameter("codice");
			
			String query = "select * from prodotto";
			ResultSet ris = cmd.executeQuery(query);
			
			while(ris.next()){	
				if(ris.getString("codice").equalsIgnoreCase(codice_univoco.trim())) {
					HttpSession session = request.getSession();
					session.setAttribute("code", codice_univoco);
		            request.getRequestDispatcher("admin_prodotti_edit2.jsp").forward(request, response);
			        return;
				}
			}

	        System.out.println("Prodotto non trovato nel sistema");
	        request.setAttribute("errorMessage", "presente");
	        request.getRequestDispatcher("admin_prodotti_edit.jsp").forward(request, response);	
	        return;

        }
        catch(Exception se)
        {
            se.printStackTrace();
           
        }
	
      }
  }