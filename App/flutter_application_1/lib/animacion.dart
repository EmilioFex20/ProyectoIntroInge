import 'package:flutter/material.dart'; //libreria esencial para flutter
import 'package:animated_splash_screen/animated_splash_screen.dart'; //libreria de animacion
import 'package:flutter_application_1/iniciosesion.dart'; //importamos el paquete de iniciosesion.dart para poder usar el objeto InicioSesion()

class Animacion extends StatefulWidget {
  const Animacion({super.key});

  @override
  AnimacionState createState() =>
      AnimacionState(); //Crea el estado mutable para este widget en una ubicación determinada del árbol.
}

class AnimacionState extends State<Animacion> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      //Widget usado para implementar animación
      splash: 'asset/logo/Logo.png', //imagen para la animacion
      nextScreen:
          const InicioSesion(), //la siguiente página a la que irá una vez se termine de ejecutar la animación
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
