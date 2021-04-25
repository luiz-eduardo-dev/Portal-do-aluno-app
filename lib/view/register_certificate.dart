import 'package:flutter/material.dart';
import 'package:portal_do_aluno_app/model/model.dart';

class RegisterCertificate extends StatefulWidget {

  final Certificate certificate;

  RegisterCertificate(this.certificate);

  @override
  _RegisterCertificateState createState() => _RegisterCertificateState();
}

class _RegisterCertificateState extends State<RegisterCertificate> {

  final _nameController = TextEditingController();
  final _courseController = TextEditingController();

  _rowIcon() {
    return new Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Icon(
        Icons.article_outlined,
        color: Colors.red,
        size: 150.0,
        semanticLabel: 'Certificado',
      ),
    );
  }
  _rowText() {
    return new Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        'Registre o Certificado',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  _rowName() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _nameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  hintText: "Digite o nome do Aluno",
                  labelText: 'Aluno',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid))),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  _rowCourse() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _courseController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  labelText: 'Curso',
                  hintText: "Digite o nome do curso",
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid))),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  _rowRegister(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          print('clicou registrar');
          widget.certificate.name = _nameController.text;
          widget.certificate.course = _courseController.text;
          print("Certificado: ${widget.certificate.toString()}");
          Navigator.pop(context, widget.certificate);
    },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'OK',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de certificado'),),

      body: SingleChildScrollView(
        child: Column(
          children: [
            _rowIcon(),
            _rowText(),
            _rowName(),
            _rowCourse(),
            _rowRegister(context)
          ],
        ),
      ),
    );
  }
}