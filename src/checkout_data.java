import javax.servlet.http.*;
import java.sql.*;

public class checkout_data extends HttpServlet {
    
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
			
			HttpSession session = request.getSession();
			String user_session = session.getAttribute("ID").toString();
			
			String check_basket = "SELECT * FROM carrello WHERE user = '"+user_session+"'";
			ResultSet ris1 = cmd1.executeQuery(check_basket);
			
			if (!ris1.isBeforeFirst() ) {    
				request.setAttribute("errMessage", "Carrello vuoto");
	            request.getRequestDispatcher("/carrello_logged.jsp").forward(request, response);
		        return; 
			} 
			
            String check_query = "SELECT * FROM user WHERE ID='"+user_session+"'";
            ResultSet ris = cmd.executeQuery(check_query);
            		
			while(ris.next()){	
				if(ris.getString("email").equalsIgnoreCase("null")&&ris.getString("indirizzo").equalsIgnoreCase("null")&&ris.getString("recapito").equalsIgnoreCase("null")) {
					request.getRequestDispatcher("/checkout_data.jsp").forward(request, response);
			        return;
				}
				else if(ris.getString("email").equalsIgnoreCase("null")==false&&ris.getString("indirizzo").equalsIgnoreCase("null")==false&&ris.getString("recapito").equalsIgnoreCase("null")==false) {
					request.getRequestDispatcher("/checkout_credit.jsp").forward(request, response);
			        return;
				}
			}
			
        }
        catch(Exception se)
        {
            se.printStackTrace();
           
        }
	
      }
  }