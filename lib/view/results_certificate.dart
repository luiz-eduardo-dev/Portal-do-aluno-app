
import 'package:flutter/material.dart';
import 'package:portal_do_aluno_app/db/certificate_helper.dart';

import 'package:portal_do_aluno_app/model/model.dart';
import 'package:portal_do_aluno_app/view/views.dart';

class CertificateResult extends StatefulWidget {
  @override
  _CertificateResultState createState() => _CertificateResultState();
}

class _CertificateResultState extends State<CertificateResult> {

  CertificateHelper _helper = CertificateHelper();

  List<Certificate> _certificates = [];
  int _size;


  @override
  void initState() {
    super.initState();

    _helper.fetchAll().then((list) {
      print(list);
      setState(() {
        _certificates = list;
      });
    });
  }

  _save(BuildContext context) async {
    print("clicou");
    //register_contact....
    final certificate = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RegisterCertificate(Certificate('',''))
        )
    );
    if(certificate != null)
      await _helper.save(certificate);
    setState(() async {
      _certificates = await _helper.fetchAll();
    });
  }

  _certificateCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print('clicou card');
        print("Certificado escolhido: ${_certificates[index].toString()}");
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                  child: Icon(
                    Icons.article,
                    size:50,
                    color: Colors.red,)
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_certificates[index].name ?? "",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(_certificates[index].course ?? "",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _list(BuildContext context) {
    print('tamanho: ${_certificates.length}');
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: _certificates.length,
      itemBuilder: (context, index) {
        return _certificateCard(context, index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Portal do Aluno - Certificados'),),
      body: Column(
        children: [
          Expanded(child: _list(context),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _save(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}