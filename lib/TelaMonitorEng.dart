import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UsuariosList.dart';

class TelaMonitorEng extends StatefulWidget {
  @override
  _TelaMonitorEngState createState() => _TelaMonitorEngState();
}

class _TelaMonitorEngState extends State<TelaMonitorEng> {

 bool valcheck = false;
  bool valcheck1 = false;
  bool valcheck2 = false;
  

  List<Falhas> falhas = List();
  
  var db = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot> ouvidor;

  @override
  void initState(){
    super.initState();

    ouvidor?.cancel();

   ouvidor = db.collection('falhas').where('status' , isEqualTo: "1").snapshots().listen((res) {
   
   setState(() {
      falhas = res.docs.map((e) => Falhas.fromMap(e.data(), e.id)).toList() ;
   });
    
    });

  }

  @override
  Widget build(BuildContext context) {
    Map dados = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(title: Text("Equipamento " ),),
      body:

Column(
  children: [
    Container(
      child: Center(child: Text("Falhas encontradas", style: TextStyle(fontSize: 20),)),
    ),
        Expanded(
                  child: ListView.builder(    
    
      itemCount: falhas.length,
    
      itemBuilder: (context , index){
    
          return ListTile(
    
              title: Text("Codigo: ${falhas[index].codE} - ${dados['equipamento']}", style: TextStyle(fontSize: 20),),
    
              subtitle: Text("Descriçao: ${falhas[index].descricao}", style: TextStyle(fontSize: 18),),

              trailing: IconButton(
              icon: Icon(Icons.fact_check),
              tooltip: 'Açoes', 
              onPressed: (){
                dados['id'] = falhas[index].id;
                dados['descricao'] = falhas[index].descricao;
                dados['setor'] = falhas[index].idBox;
                dados['peca'] = falhas[index].codP;
                Navigator.pushNamed(context, '/telaEngenharia', arguments: dados);
              }, ),


          );
    
      },
    
    ),
        ),
  ],
),



    
    );
  }
  Widget btnOk(){
    return FlatButton(
      child: Text("ok"),
      onPressed: (){
      //  Navigator.of(context).pop();
      },
    );
  }
}