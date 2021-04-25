import 'package:flutter/material.dart';
import 'package:portal_do_aluno_app/model/model.dart';
import 'package:portal_do_aluno_app/view/calendar.dart';
import 'package:portal_do_aluno_app/view/register_certificate.dart';
import 'package:portal_do_aluno_app/view/historic.dart';
import 'package:portal_do_aluno_app/view/profile.dart';
import 'package:portal_do_aluno_app/view/results_bill.dart';
import 'package:portal_do_aluno_app/view/results_certificate.dart';
import 'package:table_calendar/table_calendar.dart';
import 'register_bill.dart';
import 'loginPage.dart';

class Home extends StatefulWidget {

  final String title;
  Home(this.title);

  @override
  _HomeState createState() => _HomeState();
}

class HomeState extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portal do aluno - Menu'),
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.web_rounded),
                      tooltip: 'Acessa o calendário',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => Calendar('Portal do aluno - Calendário'))
                        );
                      },
                    ),
                    Text('Calendário', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.wysiwyg),
                      tooltip: 'Acessa o certificado',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => CertificateResult() )
                        );
                      },
                    ),
                    Text(
                      'Certificados',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.account_balance_wallet_rounded),
                      tooltip: 'Acessa a central de vagas',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => Home('Portal do aluno - Central de Vagas'))
                        );
                      },
                    ),
                    Text('Central de Vagas',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.account_circle),
                      tooltip: 'Acessa os dados do usuário',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => Profile('Portal do aluno - Perfil'))
                        );
                      },
                    ),
                    Text('Seus Dados', style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.description),
                      tooltip: 'Acessa os boletos',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => BillResult() )
                        );
                      },
                    ),
                    Text('Boletos', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.article_outlined),
                      tooltip: 'Acessa o histórico',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => Historic('Portal do aluno - Histórico'))
                        );
                      },
                    ),
                    Text('Histórico', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
