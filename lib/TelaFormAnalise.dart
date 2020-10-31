import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnaliseFalha extends StatefulWidget {
  @override
  _AnaliseFalhaState createState() => _AnaliseFalhaState();
}

class _AnaliseFalhaState extends State<AnaliseFalha> {

  var t1 = TextEditingController();
  var t2 = TextEditingController(); 
  var t3 = TextEditingController();
  var t4 = TextEditingController();
  var t5 = TextEditingController();

  var scankey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scankey,
      appBar: AppBar(title: Text("Formulario Analise Falha"),),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Text("Local da Falha: "),
                Expanded(child: Container()),
                 Container(
                   width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1
                        ),
                      )
                    ),
                    child: TextField(
                      controller: t1,
                    ),
                ) 
              ],
            ),
             SizedBox(height: 20,),
            Row(
              children: [
                Text("Processo anterior: "),
                Expanded(child: Container()),
                 Container(
                   width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1
                        ),
                      )
                    ),
                    child: TextField(
                      controller: t2,
                    ),
                ) 
              ],
            ),
             SizedBox(height: 20,),
            Row(
              children: [
                Text("Processo Seguinte: "),
                Expanded(child: Container()),
                 Container(
                   width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1
                        ),
                      )
                    ),
                    child: TextField(
                      controller: t3,
                    ),
                ) 
              ],
            ),
             SizedBox(height: 20,),
            Row(
              children: [
                Text("Motivo da falha: "),
                Expanded(child: Container()),
                 Container(
                   width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1
                        ),
                      )
                    ),
                    child: TextField(
                      controller: t4,
                    ),
                ) 
              ],
            ),
             SizedBox(height: 20,),
            Row(
              children: [
                Text("Operadores envolvidos: "),
                Expanded(child: Container()),
                 Container(
                   width: 500,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1
                        ),
                      )
                    ),
                    child: TextField(
                      controller: t5,
                    ),
                ) 
              ],
            ),
            SizedBox(height: 30,),
            Center(child: 
            RaisedButton(
              child: Text("Salvar Dados"),
              onPressed: (){
               setState(() {
                 t1.text = '';
                 t2.text = '';
                 t3.text = '';
                 t4.text = '' ;
                 t5.text = ' ';
                 scankey.currentState.showSnackBar(
                  SnackBar(content: Text("Salvo com sucesso"),
                  duration: Duration(seconds: 3),
                  ));


               });


              })
            
            )
          ],
        ),
      ),
      
    );
  }
}