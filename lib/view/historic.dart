import 'package:flutter/material.dart';
import 'home.dart';
import 'loginPage.dart';

class Historic extends StatefulWidget {

  final String title;
  Historic(this.title);

  @override
  _HistoricPageState createState() => _HistoricPageState();
}

class _HistoricPageState extends State<Historic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Histórico', style: TextStyle(fontSize: 20.0)),
              Icon(
                Icons.article_outlined,
                color: Colors.red,
                size: 150.0,
                semanticLabel: 'Logo',
              ),
              Text('Clique no botão para carregar o histórico!'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text('VISUALIZE O HISTÓRICO',
                      style: TextStyle(fontSize: 15.0)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
