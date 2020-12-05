class Usuarios{
  String id;
  String nome;
  String senha;
  String setor;

  Usuarios(this.id, this.nome, this.senha, this.setor);

  Usuarios.fromMap(Map<String , dynamic>map , String id) {
    this.id = id ?? '';
    this.nome = map['nome'];
    this.senha = map['senha'];
    this.setor = map['setor'];

  }
}

class Equipamentos{
  String id;
  String codigo;
  bool status;
  String engenheiro;
  String modelo;

  Equipamentos(this.id, this.codigo, this.status, this.engenheiro, this.modelo);

  Equipamentos.fromMap(Map<String , dynamic>map , String id) {
    this.id = id ?? '';
    this.codigo = map['codigo'];
    this.status = map['status'];
    this.engenheiro = map['engenheiro'];
    this.modelo = map['modelo'];

  }
}

class Falhas{
  String id;
  String codE;
  String codP;
  String descricao;
  String dpEng;
  String dpQual;
  String idBox;
  String status;
  String usuario;
  

  Falhas(this.id, this.codE, this.codP , this.descricao,
  this.dpEng, this.dpQual, this.idBox, this.status,  this.usuario);

  Falhas.fromMap(Map<String , dynamic>map , String id) {
    this.id = id ?? '';
    this.codE = map['codEquip'];
    this.codP = map['codPeca'];
    this.descricao = map['descricao'];
    this.dpEng = map['dpEngenharia'];
    this.dpQual = map['dpQualidade'];
    this.idBox = map['idBox']; 
    this.status = map['status'];    
    this.usuario = map['usuario'];

  }
}