import 'dart:async';





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_p1_2/UsuariosList.dart';

class TelaShowEquipament extends StatefulWidget {
  @override
  _TelaShowEquipamentState createState() => _TelaShowEquipamentState();
}



class _TelaShowEquipamentState extends State<TelaShowEquipament> {

var db = FirebaseFirestore.instance;
var dbUser = FirebaseFirestore.instance;
bool controlAcess = false;
var controlUser = TextEditingController();
var controlPass = TextEditingController();
String userActive ;
String passActive;

List<Usuarios> usuarios = List();
StreamSubscription<QuerySnapshot> ouvidorU;

  List<Equipamentos> equipament = List();

  
  StreamSubscription<QuerySnapshot> ouvidor;

  @override
  void initState(){
    super.initState();

ouvidorU?.cancel();
   
    ouvidor?.cancel();

    ouvidor = db.collection("equipamentos").snapshots().listen( (res) {

      setState(() {
        equipament = res.docs.map((e) => Equipamentos.fromMap(e.data(), e.id)).toList();
      });
      
    });

     ouvidorU = dbUser.collection('usuarios').snapshots().listen((event) { 
      setState(() {
        usuarios = event.docs.map((e) => Usuarios.fromMap(e.data(), e.id)).toList();

      });
      
    }); 


  }

 void getDocumentById(String id) {

   setState(() {
      dbUser.collection("usuarios").doc(id).get()
      .then((doc){
        
        passActive = doc.data()['senha'];
        
    });

   });
       


  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equipamentos"),

      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('equipamentos').snapshots(),
        builder: (context , snapshot){
           switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text("Erro ao conectar no Firebase"));
            case ConnectionState.waiting:  
              return Center(child: CircularProgressIndicator());
            default: return ListView.builder(
              itemCount: equipament.length,
              itemBuilder: (context , index) {
                return ListTile(
                  title: Text(equipament[index].modelo, style: TextStyle(fontSize: 24),),
                  subtitle: Text(equipament[index].engenheiro, style: TextStyle(fontSize: 18),),
                  trailing: IconButton(
                    icon: Icon(Icons.delete) ,
                    iconSize: 20,
                    onPressed: (){
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Autenticaçao!!!"),
                              content: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'usuario'
                                    ),
                                    controller: controlUser,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'senha'
                                    ),
                                    controller: controlPass,
                                 onTap: (){
                                   setState(() {
                                     String id;
                                     if(equipament[index].engenheiro == controlUser.text ){
                                       userActive = controlUser.text;
                                       for (int i =0; i< usuarios.length; i++){
                                         if (usuarios[i].nome == userActive){
                                         try{
                                           id = usuarios[i].id ;
                                         } on Exception catch (_){
                                           print("nao encontrado ID");
                                         }
                                          break;
                                         }
                                       }
                                     
                                     getDocumentById(id); 
                                     print(passActive);

                                   }
                                   });

                                           }),
                                 
                                

                                ],
                              ),
                             actions: [
                               RaisedButton(
                                 child: Text("OK"),
                                 onPressed: (){
                                   setState(() {
                                    
                                     print(passActive);

                                     if(controlPass.text == passActive){
                                       
                                       db.collection('equipamentos').doc(equipament[index].id).delete();

                                       Navigator.of(context).pop();
                                     }else{
                                         print('Voce nao tem permissao'); 
                                       }
                                     
                                       
                                       

                                   }
                                   
                                   );
                                 },
                               ),
                               RaisedButton(
                                 child: Text("Sair"),
                                 onPressed: (){
                                   Navigator.of(context).pop();
                                 },
                               )
                             ],

                            );
                          }
                        );

                      });

                    },
                  ),

                  onTap: (){
                    showDialog(context: context,
                    builder: (context){
                      return AlertDialog(
                              title: Text("Autenticaçao!!!"),
                              content: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'usuario'
                                    ),
                                    controller: controlUser,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'senha'
                                    ),
                                    controller: controlPass,
                                 onTap: (){
                                   setState(() {
                                     String id;
                                     if(equipament[index].engenheiro == controlUser.text ){
                                       userActive = controlUser.text;
                                       for (int i =0; i< usuarios.length; i++){
                                         if (usuarios[i].nome == userActive){
                                         try{
                                           id = usuarios[i].id ;
                                         } on Exception catch (_){
                                           print("nao encontrado ID");
                                         }
                                          break;
                                         }
                                       }
                                     
                                     getDocumentById(id); 
                                     print(passActive);

                                   }
                                   });

                                           }),
                                 
                                

                                ],
                              ),
                             actions: [
                               RaisedButton(
                                 child: Text("OK"),
                                 onPressed: (){
                                   setState(() {
                                    
                                     print(passActive);

                                     if(controlPass.text == passActive){
                                       
                                        Navigator.pushNamed(context, "/telaCadastroEquip", arguments: equipament[index].id);

                                     }else{
                                       
                                         print('Voce nao tem permissao'); 
                                       }
                                     
                                   }
                                   
                                   );
                                 },
                               ),
                               RaisedButton(
                                 child: Text("Sair"),
                                 onPressed: (){
                                   Navigator.of(context).pop();
                                 },
                               )
                             ],

                            );
                    });

                  },

                );
              },
            );
        }
        }
        ),
        floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        elevation: 0,
        tooltip: 'adicionar equipamento',
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/telaCadastroEquip", arguments: null);
        },
      ),
      backgroundColor: Colors.brown[50],
    );
  }
}