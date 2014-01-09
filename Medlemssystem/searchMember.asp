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
                <h1>Sök efter medlem</h1>
            </header>
            
            <main>
                <% Server.Execute("menu.asp") %>
<% If Request.Querystring("page")="searchMember" Then %>
                <section class="leftFloat">
                    <h2>Sök medlem</h2>
                    <p>Nedan kan du snabbt söka efter en person i medlemsregistret.</p>
                    <div class="standardFormDiv">
                        <form name="MemberSearchForm" action="searchMember.asp?page=runSearchMember" method="post">
                        <fieldset>
                            <legend>Skriv in personens förnamn och klicka på sök medlem.</legend>
                            <label class="leftalign" for="userID">Sökord:</label><br />
                                <input type="text" name="searchTerm" id="searchTerm" size="10" required><br />
                        </fieldset>                                                    
                        <input type="submit" name="Submit" id="Submit" value="Sök medlem">
                        </form>
                        <p><%=Session("felmess")%></p>
                    </div>
                </section>
<% ElseIf Request.Querystring("page")="runSearchMember" Then %>
<%
If Request.Form("searchTerm")="" Then
Response.Write("Skriv en sökterm")
Else
strSQL="SELECT * FROM tblUsers where userFirstName Like '%"& antiSqlInjection(Request.Form("searchTerm")) &"%'"
Set objRS = Connect.Execute(strSQL)

If not objRS.EOF then
Do until objRS.EOF
%>
    <%=objRS("userFirstName")%>
<%
objRS.MoveNext
Loop
End If
End If
objRS.Close : Set objRS = Nothing
%>
                <section class="leftFloat">
                    <h2>Sök medlem</h2>
                    <p>Nedan kan du snabbt söka efter en person i medlemsregistret.</p>
                    <div class="standardFormDiv">
                        <form name="MemberSearchForm" action="searchMember.asp?page=runSearchMember" method="post">
                        <fieldset>
                            <legend>Ange sökord, t.ex. för eller efternamn, eller båda.</legend>
                            <label class="leftalign" for="userID">Sökord:</label><br />
                                <input type="text" name="searchTerm" id="searchTerm" size="10" required><br />
                        </fieldset>                                                    
                        <input type="submit" name="Submit" id="Submit" value="Sök medlem">
                        </form>
                        <p><%=Session("felmess")%></p>
                    </div>
                </section>
<% End If %>
                <div style="clear: both;"></div>
            </main>
            
            <% Server.Execute("footer.asp") %>
        </div>
    </body>
</html>

                            
