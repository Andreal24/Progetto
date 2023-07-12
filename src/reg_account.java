import javax.servlet.http.*;
import java.sql.*;

public class reg_account extends HttpServlet {
    
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
            String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            String cf = request.getParameter("cf");
            String user = request.getParameter("user");
            String password = request.getParameter("password");
            
            //Uno dei campi vuoto
			if(cf.isEmpty()||(cf==null)||
			   nome.isEmpty()||(nome==null)||
			   cognome.isEmpty()||(cognome==null)||
			   user.isEmpty()||(user==null)||
			   password.isEmpty()||(password==null)) {
				
			request.setAttribute("Message", "Riempire ogni campo richiesto");
            request.getRequestDispatcher("/registrati.jsp").forward(request, response);	
            return;
		    }
			
			String query = "select * from user";
			ResultSet ris = cmd.executeQuery(query);
			
			
			while(ris.next()){
				
				//Username gi� presente sul database ma non il codice fiscale, quindi l'username � non disponibile
			if(ris.getString("ID").equals(user) && ris.getString("CF").equals(cf)== false){
				request.setAttribute("Message", "Username non disponibile");
	            request.getRequestDispatcher("/registrati.jsp").forward(request, response);	
	            return;
			}
			
			    //Codice fiscale gi� presente sul database quindi utente gi� registrato, magari con altro username
			else if(ris.getString("CF").equals(cf)) {
				request.setAttribute("Message", "Codice Fiscale gi� presente sul sistema");
	            request.getRequestDispatcher("/registrati.jsp").forward(request, response);	
	            return;
			}
			}
			String predef = ("default");
            query="INSERT INTO user VALUES('"+user+"','"+password+"','"+cf+"','"+nome+"','"+cognome+"','"+predef+"')";
	        cmd.executeUpdate(query);
	        System.out.println("Registrazione avvenuta");
	        request.setAttribute("Message", "Registrazione avvenuta");
            request.getRequestDispatcher("/registrati.jsp").forward(request, response);
	        return;

          

        }
        catch(Exception se)
        {
            se.printStackTrace();
           
        }
	
      }
  }