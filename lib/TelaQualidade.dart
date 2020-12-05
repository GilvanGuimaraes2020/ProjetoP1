

import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:projeto_p1_2/TelaFormAnalise.dart';
//import 'package:projeto_p1_2/TelaFormCausaEfeito.dart';
import 'package:projeto_p1_2/UsuariosList.dart';

// ignore: must_be_immutable
class TelaQualidade extends StatefulWidget {


  @override
  _TelaQualidadeState createState() => _TelaQualidadeState();
}

class _TelaQualidadeState extends State<TelaQualidade> {

  bool valcheck = false;
  bool valcheck1 = false;
  bool valcheck2 = false;
  

  List<Falhas> falhas = List();
  List<Falhas> falhaFiltro = List();
  var db = FirebaseFirestore.instance;
  var dbValid = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot> ouvidor;
  StreamSubscription<QuerySnapshot> ouvidorValid;

  @override
  void initState(){
    super.initState();

    ouvidor?.cancel();
    ouvidorValid?.cancel();

   ouvidor = db.collection('falhas').where('status' , isEqualTo: '0').snapshots().listen((res) {
   
   setState(() {
      falhas = res.docs.map((e) => Falhas.fromMap(e.data(), e.id)).toList() ;
   });
    
    });

   ouvidorValid = dbValid.collection('falhas').where('status', isEqualTo: '2').snapshots().listen((resp) {
     setState(() {
       falhaFiltro = resp.docs.map((e) => Falhas.fromMap(e.data(), e.id)).toList();

     });

   });

  }

  

  @override
  Widget build(BuildContext context) {
    Map dados = ModalRoute.of(context).settings.arguments;



    return Scaffold(
      appBar: AppBar(title: Text("Equipamento: ${dados['equipamento']} " ),),
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
    
              title: Text("Codigo: ${falhas[index].codP} - ${dados['equipamento']}", style: TextStyle(fontSize: 20),),
    
              subtitle: Text("Descriçao: ${falhas[index].descricao}", style: TextStyle(fontSize: 18),),

               trailing: IconButton(
              icon: Icon(Icons.fact_check),
              tooltip: 'clicar para Açoes', 
              onPressed: (){
                dados['id'] = falhas[index].id;
                dados['descricao'] = falhas[index].descricao;
                dados['setor'] = falhas[index].idBox;
                dados['peca'] = falhas[index].codP;
                Navigator.pushNamed(context, '/telaAnalise', arguments: dados);
              }, ),
    
          );
    
      },
    
    ),
        ),
        Container(
      child: Center(child: Text("Validar Alteraçao", style: TextStyle(fontSize: 20),)),
    ),
     Expanded(
                  child: ListView.builder(    
    
      itemCount: falhaFiltro.length,
    
      itemBuilder: (context , index){
    
          return ListTile(
    
              title: Text("Codigo: ${falhaFiltro[index].codP} - ${dados['equipamento']}", style: TextStyle(fontSize: 20),),
    
              subtitle: Text("Descriçao: ${falhaFiltro[index].descricao}", style: TextStyle(fontSize: 18),),

               trailing: IconButton(
              icon: Icon(Icons.fact_check),
              tooltip: 'clicar para Açoes', 
              onPressed: (){
                dados['id'] = falhaFiltro[index].id;
                dados['descricao'] = falhaFiltro[index].descricao;
                dados['setor'] = falhaFiltro[index].idBox;
                dados['peca'] = falhaFiltro[index].codP;
                dados['operacao'] = "validar";
                Navigator.pushNamed(context, '/telaAnalise', arguments: dados);
              }, ),
    
          );
    
      },
    
    ),
     )
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