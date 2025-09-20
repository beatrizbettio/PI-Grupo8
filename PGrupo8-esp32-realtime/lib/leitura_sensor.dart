class LeituraSensor {
  double temperatura;
  double velocidade;
  String horaLeitura;

  LeituraSensor({
    required this.temperatura,
    required this.velocidade,
    required this.horaLeitura,
  });

  factory LeituraSensor.fromJson(Map<String, dynamic> json) {
    return LeituraSensor(
      temperatura: (json['temperatura'] as num).toDouble(),
      velocidade: (json['velocidade'] as num).toDouble(),
      horaLeitura: json['horaLeitura'] as String,
    );
  }

  @override
  String toString() {
    return  '\n---- 🔄 LEITURA DOS DADOS DOS SENSORES ----\n'
            'Temperatura: $temperatura °C | Velocidade: $velocidade RPM | Hora da Leitura: $horaLeitura';
  }
}