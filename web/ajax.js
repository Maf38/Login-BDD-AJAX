/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function controleIdentAjax()
        {
//Cette fonction sera appelée lors du click sur le bouton OK
// elle sert à contrôler que l'identification est correcte
// on crée tout d'abord l'objet XMLHttpRequest
        var xhr = null;
                if (window.XMLHttpRequest) { // Firefox et autres
        xhr = new XMLHttpRequest();
        } else if (window.ActiveXObject) // Internet Explorer
        {
        try
        {
        xhr = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e)
        {
        xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
        }
//on définit l'appel de la fonction au retour serveur. Lorsque le serveur a terminé son traitement,
// c'est cette fonction qui sera exécutée. Elle va renvoyer un message d'erreur
        xhr.onreadystatechange = function ()
        {
        if (xhr.readyState === 4)
                document.getElementById('erreuremail').innerHTML = xhr.responseText;
        }
//on utilise la méthode GET pour passer les paramètres.
        xhr.open("GET", "controleIdent.jsp?identifiant=" + document.getElementById('identifiant').value + "&pswd=" +
                document.getElementById('pswd').value, true);
                xhr.send(null);
                }

function rafraichirCatAjax()
        {
//Cette fonction sera appelée lors du changement de genre dans la combo
// elle sert à rafraîchir le catalogue en fonction du genre sélectionné
// on crée tout d'abord l'objet XMLHttpRequest
        var xhr = null;
                if (window.XMLHttpRequest) { // Firefox et autres
        xhr = new XMLHttpRequest();
        } else if (window.ActiveXObject) // Internet Explorer
        {
        try
        {
        xhr = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e)
        {
        xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
        }
//on définit l'appel de la fonction au retour serveur. Lorsque le serveur a terminé son traitement,
// c'est cette fonction qui sera exécutée. Elle va remplir le div qui s'appelle cat par le text retourné dans le
//xhr
        xhr.onreadystatechange = function ()
        {
        if (xhr.readyState == 4)
                document.getElementById('cat').innerHTML = xhr.responseText;
        }
//on ouvre le fichier cat.jsp (qui 'génère' le catalogue).
        xhr.open("POST", "cat.jsp", true);
// mettre ça si on est en POST
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//on passe le genre en paramètre (on prend le genre sélectionné)
                sel = document.getElementById("genre");
                gr = sel.options[sel.selectedIndex].text;
                xhr.send("genre=" + gr);
                }

function afficher() {
alert("hello");
        }

function rafraichirCatJsonAjax()
        {
//Cette fonction sera appelée lors du changement de genre dans la combo
// On utilise ici un retour au format JSON
        var xhr = null;
                if (window.XMLHttpRequest) // Firefox et autres
                xhr = new XMLHttpRequest();
                else if (window.ActiveXObject) // Internet Explorer
                {
                try
                        { xhr = new ActiveXObject("Msxml2.XMLHTTP"); }
                catch (e)
                        { xhr = new ActiveXObject("Microsoft.XMLHTTP"); }
                }
//on définit l'appel de la fonction au retour serveur. Lorsque le serveur a terminé son traitement,
// c'est cette fonction qui sera exécutée. Elle va remplir le div qui s'appelle cat par le text retourné dans le xhr

        xhr.onreadystatechange = function()
                {
                if (xhr.readyState === 4){
                        
//                        if (xhr.status == 200)
//                        {
//récupération du fichier JSON
                        var cat = eval("(" + xhr.responseText + ")");
                                var res;
                                var res1= "test";
//on formate l'affichage HTML directement sur le poste client
                                res = "<table border=1><thead><tr><th Class='titre'>reference </th><th Class='titre'>photo < /th><th Class='titre'>titre</th ><th Class='titre'>auteur</th> < th Class = 'titre' > editeur < /th><th Class='titre'>prix</th> < /tr>";
                                res = res + "</thead><tbody>";
//                                for (var c in cat.ligne)
//                                {
//                                res = res + "<tr><td><a href='#' >" + cat.ligne[c].reference
//                                        + "</a></td><td><img src='images/" + cat.ligne[c].photo
//                                        + "' /></td><td>" + cat.ligne[c].titre + "</td>" +
//                                        "<td>" + cat.ligne[c].auteur + "</td></tr>";
//                                        }
                        res = res + "</tbody></table>";
                                document.getElementById("cat").innerHTML = res1;
                                }
//                            }
//                            else {
//                            //test
//                                document.getElementById("cat").innerHTML = xhr.status;
//                            }
                }
                ;
//on ouvre le fichier catJson.aspx (qui 'génere' le catalogue).
//passage des parametres en méthode Post
        xhr.open("POST", "catJson.jsp", true);
// mettre ça si on est en POST
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//on passe le genre en parametre (on prend le genre séléctionné)
                        sel = document.getElementById("genre");
                        gr = sel.options[sel.selectedIndex].text;
                        xhr.send("genre=" + gr);
                        }