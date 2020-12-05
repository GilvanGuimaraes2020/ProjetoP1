import 'dart:async';
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_p1_2/UsuariosList.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}



class _TelaCadastroState extends State<TelaCadastro> {

  var txtSetor = TextEditingController();
  var txtNome = TextEditingController();
  var txtSenha = TextEditingController();
  var txtConfirmaSenha = TextEditingController();
  var db = FirebaseFirestore.instance;

  List<Usuarios> usuarios = List();

  StreamSubscription<QuerySnapshot> ouvidor;
 String dropDown = "Qualidade";
 @override
  void initState(){
    super.initState();

    //Registrar o "ouvidor" para monitorar qualquer tipo de alteração
    //na coleção Usuarios do FireStore
    ouvidor?.cancel();

    ouvidor = db.collection("usuarios").snapshots().listen( (res) {

      setState(() {
        usuarios = res.docs.map((e) => Usuarios.fromMap(e.data(), e.id)).toList();
      });

    });


  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Usuario"),
        backgroundColor: Colors.red[100],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('usuarios').snapshots(),
              builder: (context , snapshot) 
              { return Container(
          child: Column(
            children: [
              /* TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  
                  labelText: "Setor"
                ),
                controller: txtSetor,
              )
               */
              DropdownButton<String>(
                value: dropDown,
                items: <String>['Colaborador' , 'Qualidade', 'Engenharia']
                .map<DropdownMenuItem <String>>((String value){
                  return DropdownMenuItem <String>(
                    value: value,
                    child: Text(
                      value , style: TextStyle(fontSize: 24),
                    ));
                } ).toList(), 
                
                onChanged: (String newValue){
                  setState(() {
                    dropDown = newValue;
                    print(dropDown);
                  });
                  
                }),
              SizedBox(height: 10,),
              TextField(
                 style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  
                  labelText: "Nome"
                ),
                controller: txtNome,
              ),
              SizedBox(height: 30,),
              TextField(
                 style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  
                  labelText: "Senha Numerica"
                ),
                obscureText: true,
                controller: txtSenha,
              ),
              SizedBox(height: 30,),
               TextField(
                 style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  
                  labelText: "Confirmar Senha"
                ),
                obscureText: true,
                controller: txtConfirmaSenha,
              ),
              SizedBox(height: 30,),
              RaisedButton(
                child: Text("Salvar"),
                onPressed: () async {
                  print(usuarios.length);
                  for (var v = 0; v<usuarios.length; v++) {
                    print("nomes: " +  usuarios[v].nome);
                    if (usuarios[v].nome == txtNome.text){
                       showDialog(
    context: context,
     builder: (context){
     return AlertDialog(
     title: Text('Nome ja em uso'),
     content: Text("entrar novamente"),
 );
 
 }
  ); 

  
                    }
                  }
                 
                     if (txtSenha.text == txtConfirmaSenha.text){
                    await  db.collection("usuarios").add({
                      
                      "nome" : txtNome.text,
                      "senha" : txtSenha.text,
                      "setor" : dropDown,             
                      

                    });



                      print("${txtNome.text} adicionado com sucesso");
                      Navigator.of(context).pop();
                    } else{
                    showDialog(context: context,
                    builder: (context) { return AlertDialog(
                      title: Text("Senhas incompativeis"),
                      content: Text("Digitar novamente as senhas"),
                      actions: [FlatButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                       child: Text("ok"),
                    )]
                    );
                    }
                    );
                      print("Senhas incompativeis");
                    } 
                  
                })
            ],

          ),

        );
              }
      ),
      backgroundColor: Colors.brown[100],
      
    );
  }
}
