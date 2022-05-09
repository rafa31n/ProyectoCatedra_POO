var progreso=document.getElementById("txtProgreso");
var progresoActual=document.getElementById("progresoActual").value;
var alerta=document.getElementById("alertaJS");
var submit=document.getElementById("operacion");

progreso.addEventListener('keyup',function (){
    var datoProgreso= progreso.value;
    if (datoProgreso<0){
        console.log("es menor a 0");
        alerta.innerHTML='El progreso no puede ser mmenor 0';
        submit.disabled = true;

    }else if (datoProgreso>100){
        console.log("es mayor a 100");
        alerta.innerHTML='El progreso no puede ser mayor 100';
        submit.disabled = true;
    }else if(datoProgreso<=progresoActual){
        console.log("No puede ser menor al actual");
        submit.disabled = true;
        alerta.innerHTML='El progreso no puede ser menor al actual';
    }else{
        alerta.innerHTML='';
        submit.disabled = false;
    }

})