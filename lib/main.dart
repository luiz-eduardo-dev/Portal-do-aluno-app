import 'package:flutter/material.dart';
import 'package:portal_do_aluno_app/model/certificate.dart';
import 'package:portal_do_aluno_app/view/calendar.dart';
import 'package:portal_do_aluno_app/view/register_certificate.dart';
import 'package:portal_do_aluno_app/view/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
    );
  }
}
