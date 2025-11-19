## Sistema de Monitoramento e Controle de Motores e Esteiras Transportadoras - Grupo 8

### Sobre o Projeto
Este projeto consiste em uma aplicação de console desenvolvida em Dart para o monitoramento industrial e controle de dispositivos IoT (ESP32). O sistema utiliza o Firebase Realtime Database para o armazenamento dos dados em tempo real (temperatura e velocidade) e envio de comandos remotos. Para garantir a integridade e o histórico dos dados corporativos (Empresas, Setores, Esteiras, etc.), foi implementada uma camada de persistência em MySQL. Essa estrutura relacional alimenta, por fim, dashboards estratégicos de Business Intelligence no Power BI, permitindo a análise de tendências e tomadas de decisão baseadas em dados.

### Tecnologias
* **Linguagem:** Dart (Console Application)
* **Banco de Dados Relacional:** MySQL
* **Banco de Dados NoSQL/Tempo Real:** Firebase Realtime Database
* **IoT:** Arduino ESP32 
* **Business Intelligence:** Microsoft Power BI

### Pendências para Instalação
* Instalação do Dart SDK;
* Instalação do MySQL e Workbench;
* Configuração do Arduino (Bibliotecas Utilizadas: Adafruit Unified Sensor, ArduinoJson, DHT sensor library, Firebase Arduino Client Library for ESP8266 and ESP32, Firebase ESP32 Client);
* Conector MySQL do Power BI;
* Atualizar dependências do Dart, credenciais do banco e, no arduino, as credenciais para rede Wi-Fi. 

## Integrantes
* Beatriz de Cassia Bettio (RA 25000311)
* Eduardo Mangueira de Castro Moraes (RA 25001267)
* Ester de Lima Machado (RA 25001040)
* Gabriel Ricardo da Cunha (RA 25001820)
* João Pedro de Souza Serafim (RA 25001002)
* Sandy de Souza Lima (RA 25000821)
