
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/mapaparareportar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
//import 'package:flutter_application_1/firstscreen.dart';

class ReportarScreen extends StatefulWidget {
  const ReportarScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReportarScreenState createState() => _ReportarScreenState();
}

class _ReportarScreenState extends State<ReportarScreen> {
  String _enteredText = '';
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //podemos subir una imagen desde la cámara o la galeria, dependiendo el parámetro
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

//función invocada una vez el usuario quiera subir una imagen
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //botón de usuario para subir imagen desde la galeria
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image),
                        Text('Galeria'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //botón de usuario para subir imagen tomada por la cámara
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.camera),
                        Text('Cámara'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reportar"),
      ),
      body: SingleChildScrollView(
        child: Wrap(children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MapaParaReportar()),
                        );
                      },
                      child: const Text(
                        'Ubicar en mapa',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _enteredText = value;
                        });
                      },
                      style: const TextStyle(fontSize: 15.0, height: 2.0),
                      obscureText: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Descripción del problema',
                        hintText: 'Ingresa una descripción del problema',
                        counterText:
                            '${_enteredText.length.toString()} /100 character(s)',
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 5,
                      maxLines: null,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(100),
                      ]),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  myAlert();
                },
                child: const Text('Subir imagen'),
              ),
              const SizedBox(
                height: 10,
              ),
              //si la imagen no es null mostrar la imagen
              //si la imagen es null mostrar el texto
              image != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          //mostrar la imagen
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        ),
                      ),
                    )
                  : const Text(
                      "Sin imagen",
                      style: TextStyle(fontSize: 20),
                    ),
            ],
          ),
        ]),
      ),
    );
  }
}
