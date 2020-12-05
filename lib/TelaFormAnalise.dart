import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_p1_2/UsuariosList.dart';

class AnaliseFalha extends StatefulWidget {
  @override
  _AnaliseFalhaState createState() => _AnaliseFalhaState();
}

class _AnaliseFalhaState extends State<AnaliseFalha> {

  var idBox = TextEditingController();
  var peca = TextEditingController(); 
  var codE = TextEditingController();
  var motivo = TextEditingController();
  var operador = TextEditingController();
  bool checkSim = false;
  List<Falhas> falhas = List();
  List<Falhas> falhasValid = List();

  var dbFalhas = FirebaseFirestore.instance;

  var dbValidar = FirebaseFirestore.instance;

  var dbAnalise = FirebaseFirestore.instance;

  var scankey = GlobalKey<ScaffoldState>();
StreamSubscription<QuerySnapshot> ouvidor;
StreamSubscription<QuerySnapshot> ouvidorValid;

@override
void initState(){

  super.initState();

  ouvidor?.cancel();
  ouvidorValid?.cancel();

  ouvidor = dbFalhas.collection('falhas').where('status' , isEqualTo: '0').snapshots().listen((res) {
    setState(() {
      falhas = res.docs.map((e) => Falhas.fromMap(e.data(), e.id)).toList();

    });

  });

  ouvidorValid = dbValidar.collection('falhas').where('status' , isEqualTo: '2').snapshots().listen((res) {
    setState(() {
      falhasValid = res.docs.map((e) => Falhas.fromMap(e.data(), e.id)).toList();

    });

  });


}


  @override
  Widget build(BuildContext context) {
    Map dados = ModalRoute.of(context).settings.arguments;

    if (dados != null){
                 idBox.text = dados['setor'];
                 peca.text = dados['peca'];
                 codE.text = dados['equipamento'];
                if (dados['operacao'] == 'validar'){
                  motivo.text = falhasValid[0].dpEng;
                }

    } else{
       idBox.text = '';
      peca.text = '';
      codE.text = '';
    }


    return Scaffold(
      key: scankey,
      appBar: AppBar(title: Text("Formulario Analise Falha"),),
      body: Container(
        padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: Column(
          children: [
             Container(
                              width: 500,
                              child: CheckboxListTile(
                               
                                controlAffinity: ListTileControlAffinity.platform,
                                title: 
                                dados['operacao']!='validar' ? Text("Requerer Analise complementar Engenharia",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),):
                                Text("Validar Disposiçao Engenharia",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                value: checkSim, 
                                                                
                                onChanged: (value){
                                  setState(() {
                                    checkSim = value;
                                                 
                                    print(checkSim);
                                  });
                                }),
                            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text("Local da Falha: "),
                Expanded(child: Container()),
                 Container(
                   width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1
                        ),
                      )
                    ),
                    child: TextField(
                      controller: idBox,
                    ),
                ) 
              ],
            ),
            
            Row(
              children: [
                Text("Codigo Peça: "),
                Expanded(child: Container()),
                 Container(
                   width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1
                        ),
                      )
                    ),
                    child: TextField(
                      controller: peca,
                    ),
                ) 
              ],
            ),
            
            Row(
              children: [
                Text("Codigo Equipamento: "),
                Expanded(child: Container()),
                 Container(
                   width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1
                        ),
                      )
                    ),
                    child: TextField(
                      controller: codE,
                    ),
                ) 
              ],
            ),
             
            Row(
              children: [
                dados['operacao'] != 'validar' ? Text("Analise preliminar: ") :
                Text("Disposição Engenharia"),
                Expanded(child: Container()),
                 Container(
                   width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1
                        ),
                      )
                    ),
                    child: TextField(
                      controller: motivo,
                    ),
                ) 
              ],
            ),
            
            Row(
              children: [
                Text("Operadores envolvidos: "),
                Expanded(child: Container()),
                 Container(
                   width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1
                        ),
                      )
                    ),
                    child: TextField(
                      controller: operador,
                    ),
                ) 
              ],
            ),
            SizedBox(height: 20,),
            Center(child: 
            RaisedButton(
              child: Text("Salvar Dados"),
              onPressed: () async{
              await dbAnalise.collection('relatorio').add({
                'local' : idBox.text,
                'equipamento' : codE.text,
                'peca' : peca.text,
                'analise' : motivo.text,
                'operador' : operador.text

              });

              if (checkSim){
                await dbFalhas.collection('falhas').doc(dados['id']).update({
                  'status' : '1'

                });
              }

              if(dados['operacao'] == 'validar' || !checkSim){
                await dbFalhas.collection('falhas').doc(dados['id']).update({
                  'status' : '5'

                });
              }
Navigator.of(context).pop();

              })
            
            )
          ],
        ),
      ),
      
    );
  }
}