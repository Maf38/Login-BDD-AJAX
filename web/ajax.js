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
    if (window.XMLHttpRequest){ // Firefox et autres
        xhr = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) // Internet Explorer
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

