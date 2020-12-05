import 'dart:async';
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_p1_2/UsuariosList.dart';

class TelaCadastroEquip extends StatefulWidget {
  @override
  _TelaCadastroEquipState createState() => _TelaCadastroEquipState();
}



class _TelaCadastroEquipState extends State<TelaCadastroEquip> {

  var txtCodigo = TextEditingController();
  var txtEquipamento = TextEditingController();
  var txtStatus = TextEditingController();
  var txtEngenheiro = TextEditingController();
  int x = 0;

  var db = FirebaseFirestore.instance;

  List<Equipamentos> equipamentos = List();

  StreamSubscription<QuerySnapshot> ouvidorx;
 
 @override
  void initState(){
    super.initState();

    //Registrar o "ouvidor" para monitorar qualquer tipo de alteração
    //na coleção Usuarios do FireStore
    ouvidorx?.cancel();

    ouvidorx = db.collection("equipamentos").snapshots().listen( (rex) {

      setState(() {
        equipamentos = rex.docs.map((e) => Equipamentos.fromMap(e.data(), e.id)).toList();
         
    for (int i = 0; i<equipamentos.length; i++){

      if(int.parse(equipamentos[i].codigo) > x){
        x = int.parse(equipamentos[i].codigo);
        
      }
     
    }
     
      });

    });
   
  }
 void getDocumentEquipId(String id) {

   setState(() {
      db.collection("equipamentos").doc(id).get()
      .then((doc){


        txtCodigo.text = doc.data()['codigo'];
        txtEquipamento.text = doc.data()['modelo'];
        txtEngenheiro.text = doc.data()['engenheiro'];
        
        
    });

   });
       


  }
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    

    if (id != null){
      if(txtEngenheiro.text == '' && txtEquipamento.text == ''){
        
        getDocumentEquipId(id);

      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Equipamento"),
        backgroundColor: Colors.red[100],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('equipamentos').snapshots(),
              builder: (context , snapshot) 
              { return Container(
                padding: EdgeInsets.all(50),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  enabled: false,
                  fillColor: Colors.blue[200],
                  labelText: 'Codigo'
                ),
                controller: txtCodigo,
                
              ),
              SizedBox(height: 20,),
              TextField(
                 style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  
                  labelText: "Modelo"
                ),
                controller: txtEquipamento,
              ),
              SizedBox(height: 30,),
             
               TextField(
                 style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  
                  labelText: "Engenheiro"
                ),
                obscureText: false,
                controller: txtEngenheiro,
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(

                    child: Text("Salvar"),
                    onPressed: () async {
                      bool controlOut = false;
                      print(equipamentos.length);
                      for (var v = 0; v<equipamentos.length; v++) {
                        print("Modelo: " +  equipamentos[v].modelo);
                        if (equipamentos[v].modelo == txtEquipamento.text){
                           showDialog(
                                context: context,
                                builder: (context){
                                return AlertDialog(
                                title: Text('Erro!'),
                                content: Text("Equipamento ja cadastrado!"),
                            );
                            
                            }
                              ); 
                              controlOut = true;
                        } 
                      } 
                      if (controlOut == false) {

                        if (id == null){
                        await  db.collection("equipamentos").add({
                                            "codigo" : x+1,
                                             "modelo" : txtEquipamento.text,
                                             "engenheiro" : txtEngenheiro.text,
                                            "status" : false,   
                                                });
                          print("${txtEquipamento.text} adicionado com sucesso");
                          Navigator.of(context).pop();
                        } else{
                          await db.collection('equipamentos').doc(id).update(
                            {
                              'modelo' : txtEquipamento.text,
                              'engenheiro' : txtEngenheiro.text
                            }
                          );
                          Navigator.of(context).pop();

                        }

                        

                          
                      }                
                         
                      
                    }),
                    SizedBox( width: 50,),
                    RaisedButton(
                      child: Text("Cancelar"),
                      onPressed: (){


                      },

                    )
                ],
              ),

            ],

          ),

        );
              }
      ),
      backgroundColor: Colors.brown[100],
      
    );
  }
}
