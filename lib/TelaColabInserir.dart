import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColabAddFalha extends StatefulWidget {
  /* String equipamento;
  ColabAddFalha(this.equipamento); */
  @override
  _ColabAddFalhaState createState() => _ColabAddFalhaState();
}

class _ColabAddFalhaState extends State<ColabAddFalha> {

var db = FirebaseFirestore.instance;
 var scanKey = GlobalKey<ScaffoldState>();
 String dropDown = 'Box1';
   //String equipamento = ModalRoute.of(context).settings.arguments;
   var t1 = TextEditingController();
    var t2 = TextEditingController();
   var t3 = TextEditingController();
   var t4 = TextEditingController();
   var t5 = TextEditingController();
   //var t6 = TextEditingController(); 
  
void getDados(Map dados){
 t1.text = dados['equipamento'];
 t2.text = dados ['codigo'];

}

void limparCampos(){
 t1.text = '';
 t2.text = '';
 t3.text = '';
 t4.text = '';
 t5.text = '';
}

  
  @override
  Widget build(BuildContext context) {

   

   Map dados = ModalRoute.of(context).settings.arguments;

  if (dados != null){
    getDados(dados);
  }
  
    return Scaffold(
      appBar: AppBar(title: Text("Identificar Falhas"),),
      key: scanKey,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
        children: [

Text("Equipamento", style: TextStyle(fontSize: 20),),
TextField(
decoration: InputDecoration(
  border: OutlineInputBorder(borderSide: BorderSide() ),
),
controller: t1,
enabled:  false,
),
SizedBox(height: 20,),
Text("Codigo", style: TextStyle(fontSize: 20),),
TextField(
decoration: InputDecoration(
  border: OutlineInputBorder(borderSide: BorderSide() ),
),
controller: t2,
enabled:  false,
),
SizedBox(height: 20,),
Text("Codigo Peça", style: TextStyle(fontSize: 20),),
TextField(
decoration: InputDecoration(
  border: OutlineInputBorder(borderSide: BorderSide() ),
),
controller: t3,
),
SizedBox(height: 20,),
Text("Descriçao da falha", style: TextStyle(fontSize: 20),),
TextField(
decoration: InputDecoration(
  border: OutlineInputBorder(borderSide: BorderSide() ),
),
controller: t4,
),
SizedBox(height: 20,),
Text("Identificaçao do Box", style: TextStyle(fontSize: 20),),
/* TextField(
decoration: InputDecoration(
  border: OutlineInputBorder(borderSide: BorderSide() ),
),
controller: t5,
), */

 DropdownButton<String>(
                value: dropDown,
                items: <String>['Box1' , 'Box2', 'Box3', 'Box4','Box5','Box6','Box7' ]
                .map<DropdownMenuItem <String>>((String value){
                  return DropdownMenuItem <String>(
                    value: value,
                    child: Text(
                      value , style: TextStyle(fontSize: 24),
                    ));
                } ).toList(), 
                             
                onChanged: (String newValue){
                  setState(() {
                    dropDown = newValue;
                    print(dropDown);
                  });
                }),
 SizedBox(height: 20,),
RaisedButton(
            onPressed: () async{

           if(t1.text != '' && t2.text != '' && t3.text != '' &&
           t4.text != '' ) {
              await db.collection('falhas').add({
                
                'codEquip' : t2.text,
                'codPeca' : t3.text,
                'descricao' : t4.text,
                'dpEngenharia' : '',
                'dpQualidade' : '',
                'idBox' : dropDown,
                'status' : '0',
                'usuario' : dados['usuario'],

              });

              limparCampos();

           }   else{
             return showDialog( context:  context,
             builder: (context){
               return AlertDialog(
                 title: Text("Erro!!!"),
                 content: Text("Os Campos devem ser preenchidos!!!"),
               );
             });
           }
             
            } ,
            child: Text("Salvar Dados" , style: TextStyle(fontSize: 20),),

            
            )
        ],
          

        ),
      ),
      backgroundColor: Colors.brown[100],
    );

  }
}