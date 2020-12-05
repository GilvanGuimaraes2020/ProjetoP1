import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_p1_2/UsuariosList.dart';





// ignore: must_be_immutable
class TelaListEquip extends StatefulWidget {
String funcao;
String usuario;
TelaListEquip(this.funcao , this.usuario);

  @override
  _TelaListEquipState createState() => _TelaListEquipState();
}

class _TelaListEquipState extends State<TelaListEquip> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var addEquip = TextEditingController();
  List<Equipamentos> equipamento = List();
  
   
  var nomeEquipamento ;
  bool teste = false;

 var db = FirebaseFirestore.instance;


StreamSubscription<QuerySnapshot> ouvidor;

@override
void initState(){

  super.initState();
  ouvidor?.cancel();

if (widget.funcao == "Engenharia"){
 ouvidor = db.collection('equipamentos').where('engenheiro', isEqualTo: widget.usuario).snapshots().listen((res) { 
    setState(() {
      
      equipamento = res.docs.map((e) => Equipamentos.fromMap(e.data(), e.id)).toList();

    });

  });
} else{
  ouvidor = db.collection('equipamentos').snapshots().listen((res) { 
    setState(() {
      
      equipamento = res.docs.map((e) => Equipamentos.fromMap(e.data(), e.id)).toList();

    });

  });
}
 

}

Widget cabecalho(){
  return Text(widget.funcao + ": " + widget.usuario);
}



Widget geraLista(){
  return StreamBuilder<QuerySnapshot>(
    stream: db.collection('equipamentos').snapshots(),
    builder: (context , snapshots){
      switch (snapshots.connectionState){
        case (ConnectionState.none):
        return Center(child: Text("Erro ao conectar"));

        case (ConnectionState.waiting):
        return Center(child: CircularProgressIndicator());

       default: return ListView.builder(
         itemCount: equipamento.length,
        itemBuilder: (context , index){
            var dados = Map();
                            dados['usuario'] = widget.usuario;
                            dados['equipamento'] = equipamento[index].modelo;
                            dados['codigo'] = equipamento[index].codigo;
          return ListTile(
            title: Text(equipamento[index].modelo, style: TextStyle(fontSize: 24),),
            subtitle: Text(equipamento[index].engenheiro, style: TextStyle(fontSize: 18),),
            trailing: widget.funcao == "Engenharia"? IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){


                Navigator.pushNamed(context, '/telaMonitorEng' , arguments: dados);
                
              },
            ) : widget.funcao == "Colaborador" ? IconButton(
              icon: Icon(Icons.sync_problem),
              onPressed: (){
               
                
                Navigator.pushNamed(context, '/telaColabInserir' , arguments: dados);
              },
            ) : IconButton(
              icon: Icon(Icons.rule),
              onPressed: (){
                Navigator.pushNamed(context, '/telaQualidade', arguments: dados);
              },
            ) ,
          );
        }
      );
      }
      
    },

    

  );
}


  @override
  Widget build(BuildContext context) {

  
 
    return Scaffold(
appBar: AppBar(title: cabecalho(),),

body: 
        geraLista(),
  
);
 

    
  

  }
}
