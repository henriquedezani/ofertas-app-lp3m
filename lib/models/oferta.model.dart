class Oferta {
  String id;
  String nome;
  String empresa;
  double preco;
  String uid;
  double avaliacao;
  int likes;

  Oferta(
      {this.id, this.nome, this.empresa, this.preco, this.uid, this.avaliacao});

  Oferta.fromJson(Map<String, dynamic> json) {
    this.nome = json['nome'];
    this.empresa = json['empresa'];
    this.preco = json['preco'];
    this.uid = json['uid'];
    this.avaliacao = json['avaliacao'];
    this.likes = json['likes'] ?? 0;
    // this.likes = json['likes'] != null ? json['likes'] : 0; // if ternário
  }
}

//json['likes'] ?? 0;

// if(json['likes'] != null)
//   this.likes = json['likes']
// else
//   this.likes = 0
