import javax.servlet.http.*;
import java.sql.*;

public class edit_profile extends HttpServlet {
    
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
			
			HttpSession session = request.getSession();
            String username = session.getAttribute("ID").toString();
            
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            String cf = request.getParameter("CF");
            String recapito = request.getParameter("recapito");
            String indirizzo = request.getParameter("indirizzo");
            
            //Uno dei campi vuoto
			if(password.isEmpty()||(password==null)||
			   email.isEmpty()||(email==null)||
			   cognome.isEmpty()||(cognome==null)||
			   nome.isEmpty()||(nome==null)||
			   cf.isEmpty()||(cf==null)||
			   recapito.isEmpty()||(recapito==null)||
			   indirizzo.isEmpty()||(indirizzo==null)){
				
			request.setAttribute("errMessage", "Non lasciare vuoto nessun campo");
            request.getRequestDispatcher("user_profilo.jsp").forward(request, response);	
            return;
		    }
			
			String query = "UPDATE user SET password = '"+password+"',  email = '"+email+"', nome = '"+nome+"', cognome = '"+cognome+"', CF = '"+cf+"', recapito = '"+recapito+"', indirizzo = '"+indirizzo+"' WHERE ID ='"+username+"'";
			cmd.executeUpdate(query);
			
	        System.out.println("Modifica avvenuta");
	        request.setAttribute("Message", "Modifica avvenuta");
	        request.getRequestDispatcher("user_profilo.jsp").forward(request, response);	
	        return;

          

        }
        catch(Exception se)
        {
            se.printStackTrace();
           
        }
	
      }
  }