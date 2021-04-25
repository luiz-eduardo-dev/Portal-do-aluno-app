import 'package:flutter/material.dart';
import 'package:portal_do_aluno_app/view/loginPage.dart';

import 'home.dart';

class Profile extends StatefulWidget {

  final String title;
  Profile(this.title);

  @override
  _ProfileState createState() => _ProfileState();
}

class ProfileState extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Aluno'),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Home('Portal do aluno - Menu'))
            );
          },
          child: Icon(
            Icons.arrow_back,  // add custom icons also
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.military_tech_rounded,
                color: Colors.red,
                size: 75.0,
                semanticLabel: 'Medalha',
              ),
              Icon(
                Icons.person,
                color: Colors.red,
                size: 120.0,
                semanticLabel: 'Foto do Mano',
              ),
              Icon(
                Icons.check_circle,
                color: Colors.red,
                size: 75.0,
                semanticLabel: 'Selo de aprovação',
              ),
            ],
          ),
          Text('Nicholas', style: TextStyle(fontSize: 20)),
          Text('Estudando na QI desde 2019', style: TextStyle(fontSize: 14)),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center
            ),
          )
        ],
      ),
    );
  }
}