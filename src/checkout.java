import javax.servlet.http.*;
import java.sql.*;

public class checkout extends HttpServlet {
    
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
			
			String email = request.getParameter("email");
			String indirizzo = request.getParameter("indirizzo");
			String recapito = request.getParameter("recapito");
			String credit = request.getParameter("credit");
			
			String codice_vino = null;
			String nome_vino = null;
			int pezzi = 0;
			String vendita = null;
			double prezzo = 0;
			
			String to_insert = null;
			
			//PRIMO ACQUISTO - DATI MANCANTI
			if(email != null) {
				if(email.trim().isEmpty()||indirizzo.trim().isEmpty()||recapito.trim().isEmpty()||credit.trim().isEmpty()){
					request.setAttribute("errMessage", "Compila correttamente ogni campo");
		            request.getRequestDispatcher("/checkout_data.jsp").forward(request, response);
			        return;
				}
				else {
					String user_query = "UPDATE user SET email = '"+email+"', indirizzo = '"+indirizzo+"', recapito = '"+recapito+"' WHERE ID='"+user_session+"'";
					cmd.executeUpdate(user_query);
					String view_basket = "SELECT * FROM carrello WHERE user='"+user_session+"'";
					ResultSet ris1 = cmd1.executeQuery(view_basket);
					while(ris1.next()) {
						codice_vino = ris1.getString("codice");
						nome_vino = ris1.getString("nome_vino");
						pezzi = ris1.getInt("pezzi");
						prezzo = pezzi*ris1.getDouble("prezzo");
						vendita = ris1.getString("vendita");
						to_insert = "INSERT INTO fattura SET codice_vino = '"+codice_vino+"', nome_vino = '"+nome_vino+"', pezzi = '"+pezzi+"', user = '"+user_session+"', prezzo = '"+prezzo+"', credit = '"+credit+"', vendita = '"+vendita+"'";
						cmd2.executeUpdate(to_insert);
					}
					String delete_query = "DELETE FROM carrello WHERE user='"+user_session+"'";
					cmd3.executeUpdate(delete_query);
					System.out.println("Prodotto fatturato");
					request.getRequestDispatcher("/index_logged.jsp").forward(request, response);
			        return;
				}
			}
			
			//UTENTE CHE ABBIA GIA' ACQUISTATO ALMENO UNA VOLTA
			else if(email == null) {
				if(credit.trim().isEmpty()){
					request.setAttribute("errMessage", "Compila correttamente ogni campo");
		            request.getRequestDispatcher("/checkout_credit.jsp").forward(request, response);
			        return;
				}
				else {
					String view_basket = "SELECT * FROM carrello WHERE user='"+user_session+"'";
					ResultSet ris1 = cmd1.executeQuery(view_basket);
					while(ris1.next()) {
						codice_vino = ris1.getString("codice");
						nome_vino = ris1.getString("nome_vino");
						pezzi = ris1.getInt("pezzi");
						prezzo = pezzi*ris1.getDouble("prezzo");
						vendita = ris1.getString("vendita");
						to_insert = "INSERT INTO fattura SET codice_vino = '"+codice_vino+"', nome_vino = '"+nome_vino+"', pezzi = '"+pezzi+"', user = '"+user_session+"', prezzo = '"+prezzo+"', credit = '"+credit+"', vendita = '"+vendita+"'";
						cmd2.executeUpdate(to_insert);
					}
					String delete_query = "DELETE FROM carrello WHERE user='"+user_session+"'";
					cmd3.executeUpdate(delete_query);
					System.out.println("Prodotto fatturato");
					request.getRequestDispatcher("/index_logged.jsp").forward(request, response);
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