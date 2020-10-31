

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_p1_2/TelaFormAnalise.dart';
import 'package:projeto_p1_2/TelaFormCausaEfeito.dart';

// ignore: must_be_immutable
class TelaQualidade extends StatefulWidget {

  String nomeEquip;
  String usuario;

  TelaQualidade(this.nomeEquip, this.usuario);


  @override
  _TelaQualidadeState createState() => _TelaQualidadeState();
}

class _TelaQualidadeState extends State<TelaQualidade> {

  bool valcheck = false;
  bool valcheck1 = false;
  bool valcheck2 = false;
  

  criaTabela() {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      //padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Table(
            defaultColumnWidth: FixedColumnWidth(250),
            border: TableBorder(
              horizontalInside: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              verticalInside: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),
            children: [
              _criarcabecalho("Engenheiro, Conjunto Falha, Data"),
              _criarLinhaTable("Carlos.Silva, Chassi,10/06/2020 "),
              _criarLinhaTable("Carlos.Silva, Elevador, 05/05/2020"),
              _criarLinhaTable("Carlos.Silva, Engate, 20/10/2020"),
            ],
          ),
        ],
      ),
    );
  }
  
   _criarcabecalho(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }
  
  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          child: TextButton(
            child: Text(name),
            onPressed: (){
              setState(() {
                showDialog(context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text("Comando sem Funçao"),
                    content: Text("Implementar na parte II"),
                    actions: [
                      FlatButton(onPressed: (){
                        Navigator.of(context).pop();
                      } 
                      
                      , child: Text("Fechar"))

                    ],

                    );
                }
                  );
                

              });
            }
            ,
            //style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Equipamento " + widget.nomeEquip),),
      body: Column(
children: [
Container(
  //height: 100,
  width: double.maxFinite,
  padding: EdgeInsets.all(20),

  color: Colors.grey,

  child: Text("Verificar abaixo equipamentos com falhas e marcar açoes",
  style: TextStyle(fontSize: 20),),

),


SizedBox(height: 20,) , 


criaTabela(),
SizedBox(height: 20,),
Container(

  child: Text("Propor Açoes",
  style: TextStyle(fontSize: 20),),
  
),
SizedBox(height: 20,),

  Row(
    children: [
      Container(

        width: 250,
      child:   CheckboxListTile(

        
      
        title: Text("Analise Falha") ,
      
        secondary: Icon(Icons.replay_circle_filled, color: Colors.cyan,),
      
        controlAffinity: ListTileControlAffinity.platform,
      
        value: valcheck , 
      
        onChanged: (value){
      
          setState(() {
      
            valcheck = value;

            if (valcheck == true) {
              
            showDialog(context: context,
            builder: (context) {
             return AlertDialog(
               title: Text("Formulario Analise Falha"),
               content: Text("Deseja Gerar Formulario"),
               actions: [
 FlatButton(onPressed: (){
                   setState(() {
                     
                     Navigator.of(context).pop();
                   });
                 }, child: Text("Não Gerar")),

                 FlatButton(onPressed: (){
                   setState(() {
                     
                     Navigator.push(context, MaterialPageRoute(
                       builder: (context) => AnaliseFalha()));
                   });
                 }, child: Text("Gerar"))
               ],


             );
            });
            }
          });
          
          }),
),
Container(

        width: 250,
      child:   CheckboxListTile(
      
        title: Text("Causa e Efeito") ,
      
        secondary: Icon(Icons.compare_arrows, color: Colors.cyan,),
      
        controlAffinity: ListTileControlAffinity.platform,
      
        value: valcheck1 , 
      
        onChanged: (value){
      
          setState(() {
     // var estado = String;
     
            valcheck1 = value;
            
            if (valcheck1 == true) {
            showDialog(context: context,
            builder: (context){
              return  AlertDialog(
                title: Text("Relatorio Causa e Efeito"),
                content: Text("Deseja gerar relatorio"),

                actions: [
                   FlatButton(
                    onPressed: (){
                      setState(() {
                        
                       
                          Navigator.of(context).pop();
                        
                         
                      });
                    }, 
                    child: Text("Não Gerar")
                    ),
                  
                  FlatButton(
                    onPressed: (){
                      setState(() {
                        
                       
                          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CausaEfeito()));
                        
                         
                      });
                    }, 
                    child: Text("Gerar")
                    )
                ],


              );
            });

           
            }
          });
          
          }),
),
Container(

        width: 250,
      child:   CheckboxListTile(
      
        title: Text("Brainstorming") ,

       
      
        secondary: Icon(Icons.people_alt, color: Colors.cyan,),
      
        controlAffinity: ListTileControlAffinity.platform,
      
        value: valcheck2 , 
      
        onChanged: (value){
      
          setState(() {
      
            valcheck2 = value;
            if (value == true) {
              
              showDialog(context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Funçao nao implementada"),
          content: Text("Implementar funçao parte II"),
          actions:  [
            btnOk(),
          ]
        );
      });
      
            }
      
          });
          
          }),
),
    ],
  ),
]
      ),
    
    );
  }
  Widget btnOk(){
    return FlatButton(
      child: Text("ok"),
      onPressed: (){
        Navigator.of(context).pop();
      },
    );
  }
}