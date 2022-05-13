//
var InfechaInicio=document.getElementById('fechaInicio');
var InfechaFinal=document.getElementById('fechaFinal');

var fechaAc=new Date().toISOString().split('T')[0];
InfechaInicio.value=fechaAc;
InfechaInicio.min=fechaAc;
//
var date = new Date()
// Add a day
date.setDate(date.getDate() + 1);
var fechaFinalDefult=date.toISOString().split('T')[0];
InfechaFinal.value=fechaFinalDefult;
InfechaFinal.min=fechaFinalDefult;
var userFechaInicio;
var userFechaFinal;
/*
InfechaInicio.addEventListener("change",function(){
    userFechaInicio=InfechaInicio.value;

    return userFechaInicio;
})

InfechaFinal.addEventListener("change",function () {
    userFechaFinal=InfechaFinal.value;
    return userFechaFinal;
})*/
//