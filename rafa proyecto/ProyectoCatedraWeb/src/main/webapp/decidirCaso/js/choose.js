
var radAceptar=document.getElementById("radio1");
var radDenegar=document.getElementById("radio2");
var radios=document.getElementsByName("selector");
var divAceptar=document.getElementById("aceptar");
var divDenegar=document.getElementById("denegar");


radAceptar.addEventListener("change",function () {
    if (radAceptar.checked==true) {
        divAceptar.style.display='block';
        divDenegar.style.display='none';
    }
       
    
})
radDenegar.addEventListener("change",function () {
    if (radDenegar.checked==true) {
        divAceptar.style.display='none';
        divDenegar.style.display='block';
    }
       
    
})