import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Usuario {
  final String nome;
  final String nomeDeUsuario;
  final String email;
  final Endereco endereco;
  final Empresa empresa;

  Usuario({
    required this.nome,
    required this.nomeDeUsuario,
    required this.email,
    required this.endereco,
    required this.empresa,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nome: json['name'],
      nomeDeUsuario: json['username'],
      email: json['email'],
      endereco: Endereco.fromJson(json['address']),
      empresa: Empresa.fromJson(json['company']),
    );
  }
}

class Endereco {
  final String rua;
  final String cidade;

  Endereco({required this.rua, required this.cidade});

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
      rua: json['street'],
      cidade: json['city'],
    );
  }
}

class Empresa {
  final String nome;

  Empresa({required this.nome});

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
      nome: json['name'],
    );
  }
}

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Usuários',
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
        )
      ),
      home: const TelaListaUsuarios(),
    );
  }
}

class TelaListaUsuarios extends StatefulWidget {
  const TelaListaUsuarios({super.key});

  @override
  _EstadoTelaListaUsuarios createState() => _EstadoTelaListaUsuarios();
}

class _EstadoTelaListaUsuarios extends State<TelaListaUsuarios> {
  late Future<List<Usuario>> futureUsuarios;

  @override
  void initState() {
    super.initState();
    futureUsuarios = buscarUsuarios();
  }

  Future<List<Usuario>> buscarUsuarios() async {
    final resposta = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (resposta.statusCode == 200) {
      List<dynamic> corpo = jsonDecode(resposta.body);
      List<Usuario> usuarios = corpo.map((dynamic item) => Usuario.fromJson(item)).toList();
      return usuarios;
    } else {
      throw Exception('Falha ao carregar usuários');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
      ),
      body: Center(
        child: FutureBuilder<List<Usuario>>(
          future: futureUsuarios,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Usuario usuario = snapshot.data![index];
                  return ListTile(
                    title: Text(usuario.nome),
                    subtitle: Text(usuario.endereco.rua),
                    onTap: () {
                      // Navega para a tela de detalhes ao clicar em um item.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaDetalhesUsuario(usuario: usuario),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              // Caso padrão.
              return const Text('Nenhum usuário encontrado.');
            }
          },
        ),
      ),
    );
  }
}

class TelaDetalhesUsuario extends StatelessWidget {
  final Usuario usuario;

  const TelaDetalhesUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(usuario.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _construirLinhaDetalhe('Nome:', usuario.nome),
            _construirLinhaDetalhe('Nome de Usuário:', usuario.nomeDeUsuario),
            _construirLinhaDetalhe('Email:', usuario.email),
            _construirLinhaDetalhe('Cidade:', usuario.endereco.cidade),
            _construirLinhaDetalhe('Empresa:', usuario.empresa.nome),
          ],
        ),
      ),
    );
  }

  Widget _construirLinhaDetalhe(String rotulo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        '$rotulo $valor',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}