import React from 'react';
import { useForm } from "react-hook-form";


function Forms(){

const { register, handleSubmit, 
formState: {errors} } = useForm();

const onSubmit = (formData) => {
  console.log(formData);

  const content = Object.entries(formData)
    .map(([key, value]) => `${key}: ${value}`)
    .join('\n');

  const blob = new Blob([content], { type: 'text/plain' });
  const fileName = 'datos_personales.txt';

  if (window.navigator && window.navigator.msSaveOrOpenBlob) {
    window.navigator.msSaveOrOpenBlob(blob, fileName);
  } else {
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = fileName;
    link.click();
  }
}


return(
//contenido del java va ac a
<div>
    <h1> Campaña de prevención de Rickettsia 2023 </h1>
<h2> Encuesta </h2>
<h3> Datos personales</h3>
<h4> Los datos del formulario serán recolectados y enviados a la base de datos del IMSS para llevar a cabo un monitoreo de la salud del paciente.</h4>

<form onSubmit={handleSubmit(onSubmit)}>

<div> 
<label>Nombre Completo</label>
<input
    type="text"
    {...register('nombre', {
      required: {
        value: true,
        message: "El nombre es obligatorio"
      },
      pattern: {
        value: /^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$/,
        message: "Ingresa un nombre válido sin números"
      },
      minLength: {
        value: 2,
        message: "Mínimo 2 caracteres"
      },
      maxLength: {
        value: 30,
        message: "Máximo 30 caracteres"
      }
    })}
  />
</div>
{
errors.nombre && <span>{errors.nombre.message}</span>
}


<br></br>


<div> 
<label>Correo electrónico</label> 
<input type="email" {...register('correo', {
    required:false
})} />
</div>
{
errors.correo && <span>{errors.correo.message}</span>
}
<br></br>




<div> 
<label>CURP</label> <a href="https://www.gob.mx/curp/" target="_blank"> (consulte aquí) </a>
<input type="text" {...register('curp', {
    required:true, pattern: {
        value: /^[A-Z]{4}\d{6}[HM][A-Z]{5}[A-Z\d]{2}$/,
        message: "El CURP no es válido"
      }
})} />
</div>
{
errors.curp && <span>{errors.curp.message}</span>
}

<br></br>

<div> 
<label>Domicilio</label>
<input type="text" {...register('domicilio', {
    required:true
})} />
</div>
{
errors.domicilio && <span>{errors.domicilio.message}</span>
}

<br></br>

<div> 
<label>Código postal</label>
<input type="number" {...register('cp', {
    required:true, pattern:{
        value: /^\d{5}$/, 
        message: "Código postal no válido"
    }
})}/>
</div>
{
errors.cp && <span>{errors.cp.message}</span>
}

<br></br>

<div> 
<label>Número de teléfono (solo números) </label>
<input type="number" {...register('numtel', {
    required:true,
      pattern: {
        value: /^[0-9]{10}$/,
        message: "Ingresa un número de teléfono válido (10 dígitos)"
      }
})}/>
</div>
{
errors.numtel && <span>{errors.numtel.message}</span>
}

<br></br>

<div> 
<label> Número de referencia (solo números) OPCIONAL</label>
<input type="number" {...register('numref', {
    required:false,
      pattern: {
        value: /^[0-9]{10}$/,
        message: "Ingresa un número de teléfono válido (10 dígitos)"
      }
})}/>
</div>
{
errors.numref && <span>{errors.numref.message}</span>
}


<br></br>

<center>
<input type="submit" class="fancybtn" value="Enviar"/>
</center>
</form>


</div>





)





}

export default Forms;

