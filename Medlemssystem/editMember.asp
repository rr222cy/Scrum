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
                <h1>Medlemshantering</h1>
            </header>
            
            <main>
                <% Server.Execute("menu.asp") %>
                <section class="leftFloat">
                    <% If Request.QueryString("page")="newMember" Then %>
                    <h2>Lägg till medlem</h2>
                    <% If Request.QueryString("action")="memberAdded" Then %>
                    <p class="red">Medlemmen har nu lagts till i registret!</p>
                    <% End If %>
                    <div class="standardFormDiv">
                        <form name="MemberAddForm" action="editMember.asp?page=runAddMember" method="post">
                            <fieldset>
                                <legend>Lägg till medlem</legend>
                                <label class="leftalign" for="firstName">Förnamn:</label><br />
                                    <input type="text" name="firstName" id="firstName"  required><br />
                                <label class="leftalign" for="lastName">Efternamn:</label><br />
                                    <input type="text" name="lastName" id="lastName"  required><br />
                                <label class="leftalign" for="telephone">Telefonnummer:</label><br />
                                    <input type="tel" name="telephone" id="telephone"  required><br />
                            </fieldset>                                                    
                            <input type="submit" name="Submit" id="Submit" value="Lägg till medlem">
                        </form>
                    </div>
                        
                    <% ElseIf Request.QueryString("page")="editMember" Then %>
                    <h2>Redigera medlemsuppgifter</h2>
<%
strSQL="SELECT * FROM tblUsers Where userID="& clng(Request.Querystring("userID")) &""
Set objRS = Connect.Execute(strSQL)
%>
                    <div class="standardFormDiv">
                        <form name="MemberEditForm" action="editMember.asp?page=runUpdateMember&userID=<%=objRS("userID")%>" method="post">
                        <fieldset>
                            <legend>Redigera <%=objRS("userFirstName")%>&nbsp;<%=objRS("userLastName")%>:s uppgifter</legend>
                            <label class="leftalign" for="userID">MedlemsID:</label><br />
                                <input type="text" name="userID" id="userID" size="10" value="<%=objRS("userID")%>" disabled required><br />
                            <label class="leftalign" for="firstName">Förnamn:</label><br />
                                <input type="text" name="firstName" id="firstName" size="45" value="<%=objRS("userFirstName")%>" required><br />
                            <label class="leftalign" for="lastName">Efternamn:</label><br />
                                <input type="text" name="lastName" id="lastName" size="45" value="<%=objRS("userLastName")%>" required><br />
                            <label class="leftalign" for="telephone">Telefonnummer:</label><br />
                                <input type="tel" name="telephone" id="telephone" size="45" value="<%=objRS("userTelephone")%>" required><br />
                        </fieldset>                                                    
                        <input type="submit" name="Submit" id="Submit" value="Uppdatera">
                        </form>
                        <p><%=Session("felmess")%></p>
                    </div>
                    <% Session("FelMess")="" %>
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


' Kod för att uppdatera medlemsuppgifter
ElseIf Request.Querystring("page")="runUpdateMember" Then
strSQL="UPDATE tblUsers SET userFirstName='"& antiSqlInjection(Request.Form("firstName")) &"', userLastName='"& antiSqlInjection(Request.Form("lastName")) &"', userTelephone='"& antiSqlInjection(Request.Form("telephone")) &"' Where userID="& clng(Request.Querystring("userID")) &""

Connect.Execute(strSQL)

' Stänger DB koppling
Connect.Close
Set Connect = Nothing

Session("FelMess")="<span class='red'>Medlemmen uppdaterades!</span>"
 
Refer = request.servervariables("http_referer")	   
Response.Redirect(Refer)
   
' Kod för att radera medlem ur registret
ElseIf Request.Querystring("page")="runDeleteMember" Then

strSQL="DELETE FROM tblUsers Where userID="& clng(Request.Querystring("userID")) &""
Connect.Execute(strSQL)

' Stänger DB koppling
Connect.Close
Set Connect = Nothing 

Refer = request.servervariables("http_referer")	   
Response.Redirect(Refer)
 
End If
%>