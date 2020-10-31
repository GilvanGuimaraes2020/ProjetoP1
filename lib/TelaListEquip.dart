import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:projeto_p1_2/TelaQualidade.dart';




// ignore: must_be_immutable
class TelaListEquip extends StatefulWidget {
String funcao;
String usuario;
TelaListEquip(this.funcao , this.usuario);

  @override
  _TelaListEquipState createState() => _TelaListEquipState();
}

class _TelaListEquipState extends State<TelaListEquip> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var addEquip = TextEditingController();
  var equipDaniel = List<String>();
  var equipCarlos = List<String>();
  var equipTotal = List<String>();
  
   
   
  var nomeEquipamento ;
  bool teste = false;

  @override
  void initState(){
    //Forma lista para o Engenheiro responsavel
if (widget.usuario == "Daniel.Souza"){
  equipDaniel.add("VTX5022");
    equipDaniel.add("VTX6030");
    equipDaniel.add("PTX7010");
} else if(widget.usuario == "Carlos.Silva"){

  equipCarlos.add("VTX9040");
    equipCarlos.add("TMPB6000");
} else{
  //Formar lista para colaboradores e qualidade
    equipDaniel.add("VTX5022");
    equipDaniel.add("VTX6030");
    equipDaniel.add("PTX7010");
    
    equipCarlos.add("VTX9040");
    equipCarlos.add("TMPB6000");
}
    print(widget.usuario + " " + widget.funcao);

    super.initState();
  }


Widget cabecalho(){
  return Text(widget.funcao + ": " + widget.usuario);
}
// Linha 56 ate 186 se referem aos widget da Engenharia
Widget geraLista(){
  return Container(
    child:
 ListView.separated(
                itemBuilder: (context,index){
                  return Container(
                    child: ListTile(
                      //leading: Icon(Icons.slideshow_outlined),
                      title: Text(equipTotal[index], style: TextStyle(fontSize: 24)),
                      enabled: true,
                      onTap: (){
                        setState(() {
                          showDialog(context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Sem funçao implementada"),
                              content: Text("Implementar funçao Parte II"),
                              actions: [
                                TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  }, 
                                  child: Text("OK"))
                              ],
                            );
                          });

                        });
                      } ,
                      trailing: IconButton(
                        icon: Icon(Icons.delete_outline),
                        onPressed: (){
                          setState(() {
                            equipDaniel.removeAt(index);

                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text('Tarefa removida com sucesso.'),
                                duration: Duration(seconds: 3),
                              ),
                            );  


                          });
                        },
                      ),
                    ),
                  );
                },

                separatorBuilder: (context, index){
                  return Divider(thickness: 1, color: Colors.grey);
                },

                itemCount: equipTotal.length

              )

  );
}

Widget addEquipamento(){
  return Container( 
    child:
Column(
  children: [
        Row(
    
                  children: [
    
                    Expanded(
    
                      child: TextField(
    
                        controller: addEquip,
    
                        decoration: InputDecoration(
    
                          labelText: 'Adicionar Equipamento',
    
                        ),
    
                      ),
    
                    ),
    
    
    
                    SizedBox(width: 30),
    
                    IconButton(
    
                      icon: Icon(Icons.add),
    
                      onPressed: (){
    
                        setState(() {
    
                          equipDaniel.add(addEquip.text);
    
                          addEquip.text = '';
    
                          scaffoldKey.currentState.showSnackBar(
    
                            SnackBar(
    
                              content: Text('Equipamento adicionada com sucesso.'),
    
                              duration: Duration(seconds: 3),
    
                            ),
    
                          ); 
    
                        });
    
                      },
    
                    )
    
                  ],
    
                ),
                SizedBox(height: 20,),

              Row(
                children: [
                  Expanded(
                     child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(),
                     color: Colors.grey[500],
                      child: Center(
                        child: Text("Verificar abaixo falhas identificada nos equipamentos", 
                        style: TextStyle(
                          fontSize: 20
                        ),),
                      ),
                    ),
                  )
                ],
              )
  ],
),
  );
}
  // finalizou os widgets da engenharia e começa os do colaboradores
 // Linha 189 ate 217 se refere ao widget do Colaborador
Widget geraListaColab(){
 
  return Container(
    child:
 ListView.separated(
                itemBuilder: (context,index){
                  return Container(
                    child: ListTile(
                      //leading: Icon(Icons.slideshow_outlined),
                      title: Text(equipTotal[index], style: TextStyle(fontSize: 24)),
                      enabled: true,
                      onTap: (){
                      if (widget.funcao == "Qualidade")  {
                       Navigator.push(context, MaterialPageRoute(
                         builder: (context) => TelaQualidade(equipTotal.elementAt(index),
                          widget.usuario)));
                      } else if (widget.funcao == "Colaborador"){
                        
                        Navigator.pushNamed(context, '/telaColabInserir', arguments: equipTotal.elementAt(index));                         
                          
                      }
                      } ,
                     
                    ),
                  );
                },

                separatorBuilder: (context, index){
                  return Divider(thickness: 1, color: Colors.grey);
                },

                itemCount: equipTotal.length

              )

  );
}
//Finalizou o widget do colaborador



  @override
  Widget build(BuildContext context) {

     equipTotal = equipCarlos + equipDaniel;
    if (widget.funcao == "Engenharia"){

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: cabecalho(),),
      body: Container(
        padding: EdgeInsets.all(40),
         child: Column(
          children: [
          addEquipamento(),
           
            SizedBox(height: 30,),
 
            Expanded(
              child: 
              geraLista()
            ),
          
          ],
        ), 
      ),
    );
  }
  else if(widget.funcao == "Colaborador"){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: cabecalho(),),

        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    
                    child: 
                  Container(
                    height: 50,
                    color: Colors.grey,
                    child: Center(
                      child: Text("Selecione abaixo equipamento que apresenta falha!",
                      style: TextStyle(fontSize: 20),),
                    )
                  )),
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: geraListaColab()
              )
            

            ],
          ),
        
        ),

    );

  } else if (widget.funcao == "Qualidade"){
    return Scaffold(
      appBar: AppBar(title: cabecalho(),),

      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20,
            ),
            Row(
              children: [
                Expanded(child: Container(
                  color: Colors.grey,
                  child: Text("Selecione abaixo equipamento para gerar plano de açao",
                  style: TextStyle(fontSize: 24),),
                )),

              ],
            ),
            SizedBox(height: 20,),

            Expanded(child: geraListaColab())

          ],
        
        ),
      ),

    );
  } 
  else{
    return Scaffold(
appBar: AppBar(),

body: Container(
  child: geraLista(),
)
 ,

    );
  } 

  }
}


