


//import 'package:cloud_firestore/cloud_firestore.dart';










import 'package:flutter/material.dart';
import 'package:projeto_p1_2/TelaCadastroEquip.dart';

import 'package:projeto_p1_2/TelaColabInserir.dart';
import 'package:projeto_p1_2/TelaEngenharia.dart';
import 'package:projeto_p1_2/TelaFormAnalise.dart';
//import 'package:projeto_p1_2/TelaListEquip.dart';
import 'package:projeto_p1_2/TelaLogin.dart';
import 'package:projeto_p1_2/TelaMonitorEng.dart';
import 'package:projeto_p1_2/TelaQualidade.dart';
import 'package:projeto_p1_2/TelaShowEquipamento.dart';
import 'TelaCadastro.dart';
import 'TelaInicial.dart';
//import 'dart:async';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


//import 'TelaLogin.dart';

void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
   
   // Registrar no app

   


   debugShowCheckedModeBanner: false,
    title: 'Login',
    home: TelaInicial(),
     //initialRoute: '/telaInicial',
    routes: {
      '/telaInicial': (context) => TelaInicial(),
     '/telaColabInserir' : (context) => ColabAddFalha(),
       '/telaEngenharia' : (context) => TelaEngenharia(),
      '/telaCadastro' : (context) => TelaCadastro(), 
      '/telaLogin' :(context) => TelaLogin(),
      '/telaShowEquipamento' : (context) => TelaShowEquipament(),
      '/telaCadastroEquip' : (context) => TelaCadastroEquip(),
      '/telaQualidade' : (context) => TelaQualidade(),
      '/telaMonitorEng' : (context) => TelaMonitorEng(),
      '/telaAnalise' : (context) => AnaliseFalha()
      

    }, 

  )
  );
 //Teste do Firebase
  /* var db = FirebaseFirestore.instance;
  db.collection("equipamentos").add(
    {
      "modelo" : "CTX20000",
      "engenheiro" : "Marcio",
      "codigo" : "102",
      "status" : false,
    }
  );
   */
  /* db.collection("cafes").doc("cafe001").set(
    {
      "nome" : "Café Três Corações 500g",
      "preco" : "R\$ 11.20",
    }
  ); */
  
  



}
/*
Duvidas para tirar com o professor
 *? Problema para apresentar listview dentro de um container



 
 TELAS CORRIGIDAS 
 TELA INICIAL 
 TELA SOBRE
 TELA LOGIN
 TELA CADASTRO
 TELA CADASTROEQUIP
 TELA LISTEQUIP (tentar colocar um texto sobre o listview, ou no appbar)
 TELA COLABINSERIR 
 --TelaEngenharia
 

 regras
 *** O Status 1 e 0 no banco, seta-lo se o equipamento tiver pendencias
 *** para serem corrigidas;

 *** Criar um codigo para o equipamento para definir as peças que lhe pertencem

 Pendencia
 
 *** Criar tela para cadastro de conjuntos atribuindo elas aos equipamentos pelos codigos
 *** Criar tela para apresentar um filtro onde contem todos os equipamentos e status da ocorrencia
 *** Colocar a tela de monitoramento da falha com privilegios para engenharia e qualidade
 *** Tela listequipament formar lista de todos os equipamentos cadastrados
 * OK 05 Verificar modelo feito em IHM para inserir na tela colabinserir
 * OK 06 Fazer regra para listar para qualidade e engenharia somente os equipamentos com falha
 * 07 Finalizar container onde engenharia entra com disposiçao , telaEngenharia

fazer tela com os equipamentos do engenheiro responsavel
fazer tela com lista de problemas que colaborador pode inserir
Apresentar para o engenheiro lista de problemas identificadas pelo colaborador
Fazer as trocas das imagens
Fazer na TelaListEquip layout para operador e qualidade

*/