import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColabAddFalha extends StatefulWidget {
  /* String equipamento;
  ColabAddFalha(this.equipamento); */
  @override
  _ColabAddFalhaState createState() => _ColabAddFalhaState();
}

class _ColabAddFalhaState extends State<ColabAddFalha> {

  
  @override
  Widget build(BuildContext context) {

    var scanKey = GlobalKey<ScaffoldState>();
   String equipamento = ModalRoute.of(context).settings.arguments;
  // var t1 = TextEditingController();
   var t2 = TextEditingController();
   var t3 = TextEditingController();
   var t4 = TextEditingController();
   var t5 = TextEditingController();
   var t6 = TextEditingController();
   var dados = Map();



    return Scaffold(
      appBar: AppBar(title: Text("Identificar Falhas"),),
      key: scanKey,
      body: Column(
      children: [
        SizedBox(height: 20,),
        Row(
           children: [
            Container(
              width: 200,
              child: Text("Equipamento: ", style: TextStyle(fontSize: 20),)) ,
             Expanded(child: Container(
                child:
                 Center(
                   child: Container(
                    
                     width: 200,
                     child: Center(child: Text("Data ocorrencia: " , style: TextStyle(fontSize: 20),))),
                 ),)),
             Container(
               
               width: 200,
               child: Center(child: Text("Setor: ", style: TextStyle(fontSize: 20),)),
             )

          ],
        ),

        
        Row(
          children: [
            Container(
              width: 200,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( width: 1)
                )
              ),
              child: TextField(
               // controller: t1,

               decoration: InputDecoration(
                 labelText: equipamento,
                 labelStyle: TextStyle(fontSize: 20)
               ),
               enabled: false,
              )
              
              )  ,

           Expanded(child: Container(
                child:
                 Center(
                   child: Container(
                     decoration: BoxDecoration(
                       border: Border(
                         bottom: BorderSide(width: 1)
                       )
                     ),
                     width: 200,
                     child: TextField(
                       controller: t2,
                       decoration: InputDecoration(
                         labelStyle: TextStyle(fontSize: 20)
                       ),
                     )
                     ),
                 ),)),

              Container(
               
               decoration: BoxDecoration(
                 border: Border(
                   bottom: BorderSide(width: 1)
                 )
               ),
               width: 200,
               child: TextField(
                 controller: t3,
                 decoration: InputDecoration(
                   labelStyle: TextStyle(fontSize: 20)
                 ),
               ),
             ) 

          ],
        ),

        SizedBox(height: 40),

        Row(
          children: [
            Container(
              width: 200,
              child: Text("Conjunto: ", style: TextStyle(fontSize: 20),)) ,
             Expanded(child: Container(
                child:
                 Center(
                   child: Container(
                    
                     width: 200,
                     child: Center(child: Text("Descriçao: " , style: TextStyle(fontSize: 20),))),
                 ),)),
             Container(
               
               width: 200,
               child: Center(child: Text("Codigo Operador: ", style: TextStyle(fontSize: 20),)),
             )

          ],
        ),

        

      Row(
         children: [
            Container(
              width: 200,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( width: 1)
                )
              ),
              child: TextField(
                controller: t4,
               decoration: InputDecoration(
                 
                 labelStyle: TextStyle(fontSize: 20)
               ),
               
              )
              
              )  ,

           Expanded(child: Container(
                child:
                 Center(
                   child: Container(
                     decoration: BoxDecoration(
                       border: Border(
                         bottom: BorderSide(width: 1)
                       )
                     ),
                     width: 200,
                     child: TextField(
                       controller: t5,
                       decoration: InputDecoration(
                         labelStyle: TextStyle(fontSize: 20)
                       ),
                     )
                     ),
                 ),)),

              Container(
               
               decoration: BoxDecoration(
                 border: Border(
                   bottom: BorderSide(width: 1)
                 )
               ),
               width: 200,
               child: TextField(
                 controller: t6,
                 decoration: InputDecoration(
                   labelStyle: TextStyle(fontSize: 20)
                 ),
               ),
             ) 

          ],
        ),

        SizedBox(height: 50),

     

        RaisedButton(
          onPressed: (){
            setState(() {
              dados['equipamento'] = equipamento;
              dados['data'] = t2.text;
              dados['setor'] = t3.text;
              dados['conjunto'] = t4.text;
              dados['descricao'] = t5.text;
              dados['codigo'] = t6.text;

 scanKey.currentState.showSnackBar(
   SnackBar(content: Text("Salvo com sucesso"),
   duration: Duration(seconds: 3),)
 );

 
              print(dados['equipamento']);
              print(dados['data']);              
              print(dados['setor']);
              print(dados['conjunto']);
              print(dados['descricao']);
              print(dados['codigo']);
              Navigator.pushNamed(context, '/telaEngenharia' ,  arguments: dados);
            });
          } ,
          child: Text("Salvar Dados" , style: TextStyle(fontSize: 20),),

          
          )

      ],
        
      ),
    );
  }
}