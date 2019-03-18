<%-- 
    Document   : BDD
    Created on : 11 mars 2019, 16:01:54
    Author     : gai
--%>

<%@page import="beans.Article"%>
<%@page import="beans.Catalogue"%>
<%@page import="dao.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.Dao"%>
<%@page import="java.util.ArrayList"%>
<% 
Connection con;
con = DbConnection.getInstance().ouvrir("mfcat1", "visiteur","visiteur");
     
 %>
 <jsp:useBean id= "cat" class="beans.Catalogue" scope="request" />
        
 
 <%!
     public String afficherCatalogue(){
     

     String result="";
     Catalogue cat= new Catalogue();
     cat.lire();
     
     result+="<table> <tr> <td> Référence </td> "
            + " <td> titre </td>"
            + "<td> auteur </td>"
            + "<td> photo </td>"
            + "<td> prix </td>"
            +"<td> genre </td>"
            + "</tr>";
           
   
     for(int i=0;i<cat.getCollection().size();i++){
        
        Article art=cat.getCollection().get(i);
        result+="<tr>";
        result+="<td>" +art.getReference() +" </td>";
        result+="<td>" +art.getTitre() +" </td>";
        result+="<td>" +art.getAuteur() +" </td>";
        result+="<td> <img src='" +art.getPhoto() +"'/> </td>";
        result+="<td>" +art.getPrix() +" </td>";
        result+="<td>" +art.getGenre() +" </td>";
        result+="</tr>";
              
    }

     result+="</table>";

     return result;
    }
 %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSSFormulaire.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <p> 
            <h1> Catalogue</h1>
            
         
            <%=afficherCatalogue()%>
            
                    
           
        </p>
    </body>
</html>
