import javax.servlet.http.*;
import java.sql.*;
import java.util.ArrayList;

public class pulizia_carrelli extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
	         final String db_url = "jdbc:mysql://localhost:3306/wine_bank"+"?verifyServerCertificate=true"+"&useSSL=true"+"&allowMultiQueries=true";
	         final String user_db = "root";
	         final String pass_db = "Calipso";
	         Connection connessione;
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connessione = DriverManager.getConnection(db_url,user_db,pass_db);
			Statement cmd = connessione.createStatement();
			Statement cmd1 = connessione.createStatement();
			Statement cmd2 = connessione.createStatement();
			Statement cmd_batch = connessione.createStatement();
			
			String query = "SELECT * FROM carrello";
			ResultSet ris = cmd.executeQuery(query);
			
			String query1 = "SELECT * FROM prodotto";
			ResultSet ris1 = cmd1.executeQuery(query1);
			
			int i = 0;
			int n = 0;
			
			ArrayList<String> batch_list = new ArrayList<String>();
			
			while(ris.next()) {
				while(ris1.next()) {
				
				if(ris1.getString("codice").equalsIgnoreCase(ris.getString("codice"))) {
					batch_list.add("UPDATE prodotto SET pezzi = pezzi + '"+ris.getString("pezzi")+"' WHERE codice = '"+ris.getString("codice")+"'");
					i++;
				}	
			}
				ris1 = cmd1.executeQuery(query1);		
			}	
			for(n=0; n<i; n++) {
				cmd_batch.addBatch(batch_list.get(n));
			}
			
			cmd_batch.executeBatch();
			
			String query2 = "DELETE FROM carrello";
			cmd2.executeUpdate(query2);
			
	        System.out.println("Pulizia completata");
	        request.setAttribute("Message", "Pulizia completata");
	        request.getRequestDispatcher("manager_carrelli.jsp").forward(request, response);	
	        return;

          

        }
        catch(Exception se)
        {
            se.printStackTrace();
           
        }
	
      }
  }