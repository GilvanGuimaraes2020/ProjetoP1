

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaEngenharia extends StatefulWidget {
  @override
  _TelaEngenhariaState createState() => _TelaEngenhariaState();
}

class _TelaEngenhariaState extends State<TelaEngenharia> {
bool checkPrcd = false;
bool checNPrcd = false; 
var descrControl = TextEditingController();
var scanKey = GlobalKey<ScaffoldState>();

var db = FirebaseFirestore.instance;



  @override
  Widget build(BuildContext context) {
Map dados = ModalRoute.of(context).settings.arguments;
String equipamento;


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
  descricao = "Sem Dados ";
  setor = "Sem Dados";
  codigo = "Sem Dados";
  
} else{
  equipamento = dados['equipamento'];
  
  
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

    

      Padding(
        padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
        child: Row(
          children: [
            
            Column(
              children: [
                Container(
                  height: 80,
                  width: 200,
                  child: Column(
                    children: [
                      Text("Equipamento:"),
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(labelText: "$equipamento"),
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )),

                
                   Container(
                      height: 80,
                  width: 200,
                  child: Column(
                    children: [
                      Text("Desciçao::"),
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(labelText: "$descricao"),
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )),

                   Container(
                      height: 80,
                  width: 200,
                  child: Column(
                    children: [
                      Text("Setor:"),
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(labelText: "$setor"),
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )),

                   Container(
                      height: 80,
                  width: 200,
                  child: Column(
                    children: [
                      Text("codigo:"),
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(labelText: "$codigo"),
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )),
              ],
            ),
            SizedBox(width: 100,),
          
 
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
                                child: Center(child: Text("Codigo peça: ${dados['peca']}"))),
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
                        SizedBox( height: 10,),
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            border: Border.all(width: 1)
                          ),
                          child: Center(child: Text("Disposição para Ação corretiva"),),
                        ),

                        TextFormField(
                         enabled: checkPrcd,
                         decoration: InputDecoration(
                           labelText: 'Inserir Ações',
                         ),
                         controller: descrControl,
                          ),
                          SizedBox(height: 10,),
                          RaisedButton(
                            child: Text("Salvar Informação"),
                            onPressed: () async {
                              String descreveEng;
                              String statusEng;
                              if (checkPrcd != true){
                                descreveEng = "";
                                statusEng = '6';
                              } else{
                                descreveEng = descrControl.text;
                                statusEng = '2';
                              }
                              await db.collection('falhas').doc(dados['id']).update({
                                'dpEngenharia': descreveEng,
                                'status' : statusEng

                              });


                              Navigator.of(context).pop();
                            },

                          )
                      ],
                    ),
                  )
              ],
            )
           
          ],
        ),
      )
            ],
            
          ),

        ),
      
    );
  }
}