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
                        <form action="Login.asp" method="post">
                            E-post:<br />
                            <input type="text" size="35" name="email" /><br />
                            Lösenord:<br />
                            <input type="password" size="35" name="password" /><br />
                            <input type="submit" value="Logga in" />
                        </form>
                <section>
            </main>
            
            <% Server.Execute("footer.asp") %>
        </div>
    </body>
</html>