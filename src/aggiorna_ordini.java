import javax.servlet.http.*;
import java.sql.*;

public class aggiorna_ordini extends HttpServlet {
    
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
            
            String codice_vino = request.getParameter("codice_vino");
            String username = request.getParameter("username");
            String selected = request.getParameter("state");
            
            //Uno dei campi vuoto
			if(codice_vino.isEmpty()||(codice_vino==null)||
			   username.isEmpty()||(username==null)||
			   selected.isEmpty()||(selected==null)){
				
			request.setAttribute("errMessage", "Compila correttamente ogni campo");
            request.getRequestDispatcher("manager_ordini.jsp").forward(request, response);	
            return;
		    }
			
			String update_query = null;
			String check_query = "SELECT * FROM fattura";
			ResultSet list = cmd1.executeQuery(check_query);
			
			boolean check_mark = false;
			boolean check_mark1 = false;
			
			while(list.next()) {
				if(list.getString("codice_vino").equalsIgnoreCase(codice_vino)) {
					check_mark1 = true;
				}
				else if(list.getString("user").equalsIgnoreCase(username)) {
					check_mark = true;
				}
			}
			
			if(check_mark==true && check_mark1==true) {
				update_query = "UPDATE fattura SET stato = '"+selected+"' WHERE user = '"+username+"' AND codice_vino = '"+codice_vino+"'";
				cmd.executeUpdate(update_query);
				
		        System.out.println("Modifica avvenuta");
		        request.setAttribute("Message", "Stato ordine aggiornato");
		        request.getRequestDispatcher("manager_ordini.jsp").forward(request, response);	
		        return;
			}
			else if(check_mark==false || check_mark1==false) {
				System.out.println("Uno dei due campi non � stato trovato");
		        request.setAttribute("errMessage1", "Uno dei due campi non � stato trovato");
		        request.getRequestDispatcher("manager_ordini.jsp").forward(request, response);	
		        return;
			}
			


        }
        catch(Exception se)
        {
            se.printStackTrace();
           
        }
	
      }
  }