
import 'package:esp32_realtime/leitura_sensor.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FirebaseService {
  final String baseUrl = 'https://pgrupo8-esp32-default-rtdb.firebaseio.com/';
  final String authToken;

  FirebaseService(this.authToken);

  Future<LeituraSensor?> lerDadosRaiz() async {
    final url = Uri.parse('$baseUrl/.json?auth=$authToken');
    final response = await http.get(url);

    if (response.statusCode == 200 && response.body != 'null') {
      try {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('temperatura') &&
            data.containsKey('velocidade') &&
            data.containsKey('horaLeitura')) {
          return LeituraSensor.fromJson(data);
        }
      } catch (e) {
        print('Erro ao interpretar os dados: $e');
      }
    }
    return null;
  }

  //Enviar o comando para girar o motor para o Firebase.
  Future<void> enviarComandoGiroMotor() async{
    final url = Uri.parse('$baseUrl/comando.json?auth=$authToken');

    try{
      final response = await http.put(
        url,
        body: jsonEncode({
          'girar': true,
          'timestamp': DateTime.now().toIso8601String(),
        }),
      );

      if (response.statusCode == 200){
        print('\n✅ Comando para girar o motor enviado com sucesso!');
      }else{
        print('\n❌ Falha ao enviar o comando: ${response.statusCode}');
        print('    Resposta: ${response.body}');
      }
    }catch(e){
      print('\n❌ Erro ao enviar o comando: $e');
    }
  }
}