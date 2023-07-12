import javax.servlet.http.*;
import java.sql.*;

public class opzioni_da_carrello extends HttpServlet {
    
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
			Statement cmd2 = connessione.createStatement();
			Statement cmd3 = connessione.createStatement();
			
			HttpSession session = request.getSession();
			String user_session = session.getAttribute("ID").toString();
			
			String nome_vino = request.getParameter("nome_vino");
			
			String pieces = request.getParameter("pieces");
			int n_pieces = Integer.parseInt(pieces);
			
			String update_button = request.getParameter("update_button");
			
			String delete_button = request.getParameter("delete_button");
			

			if(delete_button != null) {
			
			String charge_try = "SELECT * FROM carrello WHERE nome_vino='"+nome_vino+"' AND user='"+user_session+"'";
			ResultSet ris3 = cmd3.executeQuery(charge_try);
			String charge_pieces = null;
			
			while(ris3.next()){
				charge_pieces = ris3.getString("pezzi");
			}
			
			String charge_query = "UPDATE prodotto SET pezzi = pezzi + '"+charge_pieces+"' WHERE nome_vino='"+nome_vino+"'";
			cmd1.executeUpdate(charge_query);
			
			String del_query = "DELETE FROM carrello WHERE nome_vino='"+nome_vino+"' AND user='"+user_session+"'";
			cmd.executeUpdate(del_query);

			System.out.println("Prodotto cancellato dal carrello");

	        request.setAttribute("Message", "Prodotto cancellato dal carrello");
            request.getRequestDispatcher("/carrello_logged.jsp").forward(request, response);
	        return;
			}
			

			String check_query = "SELECT * FROM prodotto WHERE nome_vino='"+nome_vino+"'";
			ResultSet ris = cmd.executeQuery(check_query);
			
			if(update_button != null) {
				
				while(ris.next()) {
					
					String check_query1 = "SELECT * FROM carrello WHERE nome_vino='"+nome_vino+"' AND user='"+user_session+"'";
					ResultSet ris2 = cmd2.executeQuery(check_query1);
					int pezzi_attuali = 0;
					
					while(ris2.next()) {
						String temp = ris2.getString("pezzi");
						pezzi_attuali = Integer.parseInt(temp);
					}

					
					if(ris.getInt("pezzi") == 0 || ris.getInt("pezzi") < (n_pieces-pezzi_attuali)) {
						
						System.out.println("Prodotto non aggiornato poich� la quantit� non � sufficiente");

				        request.setAttribute("errorMessage", "Prodotto non aggiornato poich� la quantit� non � sufficiente");
			            request.getRequestDispatcher("/carrello_logged.jsp").forward(request, response);
				        return;
					}
					
					else {		
						String update_query = "UPDATE carrello SET pezzi = pezzi + '"+(n_pieces-pezzi_attuali)+"' WHERE nome_vino='"+nome_vino+"' AND user='"+user_session+"'";
						cmd.executeUpdate(update_query);
						
						String charge_query = "UPDATE prodotto SET pezzi = pezzi - '"+(n_pieces-pezzi_attuali)+"' WHERE nome_vino='"+nome_vino+"'";
						cmd1.executeUpdate(charge_query);

						System.out.println("Prodotto aggiornato nel carrello");

				        request.setAttribute("Message", "Prodotto aggiornato nel carrello");
			            request.getRequestDispatcher("/carrello_logged.jsp").forward(request, response);
				        return;
					}
						
				}

			}
          

        }
        catch(Exception se)
        {
            se.printStackTrace();
           
        }
	
      }
  }