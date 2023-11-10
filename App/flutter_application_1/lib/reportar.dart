import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

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
                    //if user click this button, user can upload image from gallery
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
                    //if user click this button. user can upload image from camera
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
                child: Text('Subir foto'),
              ),
              const SizedBox(
                height: 10,
              ),
              //if image not null show the image
              //if image null show text
              image != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          //to show image, you type like this.
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
