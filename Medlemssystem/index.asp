<%
If Session("UserOnline")="True" Then
Response.Redirect("overview.asp?page=overview")
End If
%>
<!DOCTYPE html>
<html>
<% Server.Execute("header.asp") %>
    <body>
        <div id="container">
            
            <header>
                <h1>Medlemshanteraren 1.0</h1>
            </header>
            
            <main>
                <section>
                    <h2>Hantera dina medlemmar snabbt och enkelt</h2>
                        <p>Välkommen till medlemshanteraren 1.0!</p>
                        <p>Med medlemshanteraren kan du snabbt och enkelt hålla koll på dina medlemmar till en 
                        organisation, klubb, samfund eller liknande. Snabb registrering/uppdatering och utdrag av uppgifter
                        är ledorden för medlemshanteraren.</p>
                        <p>Logga in nu och börja hantera dina medlemmar!</p>
                </section>
                <section>
                    <h3>Vänligen logga in</h3>
                        <form name="LoginForm" action="editMember.asp?page=runUpdateMember" method="post">
                            <fieldset>
                                <label class="leftalign" for="email">E-post:</label><br />
                                <input type="email" name="email" id="email" size="45" required><br />
                                <label class="leftalign" for="password">Lösenord:</label><br />
                                <input type="password" name="password" id="password" size="45" required><br />
                            </fieldset>                                                    
                            <input type="submit" name="Submit" id="Submit" value="Logga in">
                        </form>
                </section>
            </main>
            
            <% Server.Execute("footer.asp") %>
        </div>
    </body>
</html>