import javax.servlet.http.*;
import java.sql.*;

public class cancella_prodotto extends HttpServlet {
    
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
			Statement cmd1 = connessione.createStatement();
			
			String codice_univoco = request.getParameter("codice_univoco");
			
			String query = "select * from prodotto";
			ResultSet ris = cmd.executeQuery(query);
			
			boolean check_mark = false;
			
			while(ris.next()){	
				if(codice_univoco.equalsIgnoreCase(ris.getString("codice"))) {
					check_mark=true;
					String query1 = "DELETE FROM prodotto WHERE codice='"+codice_univoco+"'";
					cmd1.executeUpdate(query1);
					System.out.println("Prodotto rimosso");
			        request.setAttribute("Message", "Prodotto rimosso");
			        request.getRequestDispatcher("admin_prodotti_del.jsp").forward(request, response);	
			        return;
					
				}
			}
			
			if(check_mark == false) {
				request.setAttribute("errorMessage", "Codice non presente nel database");
	            request.getRequestDispatcher("admin_prodotti_del.jsp").forward(request, response);
		        return;
			}
			
	        

        }
        catch(Exception se)
        {
            se.printStackTrace();
           
        }
	
      }
  }