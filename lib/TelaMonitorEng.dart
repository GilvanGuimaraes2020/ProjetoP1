import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaMonitorEng extends StatefulWidget {
  @override
  _TelaMonitorEngState createState() => _TelaMonitorEngState();
}

class _TelaMonitorEngState extends State<TelaMonitorEng> {




var scaffoldKey = GlobalKey<ScaffoldState>();
var addEquipamento = TextEditingController();

var equipamento = List<String>();
@override 
void initState (){
equipamento.add('VTX5022');
equipamento.add('VTX3515');
equipamento.add('PTX7010');
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Nome do engenheiro"),

      ),

      body:
      
       Container(
         padding: EdgeInsets.all(40),
        
         child: Column(
           children: [
             Row(
               children: [
                  Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: addEquipamento,
                    decoration: InputDecoration(
                      labelText: 'Adicionar tarefa',
                    ),
                  ),
                ),

                SizedBox(width: 30),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: (){
                    setState(() {
                      equipamento.add(addEquipamento.text);
                      addEquipamento.text = '';
                      
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 30,),
                 Expanded(
                                    child: ListView.separated(

                   
                          itemBuilder: (context,index){
                            return Container(
                              child: ListTile(
                                leading: Icon(Icons.slideshow_outlined),
                                title: Text(equipamento[index], style: TextStyle(fontSize: 24)),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete_outline),
                                  onPressed: (){
                                    setState(() {
                                      equipamento.removeAt(index);

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

                          itemCount: equipamento.length

                        ),
                 ),
               ],
             ),
           ],
         ),
       ),
    );
  }
}