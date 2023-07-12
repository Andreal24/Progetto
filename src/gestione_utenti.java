import javax.servlet.http.*;
import java.sql.*;

public class gestione_utenti extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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
			
			String username = request.getParameter("username");
			
			String query = "SELECT * FROM user";
			String del_query = null;
			
			ResultSet list = cmd.executeQuery(query);
			
			while(list.next()) {
				if(username.equalsIgnoreCase(list.getString("ID"))) {
					if(list.getString("tipologia").equalsIgnoreCase("admin")||list.getString("tipologia").equalsIgnoreCase("responsabile")) {
						request.setAttribute("errMessage1", "Prodotto cancellato dal carrello");
			            request.getRequestDispatcher("admin_utenti.jsp").forward(request, response);
				        return;
					}
					del_query = "DELETE FROM carrello WHERE nome_vino='"+username+"'";
					cmd1.executeUpdate(del_query);
					request.setAttribute("Message", "Utente cancellato correttamente");
		            request.getRequestDispatcher("admin_utenti.jsp").forward(request, response);
			        return;
				}
			}

			request.setAttribute("errMessage", "Username non trovato");
            request.getRequestDispatcher("admin_utenti.jsp").forward(request, response);
	        return;

        }
        catch(Exception se)
        {
            se.printStackTrace();
           
        }
	
      }
  }