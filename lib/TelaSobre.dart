import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaSobre extends StatefulWidget {
  @override
  _TelaSobreState createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Projeto para monitorar atividades'),
        backgroundColor: Colors.purple,
      ),
            body: Container(
        color: Colors.black,
        width: double.infinity,
        child: Column(

            children: [
                Container(
        padding: EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('images/Gilvan.jpg' , scale: 8,), //colocar aqui minha foto

        ),
                        ) ,
                        SizedBox(height: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                              SizedBox(width: 70,),
                              Text("Aluno:", style: TextStyle(color: Colors.yellow,
                              fontSize: 18,
                              ),),
                              SizedBox(width: 20,),
                              Text('Gilvan Guimaraes' , style: TextStyle(color: Colors.yellow,
                              fontSize: 18),)

                            ],),
                            Row( children: [
                              SizedBox(width: 70,),
                              Text("Disciplina:", style: TextStyle(color: Colors.yellow,
                              fontSize: 18,
                              ),),
                              SizedBox(width: 20,),
                              Text('Dispositivo moveis' , style: TextStyle(color: Colors.yellow,
                              fontSize: 18),)
                            ],)
                          ],
                        ),
                  SizedBox(height: 20,),
                Text('Projeto Monitor Produçao',
                style: TextStyle(fontSize: 18,
                color: Colors.yellow,
                ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 600,
        child: Center(
          child: Text(
          '\t Este programa monitora produçao, onde os equipamentos sao separados por engenheiros responsaveis ' + 
          'e os colaboradores podem inserir problemas identificados no chao de fabrica, alertando assim o engenheiro ' + 
          'responsavel para que seja executada as correçoes necessarias. \n ' +
          '\t O controle de qualidade tambem é notificado para gerar planos de açao para contençao.' ,
          style: TextStyle(
            fontSize: 18,
            color: Colors.yellow
          ),
          ),
        ),
                )

            ],
          ),
    ),
     );
  }
}