import 'package:flutter/material.dart';
import 'package:portal_do_aluno_app/model/model.dart';
import 'package:portal_do_aluno_app/view/results_bill.dart';

import 'home.dart';

class RegisterBoleto extends StatefulWidget {

  final Bill bill;
  RegisterBoleto(this.bill);

  @override
  _RegisterBoletoState createState() => _RegisterBoletoState();
}

class _RegisterBoletoState extends State<RegisterBoleto> {

  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _valueController = TextEditingController();

  _rowIcon() {
    return new Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Icon(
        Icons.account_balance_wallet_rounded,
        color: Colors.red,
        size: 150.0,
        semanticLabel: 'Boleto',
      ),
    );
  }
  _rowText() {
    return new Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        'Registre o Boleto',
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
                  hintText: "Digite o nome do Boleto",
                  labelText: 'Boleto',
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

  _rowValue() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _valueController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  labelText: 'Valor',
                  hintText: "Digite o valor do Boleto",
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

  _rowDate() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _dateController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  labelText: 'Data',
                  hintText: "Digite a Data do boleto",
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
          widget.bill.name = _nameController.text;
          widget.bill.date = _dateController.text;
          widget.bill.value = _dateController.text;
          print("Boleto: ${widget.bill.toString()}");
          Navigator.pop(context, widget.bill);
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
      appBar: AppBar(title: Text('Registro de Boleto'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _rowIcon(),
            _rowText(),
            _rowName(),
            _rowDate(),
            _rowValue(),
            _rowRegister(context)
          ],
        ),
      ),
    );
  }
}