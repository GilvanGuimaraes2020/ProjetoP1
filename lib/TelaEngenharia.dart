

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaEngenharia extends StatefulWidget {
  @override
  _TelaEngenhariaState createState() => _TelaEngenhariaState();
}

class _TelaEngenhariaState extends State<TelaEngenharia> {
bool checkPrcd = false;
bool checNPrcd = false; 
bool valor1 = false;
bool valor2 = false;
bool valor3 = false;
var scanKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
Map dados = ModalRoute.of(context).settings.arguments;
String equipamento;
String data;
String conjunto;
String descricao;
String setor;
String codigo;
 
/* Widget semDados(){
  return Text(
    "SEM DADOS",
    style: TextStyle(
      color: Colors.red,
      fontStyle: FontStyle.italic
    ),

  );
} */

if (dados == null){
  equipamento = "Sem Dados";
  data = "Sem Dados";
  conjunto = "Sem Dados";
  descricao = "Sem Dados ";
  setor = "Sem Dados";
  codigo = "Sem Dados";

  
} else{
  equipamento = dados['equipamento'];
  data = dados [ 'data'];
  conjunto = dados['conjunto'];
  descricao = dados['descricao'];
  setor = dados['setor'];
  codigo = dados['codigo'];
}



    return Scaffold(
      appBar: AppBar(title: Text("Preview informaçoes engenharia",
      style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.green[100],),
      key: scanKey,
      body: Container(
          color: Colors.yellow[200],
          height: 600,
          child: Column(
            children: [
      Row(
        children: [
          Expanded(child: Container(
            height: 100,
            child: Center(child: Text(" Equipamento: " + equipamento,
            style: TextStyle(fontSize: 20),),),
          )),
          
        ],
      ),

      Wrap(
        direction: Axis.horizontal,
        spacing: 50,
        children: [
         RaisedButton(onPressed: (){},
          
          child: Text("Chassi"),
          color: Colors.green[200],),
          RaisedButton(onPressed: (){},
          child: Text("Elevador"),
          color: Colors.grey,),
           RaisedButton(onPressed: (){},
          child: Text("Caixa"),
          color: Colors.grey,),
          RaisedButton(onPressed: (){},
          child: Text("Cabeçalho"),
          color: Colors.grey,) 

        ],
      ),
      SizedBox(height: 50,),
      Row(
        children: [
          SizedBox(width: 50,),
          Column(
            children: [
              Wrap(
                direction: Axis.vertical,
                spacing: 50,
                children: [
                  Row(
                    children: [
                       Container(
                       decoration: BoxDecoration(
                         border:Border.all(width: 1)
                       ),
                       width: 100,
                       height: 50,
                       child: Column(
                         children: [
                           Center(child: Text("Equipamento")),
                           Center(child: Text(equipamento, style: TextStyle(color: Colors.red),)),
                         ],
                       ),
                      ),
                      SizedBox(width: 50,),
                      Container(
                       decoration: BoxDecoration(
                         border:Border.all(width: 1)
                       ),
                       width: 100,
                       height: 50,
                       child: Column(
                         children: [
                           Center(child: Text("Data: ")),
                           Center(child: Text(data, style: TextStyle(color: Colors.red),)),
                         ],
                       ),
                      ),
                    ],
                  ),
                  
                  Row(
                    children: [
                       Container(
                       decoration: BoxDecoration(
                         border:Border.all(width: 1)
                       ),
                       width: 100,
                       height: 50,
                       child: Column(
                         children: [
                           Center(child: Text("Conjunto: ")),
                           Center(child: Text(conjunto, style: TextStyle(color: Colors.red),)),
                         ],
                       ),
                      ),
                      SizedBox(width: 50,),
                      Container(
                       width: 100,
                       height: 50,
                       decoration: BoxDecoration(
                         border:Border.all(width: 1)
                       ),
                       child: Column(
                         children: [
                           Center(child: Text("Descriçao: ")),
                           Center(child: Text(descricao,style: TextStyle(color: Colors.red),)),
                         ],
                       ),
                      ),
                    ],
                  ),
                
                  Row(
                    children: [
                       Container(
                       decoration: BoxDecoration(
                         border:Border.all(width: 1)
                       ),
                       width: 100,
                       height: 50,
                       child: Column(
                         children: [
                           Center(child: Text("Codigo: ")),
                           Center(child: Text(codigo, style: TextStyle(color: Colors.red),)),
                         ],
                       ),
                      ),
                      SizedBox(width: 50,),
                      Container(
                       width: 100,
                       height: 50,
                       decoration: BoxDecoration(
                         border:Border.all(width: 1)
                       ),
                       child: Column(
                         children: [
                           Center(child: Text("Setor")),
                           Center(child: Text(setor , style: TextStyle(color: Colors.red),)),
                         ],
                       ),
                      ),
                    ],
                  ),
                 
                ],
              ),
            ],
          ),
          SizedBox(width: 50,),
          Column(
            children: [
              Container(
                  height: 250,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            
                              child: Container(
                               
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                border: Border(
                                  bottom: BorderSide(width: 1)
                                )
                              ),
                              child: Center(child: Text("Chassi"))),
                          ),
                        ],
                      ),
                      //SizedBox(height: 20,),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.platform,
                              title: Text("Procede"),
                              value: checkPrcd, 
                              onChanged: (value){
                                setState(() {
                                  checkPrcd = value;
                                  if (checkPrcd == true){
                                    checNPrcd = false;
                                  }                                
                                  print(checkPrcd);
                                });
                              }),
                          ),
                             Container(
                               width: 180,
                               child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.platform,
                            title: Text("Nao Procede"),
                            value: checNPrcd, 
                            onChanged: (value){
                                setState(() {
                                   checNPrcd = value;
                                   if (checNPrcd == true){
                                     checkPrcd = false;
                                     
                                   }
                                  print(checNPrcd);
                                });
                            }),
                             ) 
                        ],
                      ),
                      Expanded(
                        
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            border: Border.all(width: 1)
                          ),
                          child: Center(child: Text("Categoria das Ações"),),
                        )),
                      Row(
                         
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(width: 1)
                                  )
                                ),
                                child: Center(child: Text("Açoes "),)),
                             // SizedBox(width: 20,),
                              Wrap(
                                  direction: Axis.vertical,
                                  children: [
                                      Container(
                                      height: 50,
                                      width: 170,
                                      child: CheckboxListTile(
                                        value: valor1, 
                                        title: Text("Materiais"),
                                        onChanged: (value){
                                          setState(() {                                              
                                             if(checNPrcd == true) {
                                              valor1 = false;
                                            } else{
                                              valor1 = value;
                                            }  
                                          });
                                        }),
                                    ),
                                      Container(
                                        height: 50,
                                        width: 170,
                                        child: CheckboxListTile(
                                        value: valor2, 
                                        title: Text("Processo"),
                                        onChanged: (value){
                                          setState(() {                                              
                                           if(checNPrcd == true) {
                                              valor2 = false;
                                            } else{
                                              valor2 = value;
                                            }  
                                          });
                                        }),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 170,
                                        child: CheckboxListTile(
                                        value: valor3, 
                                        title: Text("Projeto"),
                                        onChanged: (value){
                                          setState(() {     
                                            if(checNPrcd == true) {
                                              valor3 = false;
                                            } else{
                                              valor3 = value;
                                            }                                       
                                            
                                          });
                                        }),
                                      ),

                                  ],
                                ),
                                RaisedButton(

                                  hoverColor: Colors.yellow,
                                  color: Colors.black54,
                                  child: Text("Gerar Relatorio",
                                  style: TextStyle(color: Colors.deepOrange[100]),),
                                  onPressed: (){
                                    setState(() {
                                      if (dados != null){
                                         showDialog(context: context,
                                      builder: (context){
                                        return AlertDialog(
                                          title: Text("Sem Açoes implementadas"),
                                          content: Text("Iplementar funçao na parte II"),
                                          actions: [
                                            TextButton(
                                              child: Text("OK"),
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        );
                                      });

                                      } else{
                                        scanKey.currentState.showSnackBar(
                                        SnackBar(content: Text("Sem dados para implementaçao"),
                                        duration: Duration(seconds: 2),
                                        )

                                        );
                                      }
                                     
                                    });
                                    
                                  })
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
            ],
          )
        ],
      )
            ],
            
          ),

        ),
      
    );
  }
}