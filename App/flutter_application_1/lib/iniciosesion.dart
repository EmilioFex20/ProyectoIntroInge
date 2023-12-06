import 'package:flutter/material.dart';
import 'package:flutter_application_1/firstscreen.dart';
import 'package:flutter_application_1/createaccount.dart';

class InicioSesion extends StatefulWidget {
  const InicioSesion({super.key});

  @override
  InicioSesionState createState() => InicioSesionState();
}

class InicioSesionState extends State<InicioSesion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Implementa la estructura de diseño visual básica de Material Design.
        appBar: AppBar(
          //Una barra de aplicaciones de Material Design.
          title: const Text("Iniciar Sesión"),
        ),
        body: SingleChildScrollView(
          //Usado para evitar overflow
          child: Column(
            children: [
              Container(
                //Contenedeor con el logo
                height: 200.0,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40, bottom: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(
                  child: Image.asset('asset/logo/Logo.png'),
                ),
              ),
              const Padding(
                //widget con padding, el cual contiene cuadro para ingresar texto
                padding: EdgeInsets.all(10),
                child: TextField(
                  //cuadro para ingresar texto
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre de Usuario',
                      hintText:
                          'Ingresar dirección de correo como abc@gmail.com'),
                ),
              ),
              const Padding(
                //widget con padding, el cual contiene cuadro para ingresar texto
                padding: EdgeInsets.all(10),
                child: TextField(
                  //cuadro para ingresar texto
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                      hintText: 'Ingresa tu contraseña'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    //Botón con texto
                    onPressed: () {},
                    child: const Text(
                      'Olvide mi Contraseña',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        //Navigatos.push sirve para cambiar de pagina
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PantallaInicio()),
                      );
                    },
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              Row(
                //Fila que consta de texto y un boton con texto
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Nuevo Usuario?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAccountScreen()),
                      );
                    },
                    child: const Text(
                      'Crear Cuenta',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
