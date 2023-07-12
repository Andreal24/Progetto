import javax.servlet.http.*;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

@SuppressWarnings("unused")
public class aggiunta_carrello extends HttpServlet {
    
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
            String codice_univoco = request.getParameter("codice_univoco");
			
			HttpSession session = request.getSession();
			String user_session = session.getAttribute("ID").toString();

			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            LocalDate localDate = LocalDate.now();
            
			String insert_query = null;
			
			String if_query = "select * from carrello";
			ResultSet ris1 = cmd1.executeQuery(if_query);

			String query = "select * from prodotto where codice='"+codice_univoco+"'";
			ResultSet ris = cmd.executeQuery(query);
			ResultSet ris2 = cmd2.executeQuery(query);
			
			boolean check_mark = false;
			
			while(ris2.next()){	
				if(ris2.getString("pezzi").equalsIgnoreCase("0")) {
					request.setAttribute("errorMessage", "Prodotto non disponibile");
		            request.getRequestDispatcher("/store_logged.jsp").forward(request, response);
			        return;
				}
			}
			
			while(ris1.next()){
					if(ris1.getString("codice").equalsIgnoreCase(codice_univoco) && ris1.getString("user").equalsIgnoreCase(user_session)){
						insert_query = "UPDATE carrello SET pezzi = pezzi +1 WHERE codice='"+codice_univoco+"' AND user='"+user_session+"'";
						check_mark = true;
					}
				}
			
			if(check_mark == false){
				while(ris.next()){
					insert_query = "INSERT INTO carrello VALUES('"+codice_univoco+"','"+ris.getString("nome_vino")+"','"+ris.getString("prezzo")+"','1','"+user_session+"','"+dtf.format(localDate)+"','"+ris.getString("img1")+"')";
				}
			}

	        cmd.executeUpdate(insert_query);
			System.out.println("Prodotto aggiunto al carrello");
			
			String query_product_pieces_decrease = "UPDATE prodotto SET pezzi = pezzi -1 WHERE codice='"+codice_univoco+"'";
			cmd.executeUpdate(query_product_pieces_decrease);

	        request.setAttribute("Message", "Prodotto aggiunto al carrello");
            request.getRequestDispatcher("/carrello_logged.jsp").forward(request, response);
	        return;

          

        }
        catch(Exception se)
        {
            se.printStackTrace();
           
        }
	
      }
  }