import 'package:flutter/material.dart';
import 'package:portal_do_aluno_app/db/login_helper.dart';
import 'package:portal_do_aluno_app/login/login_presenter.dart';
import 'package:portal_do_aluno_app/model/user.dart';

import 'about.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        onPrimary: Colors.white,
      ),
      onPressed: _submit,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Text(
          'LOGIN',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
    var loginForm = new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Icon(
            Icons.account_circle,
            color: Colors.red,
            size: 150.0,
            semanticLabel: 'QI Escolars e Faculdades',
          ),
        ),
        new Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Entrar',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  onSaved: (val) => _username = val,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      labelText: 'RA ou Email',
                      hintText: "Digite RA ou Email",
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Colors.red, style: BorderStyle.solid))),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onSaved: (val) => _password = val,
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      enabledBorder: OutlineInputBorder(),
                      hintText: "Digite a sua senha",
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Colors.red, style: BorderStyle.solid))),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        loginBtn
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => About('Sobre'))
            );
          },
          child: Icon(
            Icons.wysiwyg,  // add custom icons also
          ),
        ),
        title: new Text("Portal do Aluno - Login"),
      ),
      key: scaffoldKey,
      body: new Container(
        child: new SingleChildScrollView(
          child: loginForm,
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    setState(() {
      _isLoading = false;
    });
    var db = new DatabaseHelper();
    await db.saveUser(user);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Home('Menu - Portal do aluno'))
    );
  }
}