import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_p1_2/TelaLogin.dart';
import 'package:projeto_p1_2/TelaSobre.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}




class _TelaInicialState extends State<TelaInicial> {

String funcao;

void salvar(String funcao){

  
setState(() {
  Navigator.push(
   context, MaterialPageRoute(
     builder: (context) => TelaLogin(funcao)
     ));
});
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(
          child: 
        Text('Monitoramento de Produção',
        style: TextStyle( fontSize: 25, fontStyle: FontStyle.italic,),),),
         backgroundColor: Colors.purple,

        ),

        /*
        Scaffold relacionado aos Logins
        */
        drawer: new Drawer(
         
          child: Scaffold(
            appBar: AppBar(
              title: Text('Escolher Login'),

            ),
            body: Container(
              color: Colors.blue[100],
              child: ListView(
                children:<Widget> [

                  // tela do login da engenharia
                  Expanded(
                                  child: new Container(
                      child: TextButton(
                        child: Text('Engenharia'),
                        
                        onPressed: (){
                          funcao = 'Engenharia';
                          salvar(funcao);
                        } ,
                      ),
                      color: Colors.black,
                    ),
                  ),

                  // Tela de login dos colaboradores
                Expanded(
                                  child: new Container(
                      child: TextButton(
                        child: Text('Colaborador'),
                        onPressed: (){
                          funcao = 'Colaborador';
                          salvar(funcao);
                        } ,
                      ),
                      color: Colors.black,
                    ),
                  ),

                   // Tela de login da qualidade
                Expanded(
                                  child: new Container(
                      child: TextButton(

                        child: Text('Qualidade'),

                        onPressed: (){
                          funcao = 'Qualidade';
                          salvar(funcao);
                        } ,
                      ),
                      color: Colors.black,
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
        
        body: 
            Container(
             height: 600,
             width: double.infinity,
             color: Colors.black,
             child:  Column(
      children: [
      /*  Text('Aluno: Gilvan', 
        style: TextStyle(
          fontSize: 30,
          color: Colors.white),),
          Text('Projeto Monitoramento de Produçao', 
        style: TextStyle(
          fontSize: 30,
          color: Colors.white),),*/
          SizedBox(height: 50,  ),
        Center(
          child: ClipRRect(
            child:  Image.asset('images/linhaProducao.jpg', scale: 1,)),
        ),
    
        TextButton(   
                 
          onPressed: (){
           Navigator.push(context, MaterialPageRoute(
             builder: (context) => TelaSobre()));
          }, 
          child: Text('Informações Aplicativo', 
          style: TextStyle(fontSize: 40,
          fontStyle: FontStyle.italic ),))
      ],
    
    )
      )
    );

  }
}
