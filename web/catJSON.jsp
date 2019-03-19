<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%

Connection con;
con=DbConnection.getInstance().getCo();
//execution d'une requete select pour rempli la combo
//cette requete est paramétrée et récupere le parametre passé en méthode POST
PreparedStatement comm=con.prepareStatement("Select reference,titre,auteur,photo,prix from Articles where genre='"+request.getParameter("genre")+"'");
java.sql.ResultSet rs=comm.executeQuery();
StringBuffer resJson;
resJson=new StringBuffer();
resJson.append("{'ligne':[ ");
boolean suite;
suite=rs.next();
while (suite)
{
resJson.append("{'referenceart':'" + rs.getString("referenceart") + "',");
resJson.append("'photo':'" + rs.getString("photo") + "',");
resJson.append("'titre':'" + rs.getString("titre") + "',");
resJson.append("'auteur':'" + rs.getString("auteur") + "',");
resJson.append("'editeur':'" + rs.getString("editeur") + "',");
resJson.append("'prix':'" + rs.getString("prix") + "'}");
suite = rs.next();
if (suite)
resJson.append(",");
}
resJson.append("]}");
out.println(resJson);
//fermer la connection
con.close(); %>