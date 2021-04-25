import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'loginPage.dart';

class About extends StatefulWidget {

  final String title;
  About(this.title);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => LoginPage())
            );
          },
          child: Icon(
            Icons.arrow_back,  // add custom icons also
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Icon(
                Icons.wysiwyg,
                color: Colors.red,
                size: 150.0,
                semanticLabel: 'Logo',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                  'Portal do aluno da QI, é um sistema feito para visualizações das informações dos alunos como nota, boletos, faltas, etc... ',
                  textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Text('Desenvolvido por Nicholas Goes e Luiz Eduardo.',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
