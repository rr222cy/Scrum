<!-- #include file = "includes/dbConnectionString.asp" -->
<%
If Session("UserOnline")="" Then
Response.Redirect("index.asp")
End If
%>
<!DOCTYPE html>
<html>
<% Server.Execute("header.asp") %>
    <body>
        <div id="container">
            
            <header>
                <h1>Redigera uppgifter om medlem</h1>
            </header>
            
            <main>
                <% Server.Execute("menu.asp") %>
                <section class="leftFloat">
                    <% If Request.QueryString("page")="newMember" Then %>
                    <h2>Lägg till medlem</h2>
                    <% If Request.QueryString("action")="memberAdded" Then %>
                    <p class="red">Medlemmen har nu lagts till i registret!</p>
                    <% End If %>
                    <form name="MemberAddForm" action="editMember.asp?page=runAddMember" method="post">
                        <fieldset>
                            <legend>Lägg till medlem</legend>
                            <label class="leftalign" for="firstName">Förnamn:</label><br />
                                <input type="text" name="firstName" id="firstName" size="45" required><br />
                            <label class="leftalign" for="lastName">Efternamn:</label><br />
                                <input type="text" name="lastName" id="lastName" size="45" required><br />
                            <label class="leftalign" for="telephone">Telefonnummer:</label><br />
                                <input type="tel" name="telephone" id="telephone" size="45" required><br />
                        </fieldset>                                                    
                        <input type="submit" name="Submit" id="Submit" value="Lägg till medlem">
                    </form>
                        
                    <% ElseIf Request.QueryString("page")="editMember" Then %>
                    <h2>Redigera medlemsuppgifter</h2>
                    <form name="MemberEditForm" action="editMember.asp?page=runUpdateMember" method="post">
                    <fieldset>
                        <legend>Redigera xyz uppgifter</legend>
                        <label class="leftalign" for="firstName">Förnamn:</label><br />
                            <input type="text" name="firstName" id="firstName" size="45" required><br />
                        <label class="leftalign" for="lastName">Efternamn:</label><br />
                            <input type="text" name="lastName" id="lastName" size="45" required><br />
                        <label class="leftalign" for="telephone">Telefonnummer:</label><br />
                            <input type="tel" name="telephone" id="telephone" size="45" required><br />
                    </fieldset>                                                    
                    <input type="submit" name="Submit" id="Submit" value="Uppdatera">
                    </form>
                        
                    <% End If %>
                        
                </section>
                <div style="clear: both;"></div>
            </main>
            
            <% Server.Execute("footer.asp") %>
        </div>
    </body>
</html>
                    
<%
' Kod för att lägga till medlem.
If Request.Querystring("page")="runAddMember" Then

' Skickar in det som angetts i formuläret i databasen.
strSQL="INSERT INTO tblUsers(userFirstName, userLastName, userTelephone) VALUES('"& antiSqlInjection(Request.Form("firstName")) &"', '"& antiSqlInjection(Request.Form("lastName")) &"', '"& antiSqlInjection(Request.Form("telephone")) &"')"
Connect.Execute(strSQL)

' Stänger DB koppling.
Connect.Close
Set Connect = Nothing

Response.Redirect("?page=newMember&action=memberAdded")

End If

' Kod för att uppdatera medlemsuppgifter
' Kod för att radera medlem ur registret
%>