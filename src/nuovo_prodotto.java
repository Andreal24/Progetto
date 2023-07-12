import javax.servlet.http.*;
import java.sql.*;
import org.apache.commons.lang3.StringUtils;

public class nuovo_prodotto extends HttpServlet {
    
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
			
            String codice = request.getParameter("codice");
            String nome_vino = request.getParameter("nome_vino");
            String categoria = request.getParameter("categoria");
            String prezzo = request.getParameter("prezzo");
            String pezzi = request.getParameter("pezzi");
            String annata = request.getParameter("annata");
            
            //Uno dei campi vuoto
			if(codice.isEmpty()||(codice==null)||
			   nome_vino.isEmpty()||(nome_vino==null)||
			   categoria.isEmpty()||(categoria==null)||
			   prezzo.isEmpty()||(prezzo==null)||
			   pezzi.isEmpty()||(pezzi==null)|| 
			   annata.isEmpty()||(annata==null)||(StringUtils.isNumeric(prezzo)==false)||
			   (StringUtils.isNumeric(pezzi)==false)){
				
			request.setAttribute("errMessage", "ERRORE! Verifica di aver compilato correttamente ogni campo");
            request.getRequestDispatcher("admin_prodotti_new.jsp").forward(request, response);	
            return;
		    }
			
            String query = "INSERT INTO prodotto SET codice = '"+codice+"', nome_vino = '"+nome_vino+"', categoria = '"+categoria+"', prezzo = '"+prezzo+"', pezzi = '"+pezzi+"', annata = '"+annata+"'";
	        cmd.executeUpdate(query);
	        System.out.println("Nuovo prodotto aggiunto");
	        request.setAttribute("Message", "Nuovo prodotto aggiunto");
            request.getRequestDispatcher("admin_prodotti_new.jsp").forward(request, response);
	        return;
	        
        }
        catch(Exception se)
        {
            se.printStackTrace();
           
        }
	
      }
  }