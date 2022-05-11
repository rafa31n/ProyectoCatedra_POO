/*$(document).ready(function () {
    var fecha=document.getElementById("fechaCreado")
    var enviar=document.getElementById("buscar");
    enviar.addEventListener("click",function (){
        /*$.post("/ServletAjaxFecha",function (response){
            var prueba=document.getElementById("prueba");
            console.log(response);

        });
        $.ajax({
            type:"POST",
            url:"/ServletAjaxFecha",
            success:function (response){
                console.log(response)
            }
        })
    })
})*/
var fechaOn=document.getElementById("fechaCreado");
var fechaOff=document.getElementById("fechaCreado2");
fechaOn.addEventListener("change",function (){
    var fechaVisible=fechaOn.value;
   fechaOff.value=fechaVisible;

})

