
import 'package:flutter/material.dart';
import 'package:portal_do_aluno_app/db/bill_helper.dart';
import 'package:portal_do_aluno_app/model/model.dart';
import 'package:portal_do_aluno_app/view/views.dart';

class BillResult extends StatefulWidget {
  @override
  _BillResultState createState() => _BillResultState();
}

class _BillResultState extends State<BillResult> {

  BillHelper _helper = BillHelper();

  List<Bill> _bills = [];
  int _size;


  @override
  void initState() {
    super.initState();

    _helper.fetchAll().then((list) {
      print(list);
      setState(() {
        _bills = list;
      });
    });
  }

  _save(BuildContext context) async {
    print("clicou");
    //register_contact....
    final bill = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RegisterBoleto(Bill('','',''))
        )
    );
    if(bill != null)
      await _helper.save(bill);
    setState(() async {
      _bills = await _helper.fetchAll();
    });
  }

  _billCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print('clicou card');
        print("Boleto escolhido: ${_bills[index].toString()}");
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                child: Icon(
                    Icons.account_balance_wallet,
                    size:50,
                    color: Colors.red,)
                ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_bills[index].name ?? "",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(_bills[index].date ?? "",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(_bills[index].value ?? "",
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
    print('tamanho: ${_bills.length}');
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: _bills.length,
      itemBuilder: (context, index) {
        return _billCard(context, index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Portal do Aluno - Boletos'),),
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