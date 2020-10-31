

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_p1_2/TelaListEquip.dart';
//import 'package:projeto_p1_2/TelaMonitorEng.dart';





// ignore: must_be_immutable
class TelaLogin extends StatefulWidget {
  var funcao;


TelaLogin(this.funcao);


  @override
  _TelaLoginState createState() => _TelaLoginState();
}


class _TelaLoginState extends State<TelaLogin> {


 var controlUser =TextEditingController();
var controlPass = TextEditingController();
var validarUser = GlobalKey<FormState>();
var validarPass = GlobalKey<FormState>();
String funcao;
String usuario;
bool verUsuario;
List<String> listEng = ['Daniel.Souza' , 'Carlos.Silva'];
List<String> listColab = ['Paulo.Souza' , 'Marcos.Silva'];
List<String> listQaul = ['Gilvan.Guimaraes'];

void salvar(String funcao){
setState(() {
  //Utilizando mesma senha para todos para otimizar
  usuario = controlUser.text;
  if(funcao == "Engenharia"){
    if (listEng.contains(usuario) && controlPass.text == '123')
       endereco();
    else 
    alerta();
  } else if (funcao == "Colaborador"){
    if (listColab.contains(usuario) && controlPass.text == '123')
       endereco();
    else 
    alerta();
  } else if (funcao == "Qualidade"){
    if (listQaul.contains(usuario) && controlPass.text == '123')
       endereco();
    else
    alerta();
  } 
    }
     );
}

 void endereco(){
       Navigator.push(context, MaterialPageRoute(
                          builder: (context) => TelaListEquip(funcao , usuario) ));
    }    

 void alerta(){
  showDialog(
    context: context,
     builder: (context){
     return AlertDialog(
     title: Text('Usuario ou senha errada'),
     content: Text("entrar novamente"),
 );
 }
  ); 
 }
  @override
  Widget build(BuildContext context) {
    Future <bool> onWillPop(){
      return showDialog<bool>(context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Deseja Sair?'),
        actions: <Widget> [
          RaisedButton(
            child: Text('Ok'),
            onPressed: (){
              Navigator.pop(context , true);
          }),

          RaisedButton(
            child: Text('Cancelar'),
            onPressed: (){
              Navigator.pop(context , false);
            })
        ],
      )
      );
    }
    return WillPopScope(onWillPop: onWillPop ,
          child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Login ' + widget.funcao )),          
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
             onPressed: (){
              Navigator.maybePop(context);
             }),
          
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
                  child: Container(
            
            padding: EdgeInsets.all(20),
            color: Colors.blue[100],
            child: Column(
              children: [
                 // Imagem
                
                Container(

                  
                  padding: EdgeInsets.all(20),
                  child: ClipRRect(

                     borderRadius: BorderRadius.circular(10),
  
          child: Image.asset('images/' + widget.funcao +'.jpg', scale: 2,))
      
                  ),
                     
            
                // usuario
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    key: validarUser,
                    
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      labelStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.person),
                    ),
                    controller: controlUser ,
                     onChanged: (usuario) {
                       if ((listEng.contains(usuario) && widget.funcao == "Engenharia" )||
                       (listQaul.contains(usuario) && widget.funcao == "Qualidade" )||
                       (listColab.contains(usuario) && widget.funcao == "Colaborador")){
                         print(usuario);
                         verUsuario = true;
                       } else{
                         verUsuario = false;
                       }
                      
                    }, 
                  ),
                ),

                // campo da senha
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                   obscureText: true,
                    decoration: InputDecoration(                    
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.lock),
                    ),
                    key: validarPass,
                    controller: controlPass,
                    onTap: (){
                      if (verUsuario == false){
                        showDialog(context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Usuario nao cadastrado'),
                            content: Text('Cadastrar Usuario'),
                          );
                        }
                        );
                      }
                    },
                    
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    child: Text('Entrar' , style: TextStyle(color: Colors.white),),
                    color: Colors.black12,
                    onPressed: (){
                      funcao = widget.funcao;
                      
                      salvar(funcao);
                      },

                      ),
                     
                  ),
                    
                
              ],

            ),
          ),
        ),
        
        
      ),
    );
  }

}

