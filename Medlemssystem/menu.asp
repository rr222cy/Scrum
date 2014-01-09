<nav>
                    <h3>Meny</h3>
                    <ul class="quickMenu">
                        <% If Request.QueryString("page")="overview" Then %>
                        <li>>> <a href="overview.asp?page=overview">Översikt</a></li>
                        <li><a href="editMember.asp?page=newMember">Lägg till medlem</a></li>
                        <li><a href="allMembers.asp?page=allMembers">Alla medlemmar</a></li>
                        <li><a href="searchMember.asp?page=searchMember">Sök medlem</a></li>
                        <li><a href="editAdmin.asp?page=adminOverview">Hantera administratörer</a></li>
                        <li><a href="editAdmin.asp?page=newAdmin">Lägg till administratör</a></li>
                        <li><a href="logout.asp">Logga ut</a></li>
                            
                            
                        <% ElseIf Request.QueryString("page")="newMember" Then %>
                        <li><a href="overview.asp?page=overview">Översikt</a></li>
                        <li>>> <a href="editMember.asp?page=newMember">Lägg till medlem</a></li>
                        <li><a href="allMembers.asp?page=allMembers">Alla medlemmar</a></li>
                        <li><a href="searchMember.asp?page=searchMember">Sök medlem</a></li>
                        <li><a href="editAdmin.asp?page=adminOverview">Hantera administratörer</a></li>
                        <li><a href="editAdmin.asp?page=newAdmin">Lägg till administratör</a></li>
                        <li><a href="logout.asp">Logga ut</a></li>
                            
                        <% ElseIf Request.QueryString("page")="allMembers" OR Request.QueryString("page")="editMember"Then %>
                        <li><a href="overview.asp?page=overview">Översikt</a></li>
                        <li><a href="editMember.asp?page=newMember">Lägg till medlem</a></li>
                        <li>>> <a href="allMembers.asp?page=allMembers">Alla medlemmar</a></li>
                        <li><a href="searchMember.asp?page=searchMember">Sök medlem</a></li>
                        <li><a href="editAdmin.asp?page=adminOverview">Hantera administratörer</a></li>
                        <li><a href="editAdmin.asp?page=newAdmin">Lägg till administratör</a></li>
                        <li><a href="logout.asp">Logga ut</a></li>
                            
                        <% ElseIf Request.QueryString("page")="searchMember" Then %>
                        <li><a href="overview.asp?page=overview">Översikt</a></li>
                        <li><a href="editMember.asp?page=newMember">Lägg till medlem</a></li>
                        <li><a href="allMembers.asp?page=allMembers">Alla medlemmar</a></li>
                        <li>>> <a href="searchMember.asp?page=searchMember">Sök medlem</a></li>
                        <li><a href="editAdmin.asp?page=adminOverview">Hantera administratörer</a></li>
                        <li><a href="editAdmin.asp?page=newAdmin">Lägg till administratör</a></li>
                        <li><a href="logout.asp">Logga ut</a></li>
                            
                        <% ElseIf Request.QueryString("page")="adminOverview" OR Request.QueryString("page")="editAdmin" Then %>
                        <li><a href="overview.asp?page=overview">Översikt</a></li>
                        <li><a href="editMember.asp?page=newMember">Lägg till medlem</a></li>
                        <li><a href="allMembers.asp?page=allMembers">Alla medlemmar</a></li>
                        <li><a href="searchMember.asp?page=searchMember">Sök medlem</a></li>
                        <li>>> <a href="editAdmin.asp?page=adminOverview">Hantera administratörer</a></li>
                        <li><a href="editAdmin.asp?page=newAdmin">Lägg till administratör</a></li>
                        <li><a href="logout.asp">Logga ut</a></li>
                            
                        <% ElseIf Request.QueryString("page")="newAdmin" Then %>
                        <li><a href="overview.asp?page=overview">Översikt</a></li>
                        <li><a href="editMember.asp?page=newMember">Lägg till medlem</a></li>
                        <li><a href="allMembers.asp?page=allMembers">Alla medlemmar</a></li>
                        <li><a href="searchMember.asp?page=searchMember">Sök medlem</a></li>
                        <li><a href="editAdmin.asp?page=adminOverview">Hantera administratörer</a></li>
                        <li>>> <a href="editAdmin.asp?page=newAdmin">Lägg till administratör</a></li>
                        <li><a href="logout.asp">Logga ut</a></li>
                            
                        <% Else %>
                        <li><a href="overview.asp?page=overview">Översikt</a></li>
                        <li><a href="editMember.asp?page=newMember">Lägg till medlem</a></li>
                        <li><a href="allMembers.asp?page=allMembers">Alla medlemmar</a></li>
                        <li><a href="searchMember.asp?page=searchMember">Sök medlem</a></li>
                        <li><a href="editAdmin.asp?page=adminOverview">Hantera administratörer</a></li>
                        <li><a href="editAdmin.asp?page=newAdmin">Lägg till administratör</a></li>
                        <li><a href="logout.asp">Logga ut</a></li>
                            
                        <% End If %>
                        
                    </ul>
                </nav>