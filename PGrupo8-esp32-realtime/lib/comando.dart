import 'package:esp32_realtime/motor.dart';
import 'package:esp32_realtime/usuario.dart';

class Comando {
  final int idcomando;
  final DateTime data;
  final String origem;
  final Motor motor; 
  final Usuario usuario; 

  // Construtor da classe.
  Comando({
    required this.idcomando,
    required this.data,
    required this.origem,
    required this.motor,
    required this.usuario,
  });

  // Método estático (factory) fromJson, converte um mapa JSON em um objeto.
  static Comando? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    // Bloco try-catch para evitar erros se o JSON tiver um formato inesperado.
    try {
      // Tenta fazer o parse dos objetos aninhados.
      final Motor? motor = Motor.fromJson(json['motor']);
      final Usuario? usuario = Usuario.fromJson(json['usuario']);

      // Se o motor ou o usuário forem inválidos, o comando inteiro é inválido.
      if (motor == null || usuario == null) {
        print('Erro: Motor ou Usuário dentro do objeto de comando está nulo ou malformado.');
        return null;
      }

     return Comando(
        idcomando: json['idcomando'],
        data: DateTime.parse(json['data']),
        origem: json['origem'],
        motor: motor,
        usuario: usuario,
      );
    } catch (e) {
      print('Erro ao fazer parse de Comando: $e');
      return null;
    }
  }

  // Método toJson, converte um objeto de volta para um mapa de dados (JSON), como por exemplo, para envio ao Firebase.
  Map<String, dynamic> toJson() => {
    'idcomando': idcomando,
    'data': data.toIso8601String(), // Converte a data para o formato de string padrão ISO 8601.
    'origem': origem,
    'motor': motor.toJson(),       // Aninha os dados do motor
    'usuario': usuario.toJson(),   // Aninha os dados do usuario.
  };
}