import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:quickalert/quickalert.dart';


class PostPdf extends StatefulWidget {
  const PostPdf({super.key});

  @override
  State<PostPdf> createState() => _PostPdfState();
}

class _PostPdfState extends State<PostPdf> {
    File? selectPdf;
  File? selectedFile;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text("Sube un pdf")),
      body: Column(
        children: [
          OutlinedButton(
            onPressed: _pickPdf,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.black)
                .copyWith(
              side: MaterialStateProperty.all(const BorderSide(
                color: Colors.grey, // color del borde
                width: 1.0, // ancho del borde
              )),
              minimumSize: MaterialStateProperty.all(const Size(10, 40)),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            child: const Text('Selecionar Menu "pdf"'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String filePath = result.files.single.path!;
      String extension = path.extension(filePath);

      if (extension.toLowerCase() == ".pdf") {
        setState(() {
          selectPdf = File(filePath);
        });
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
        ); // That's it to display an alert, use other properties to customize.
      } else {
        // No es un archivo PDF, muestra la alerta.
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'No has cargado el archivo esperado, ¡intentalo de nuevo!',
        );
      }
    }
  }
}
