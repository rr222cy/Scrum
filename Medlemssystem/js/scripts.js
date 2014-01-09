/*jslint browser:true*/
"use strict";

var memberSystemFunctions = {
    init:function()
    {        
        var elems = document.getElementsByClassName('deleteLink');
        var confirmIt = function (e) 
        {
            if (!confirm('Vill du ta ta bort denna post?'))
            {
                e.preventDefault();
            }
        };
        
        for (var i = 0, l = elems.length; i < l; i++) {
            elems[i].addEventListener('click', confirmIt, false);
        }       
    },
};

window.onload = function () {
    memberSystemFunctions.init();
};