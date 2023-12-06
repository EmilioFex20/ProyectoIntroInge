import 'package:flutter/material.dart'; //libreria esencial para flutter
import 'package:flutter_application_1/animacion.dart'; //importamos el paquete de animacion.dart para poder usar el objeto Animacion()

void main() => runApp(
    const App()); //Toma la clase app para crear la fuente del árbol de widgets

class App extends StatelessWidget {
  //clase para el StatelessWidget
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //Describe la parte de la interfaz de usuario representada por este widget.
    //El marco llama a este método cuando este widget se inserta en el árbol en un
    //BuildContext determinado y cuando las dependencias de este widget cambian
    return MaterialApp(
      title: 'Vive Sin Rickettsia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green, //color principal de la app
        brightness: Brightness.light, //Se establece el modo de luz
      ),
      darkTheme:
          ThemeData(brightness: Brightness.dark), //Se establece el modo oscuro
      themeMode: ThemeMode.system, //Usa el modo del usuario
      home:
          const Animacion(), // El widget para la ruta predeterminada de la aplicación.
    );
  }
}
