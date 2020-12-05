import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:projeto_p1_2/TelaListEquip.dart';

import 'TelaListEquip.dart';
import 'UsuariosList.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {


  var usuario = TextEditingController();
  var senhaUser = TextEditingController();
  var db = FirebaseFirestore.instance;
  bool userAcess = false;
  String userPass;
  String funcao;

  List<Usuarios> usuarios = List();

  StreamSubscription<QuerySnapshot> ouvidor;
 
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
        title: Text("Login"),
      ),

      body: Container(
        child: Column(
          children: [
            Container(
              
              child: ClipRRect(

                     borderRadius: BorderRadius.circular(10),
  
          child: 
          funcao ==null ?
          Image.asset('images/UsuarioX.jpg', scale: 2,) :
          Image.asset('images/' + funcao + '.jpg', scale:2)
          
   ) ),

            TextField(
              decoration: InputDecoration(
                labelText: "usuario",     
                
                ),
                controller: usuario,
                onChanged: (user){
                 print(user);
                 for (int i = 0; i<usuarios.length; i++){
                      if (usuarios[i].nome.contains(usuario.text)) {
                                          print("encontrou " + usuario.text);
                                        } else{
                                          print(usuarios[i].nome);
                                        }

                 }
                 
                 
                  
                },

              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Senha",

                ),
                controller: senhaUser,
                obscureText: true,
                onTap: (){
                  setState(() {
                     for (int i = 0; i<usuarios.length; i++){
                      if (usuarios[i].nome.contains(usuario.text)) {

                        userAcess = true;  
                        userPass = usuarios[i].senha;
                        funcao = usuarios[i].setor;                                                          
                                        }
                 }
                  });
                   
                 if (userAcess == false){
                     showDialog(context: context,
                                       builder: (context){
                                         return AlertDialog(
                                            title: Text("Usuario nao cadastrado"),
                                         );
                                       });
                 }
                 print(userPass + " " + funcao);

                 },
                
                
              ),
              SizedBox(height: 20,     ),
             
              Align(
                alignment: Alignment.center,
                              child: Row(
                  children: [
                    RaisedButton(
                      child: Text("Entrar"),
                      onPressed: (){
                         setState(() {
                          if (userPass == senhaUser.text){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => TelaListEquip(funcao, usuario.text)
                            ));
                          }

                        });
                      },
                    ),
                    SizedBox(width: 50,),
                    RaisedButton(
                      child: Text("Sair"),
                      onPressed: (){
                        bool controlOut = false;
                       setState(() {
                         showDialog(
                           context: context,
                           builder: (context) {
                             return AlertDialog(
                               title: Text("Sair do Login"),
                               content: Text("Tem Certeza que deseja Sair?"),
                               actions: [
                                 FlatButton(
                                   child: Text("Sim"),
                                   onPressed: (){
                                     controlOut = true;
                                   },
                                 ),
                                 FlatButton(
                                    child: Text("Não"),
                                   onPressed: (){
                                     controlOut = false;
                                   },
                                 )

                               ],
                                
                             );
                           },
                         );
                         
                       });
                      if (controlOut == true){
                        Navigator.of(context).pop();
                      }
                    },
                    )
                  ],
                ),
              )
          ],
            )
          
        ),

      
      backgroundColor: Colors.brown[200],
    );
  }
}