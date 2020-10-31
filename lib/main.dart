
import 'package:flutter/material.dart';
import 'package:projeto_p1_2/TelaColabInserir.dart';
import 'package:projeto_p1_2/TelaEngenharia.dart';
import 'TelaInicial.dart';
//import 'TelaLogin.dart';

void main() {
  runApp(MaterialApp(
   
   debugShowCheckedModeBanner: false,
    title: 'Login',
    home: TelaInicial(),
     //initialRoute: '/telaInicial',
    routes: {
      '/telaInicial': (context) => TelaInicial(),
     '/telaColabInserir' : (context) => ColabAddFalha(),
       '/telaEngenharia' : (context) => TelaEngenharia(),
     /*  '/telaCadastro' : (context) => TelaCadastroUser() */

    }, 

  )
  );
}
/*
fazer tela com os equipamentos do engenheiro responsavel
fazer tela com lista de problemas que colaborador pode inserir
Apresentar para o engenheiro lista de problemas identificadas pelo colaborador
Fazer as trocas das imagens
Fazer na TelaListEquip layout para operador e qualidade

*/