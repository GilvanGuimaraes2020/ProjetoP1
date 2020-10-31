import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CausaEfeito extends StatefulWidget {
  @override
  _CausaEfeitoState createState() => _CausaEfeitoState();
}

class _CausaEfeitoState extends State<CausaEfeito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulario Causa e Efeito"),
      actions: [
         IconButton(
        icon: Icon(Icons.save),
         onPressed: (){
           setState(() {
              SnackBar(content: Text("Salvo com sucesso") ,
           duration: Duration(seconds: 3),

           );
           Navigator.of(context).pop();

           });
          

         }) ,
      ],),
      body: Column(
        children: [
         
          Column(
            children: [
               
               Row(
                   children: [
                     Container(width: 150 ,child: Text("Material"),),
                     SizedBox(width: 30,),
                      Container(width: 150 ,child: Text("Mão de obra"),),
                      SizedBox(width: 30,),
                      Container(width: 150 ,child: Text("Maquina"),),
                   ],
                 ),
              
              Row(
                children: [
                
                  Container(
                    width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),
                  SizedBox(width: 30,      ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),
                  SizedBox(width: 30,      ),
                   Container(
                     width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),

                ],
              ),
              
              SizedBox(height: 20,),
              
              Row(
                children: [
                 SizedBox(width: 20,),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),
                  SizedBox(width: 30,      ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),
                  SizedBox(width: 30,      ),
                   Container(
                     width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),

                ],),
               
                SizedBox(height: 20,),
              
              Row(
                children: [
                 SizedBox(width: 40,),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),
                  SizedBox(width: 30,      ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),
                  SizedBox(width: 30,      ),
                   Container(
                     width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),

                ],
              ),
            ],
          ),
         
          SizedBox(height: 30,),
          
          Container(
            height: 100,
            child: Row(
              children: [
                Expanded(child: Container()),
                Column(
                  children: [
                    Container(
                      width: 150,
                      child: Text("Efeito:"),),
                      
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1)
                          )
                      ),
                      child: TextField(

                      ),
                    )
                  ],
                )
              ],
            ),
          ),
         
          Column(
            children: [
              Row(children: [
                 SizedBox(width: 40,),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),
                  SizedBox(width: 30,      ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),
                  SizedBox(width: 30,      ),
                   Container(
                     width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),

                ],),
              
              SizedBox(height: 20,),

              Row(
                children: [
                 SizedBox(width: 20,),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),
                  SizedBox(width: 30,      ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),
                  SizedBox(width: 30,      ),
                   Container(
                     width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),

                ],
              ),

              SizedBox(height: 20,),

              Row(
                children: [
                
                  Container(
                    width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),
                  SizedBox(width: 30,      ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),
                  SizedBox(width: 30,      ),
                   Container(
                     width: 150,
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1)
                    )),
                    child: TextField(
                    
                    ),
                  ),

                ],
              ),
            
              SizedBox(height: 20,),

              Row(
                 children: [
                     Container(width: 150 ,child: Text("Meio ambiente"),),
                     SizedBox(width: 30,),
                      Container(width: 150 ,child: Text("Metodo"),),
                      SizedBox(width: 30,),
                      Container(width: 150 ,child: Text("Medida"),),
                   ],
              )
             
            
            ],
          )
        ],
      ),
     /*  floatingActionButton: IconButton(
        icon: Icon(Icons.save),
         onPressed: (){
           SnackBar(content: Text("Salvo com sucesso") ,
           duration: Duration(seconds: 3),
           );
           Navigator.of(context).pop();

         }) , */
    );
  }
}