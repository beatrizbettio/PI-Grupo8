import 'package:esp32_realtime/firebase_service.dart';
import 'package:esp32_realtime/leitura_dao.dart';

// Função de ETL para executar automaticamente a sincronização das leituras reais.
Future<void> sincronizarFirebaseComMySQL(FirebaseService firebaseService, LeituraDao leituraDao) async {
  print('\n[SINC] Iniciando sincronização automática (ETL)...');
  
  // Extração das leituras do Firebase
  var leiturasDoFirebase = await firebaseService.lerLeituras();
  if (leiturasDoFirebase.isEmpty) {
    print('[SINC] Nenhuma leitura nova no Firebase para sincronizar.');
    return;
  }
  print('[SINC] ${leiturasDoFirebase.length} leituras encontradas. Carregando no MySQL...');
  
  // TRANSFORMAR E CARREGAR (Transform & Load)
  int processadas = 0;
  for (var leitura in leiturasDoFirebase) {
    // O Transform foi feito pelo fromJson do FirebaseService, e o Load no MySQL.
    await leituraDao.inserirLeitura(leitura);
    processadas++;
  }
  print('[SINC] Sincronização automática concluída! $processadas leituras processadas.');
}