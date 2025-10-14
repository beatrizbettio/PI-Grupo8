
import 'dart:io';

import 'package:esp32_realtime/auth_service.dart';
import 'package:esp32_realtime/firebase_service.dart';
import 'package:esp32_realtime/leitura_sensor.dart';

void main() async {
print('\n---- Console de Monitoramento e Controle de Motores e Esteiras Transportadoras do ESP32 ----');

  // Cria uma instância do serviço de autenticação.
  AuthService authService = AuthService();
  // Chama o método para autenticar e aguarda o token.
  String? token = await authService.autenticarAnonimamente();

  if (token == null) {
    print('❌ Não foi possível autenticar.');
    return;
  }

  // Cria uma instância do serviço do Firebase, passando o token obtido.
  FirebaseService firebase = FirebaseService(token);

  while(true){
    print('\n📊 Menu de Monitoramento e Controle do ESP32:');
    print('1 - 🌡️    Leitura dos sensores');
    print('2 - ⚙️    Controle do Motor');
    print('3 - 🚪   Sair');
    stdout.write('Opção: ');

    String? opcao = stdin.readLineSync();

    switch(opcao){
      case '1':
        List<LeituraSensor> leituras = await firebase.lerLeituras();
        if (leituras.isNotEmpty) {
          for (var leitura in leituras) {
            print(leitura);
          }
        } else {
          print('❌ Nenhuma leitura encontrada ou dados inválidos.');
        }
        break;   
       
      case '2':
        //Chama o método para enviar o comando ao Firebase.
        await firebase.enviarComandoGiroMotor();  
        break;

      case '3':
        print('\nEncerrando...');
        return;

      default:
        print('\n❌ Opção inválida! Tente novamente.');
    }
  }
}