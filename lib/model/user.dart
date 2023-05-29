class User {
  int id;
  String nome;
  String email;
  String foto;
  String atualizadoEm;
  String criadoEm;

  User({
    required this.id,
    required this.nome,
    required this.email,
    required this.foto,
    required this.atualizadoEm,
    required this.criadoEm,
  });

  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      foto: json['foto'],
      atualizadoEm: json['atualizado_em'],
      criadoEm: json['criado_em'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'foto': foto,
      'atualizado_em': atualizadoEm,
      'criado_em': criadoEm,
    };
  }
}
