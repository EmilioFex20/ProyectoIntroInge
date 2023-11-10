import React, { useState } from 'react';
import { useForm, Controller } from "react-hook-form";
import Imgs from '../img/Imgs'; 


function Med(){

    const { watch, control, register, handleSubmit, 
    formState: {errors} } = useForm();

    const [otroTexto, setOtroTexto] = useState('');
    const [opcs, setOpcs] = useState(''); 
    const [respuesta, setRespuesta] = useState('');

    const handleOpcionChange = (e) => {
      const newValue = e.target.value;
      setOpcs(newValue);
    };
    
    const onSubmit = (data) => {
      data.picadura = opcs === 'otro' ? otroTexto : opcs;
      data.portador = respuesta;
        console.log(data);
    }

    const handleRespuestaChange = (e) => {
      const newValue = e.target.value;
      setRespuesta(newValue);
  };
  const handleOtroTextoChange = (event) => {
    setOtroTexto(event.target.value);};
    

    
  


    
    
    
    return(
    //contenido del java va ac a
    <div>





    <h3> Datos médicos</h3>
    <h4> En esta sección ingrese los datos médicos solicitados a detalle.</h4>
    
    <form onSubmit={handleSubmit(onSubmit)}>
    
    <div> 
    <label>¿Ha tenido contacto con animales con rickettsia?</label>
    <input type="text" {...register('contacto', {
        required: {
            value: true,
            message: "Por favor llene el espacio"
        }, minLength: {
            value: 2, message: "Mínimo 2 caracteres"
        }, maxLength: {
            value:100, message: "Máximo 100 caracteres"
        }
    })}/>
    </div>
    {
    errors.contacto && <span>{errors.contacto.message}</span>
    }
    
    
    <br></br>
    
   
    <div>
      <label>¿Ha sufrido una picadura de alguno de los siguientes insectos o arácnidos? En caso de no haberla sufrido, haga caso omiso a esta pregunta, si fue otro insecto o arácnido favor de indicarlo en la opción de "otro".</label>
      <label>

      <div>
      <img src={Imgs[0].img1}/>
      </div>

        <input
          type="radio"
          value="garrapata"
          checked={opcs === 'garrapata'}
          onChange={handleOpcionChange}
        />
        Garrapata
      </label>
      <label>

      <div>
      <img src={Imgs[1].img2}/>
      </div>

        <input
          type="radio"
          value="pulga"
          checked={opcs === 'pulga'}
          onChange={handleOpcionChange}
        />
        Pulga
      </label>
      <label>

      <div>
      <img src={Imgs[2].img3}/>
      </div>

        <input
          type="radio"
          value="piojo"
          checked={opcs === 'piojo'}
          onChange={handleOpcionChange}
        />
        Piojo
      </label>

      <label>
  <input
    type="radio"
    value="otro"
    checked={opcs === 'otro'}
    onChange={handleOpcionChange}
  />
  Otro
</label>
{opcs === 'otro' && (
  <input
    type="text"
    value={otroTexto}
    onChange={handleOtroTextoChange}
    placeholder="Introduce tu respuesta"
  />
)}
     <p>Opción seleccionada: {opcs}</p>
    </div>








    <br></br>
<div>
      <h2>¿Un médico ha comprobado que usted es portador/portadora de ricketssia?</h2>
      <label>
        <input
          type="radio"
          value="Sí"
          checked={respuesta === 'Sí'}
          onChange={handleRespuestaChange}
        />
        Sí
      </label>
      <label>
        <input
          type="radio"
          value="No"
          checked={respuesta === 'No'}
          onChange={handleRespuestaChange}
        />
        No
        </label>
      </div>



      <br></br>

      <div> 
<label>Antecedentes médicos</label>
<input type="text" {...register('antecedentes', {
    required: {
        value: true,
        message: "Por favor llene el espacio"
    }, minLength: {
        value: 2, message: "Mínimo 2 caracteres"
    }, maxLength: {
        value:150, message: "Máximo 150 caracteres"
    }
})}/>
</div>
{
errors.antecedentes && <span>{errors.antecedentes.message}</span>
}

<br></br>

<div> 
<label>Síntomas actuales</label>
<input type="text" {...register('sintomas_actuales', {
    required: {
        value: true,
        message: "Por favor llene el espacio"
    }, minLength: {
        value: 2, message: "Mínimo 2 caracteres"
    }, maxLength: {
        value:150, message: "Máximo 150 caracteres"
    }
})}/>
</div>
{
errors.sintomas_actuales && <span>{errors.sintomas_actuales.message}</span>
}

<br></br>

<div> 
<label>Medicamentos que toma regularmente. (En caso de no tomar indique con un "NO").</label>
<input type="text" {...register('medicamentos_reg', {
    required: {
        value: true,
        message: "Por favor llene el espacio"
    }, minLength: {
        value: 2, message: "Mínimo 2 caracteres"
    }, maxLength: {
        value:200, message: "Máximo 200 caracteres"
    }
})}/>
</div>
{
errors.medicamentos_reg && <span>{errors.medicamentos_reg.message}</span>
}

<br></br>

<div> 
<label>Medicamentes que haya tomado en la última semana. (En caso de no haber tomado indique con un "NO").</label>
<input type="text" {...register('ult_sem_medicamentos', {
    required: {
        value: true,
        message: "Por favor llene el espacio"
    }, minLength: {
        value: 2, message: "Mínimo 2 caracteres"
    }, maxLength: {
        value:150, message: "Máximo 150 caracteres"
    }
})}/>
</div>
{
errors.ult_sem_medicamentos && <span>{errors.ult_sem_medicamentos.message}</span>
}

<br></br>


<div> 
<label>Medicamentos u otras sustancias a las que sea alérgico. (En caso de no tener alergias indique con un "NO").</label>
<input type="text" {...register('alerg_medicamentos', {
    required: {
        value: true,
        message: "Por favor llene el espacio"
    }, minLength: {
        value: 2, message: "Mínimo 2 caracteres"
    }, maxLength: {
        value:150, message: "Máximo 150 caracteres"
    }
})}/>
</div>
{
errors.alerg_medicamentos && <span>{errors.alerg_medicamentos.message}</span>
}

<br></br>


<div> 
<label>Indicaciones especiales que haya recibido. (En caso de no haber recibido indique con un "NO").</label>
<input type="text" {...register('ind_especiales', {
    required: {
        value: true,
        message: "Por favor llene el espacio"
    }, minLength: {
        value: 2, message: "Mínimo 2 caracteres"
    }, maxLength: {
        value:150, message: "Máximo 150 caracteres"
    }
})}/>
</div>
{
errors.ind_especiales && <span>{errors.ind_especiales.message}</span>
}

<br></br>




    
    <input type="submit" value="enviar"/>
    
    </form>
    
    
    </div>
    


    
    
    )
    
    
    
    
    
    }
    
    export default Med;