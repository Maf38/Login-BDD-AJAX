<%-- 
    Document   : controleIdent
    Created on : 14 mars 2019, 11:01:19
    Author     : gai
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    
//Cette page représente le traitement de lidentification
// elle écrit un message d’erreur si le client n’est pas identifié -->
// définir le pilote ODBC

//définir la connection
Connection con;
con = DbConnection.getInstance().ouvrir("mfcat1", "visiteur","visiteur");
//execution d'une requete select

PreparedStatement comm=con.prepareStatement("Select prenom from Client where identifiant=? and pswd=?");
//donner des valeurs pour l'exécution de la requete
comm.setString (1,request.getParameter("identifiant"));
comm.setString (2,request.getParameter("pswd"));
java.sql.ResultSet rs=comm.executeQuery();
//balayage du ResultSet
if (rs.next())
out.print("<h1>Vous avez été identifié avec succès!!!</h1>"); //client existant, pas d'erreur'
else
out.print("Vous n'êtes pas inscrit !! ");
//fermeture de la commande
comm.close();
//fermer la connection
con.close();

%>
