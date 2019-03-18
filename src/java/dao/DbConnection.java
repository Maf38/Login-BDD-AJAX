package dao;


import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnection {
	// instance unique de la classe (en statique)
	private static DbConnection _inst = null;
	
	// connection JDBC 
	private Connection _co;
	
	public Connection getCo()
	{
		return _co;
	}
	
	// fermer la connexion JDBC en cours
	public boolean fermer ()
	{
		boolean ok = false;
		if (_co != null ) 
		{
			try 
			{
				_co.close();
				_co = null;
				ok = true;
			} 
			catch (SQLException e) {
				System.out.println("fermer : " + e.getMessage());
			}			
		}
		return ok;
	}
	
	// getInstance : retourne l'instance unique
	public static DbConnection getInstance ()
	{
		// cr�e l'instance si elle n'est pas nulle
		if (_inst== null)
			_inst = new DbConnection();
		
		return _inst;
	}
	
	// constructeur priv�e pour emp�cher de cr�er directement
	//  des instances de l'objet
	private DbConnection() 
	{
	}
	
	// ouvrir une connexion : pour la base de donn�es BASE,
	// l'utilisateur USER, de mot de passe PWD
	public Connection ouvrir (String base, String user, String pwd)
	{
		Connection con = null;
		try 
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://serveur-sql2017.dev.afpa"
					+ ";databaseName=" + base + ";";
			con = java.sql.DriverManager.getConnection(url,
					user, pwd);
			Statement st = con.createStatement();
			_co = con;
		
		} catch (Exception e) {
			System.out.println("ouvrir : " + e.getMessage());
		}
		return con;	
		
	}
	

}

