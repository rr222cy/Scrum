<!-- #include file = "includes/dbConnectionString.asp" -->
    
<%
' Kollar om användaren finns, samt kollar om lösen + salt stämmer
'
   
   adminEmail = antiSqlInjection(request.form("email"))
   adminPassword = antiSqlInjection(request.form("password"))
  
   strSQL="SELECT * From tblAdmin where adminEmail='"& adminEmail &"' AND adminPassword='"& adminPassword &"'"
   Set objRS = Connect.Execute(strSQL)

   If objRS.EOF Then
	  
' Om några uppgifter inte stämmer
'
   Session("FelMess")="<font color='Red'>Inloggningen misslyckades, kontrollera så du skrev in rätt användarnamn och lösenord!</font><br />"
   Response.Redirect("index.asp")
   Else
	  
' Om allt stämmer sätts sessionerna
'  
   Session("UserOnline")="True"
   Session("FelMess")=""
   Session.Timeout=999

'Stänger DB koppling
'
   Connect.Close
   Set Connect = Nothing 
   Response.Redirect("overview.asp?page=overview")
		
   End If
	  
%>