import 'package:flutter/material.dart';
import 'dart:math';

class EscapePodScreen extends StatefulWidget {
  const EscapePodScreen({super.key});

  @override
  State<EscapePodScreen> createState() => _EscapePodScreenState();
}

class _EscapePodScreenState extends State<EscapePodScreen> {
  String _selectedCategory = 'Trabalho';
  String _currentExcuse = "Selecione uma categoria e gere sua liberdade.";
  bool _isGenerating = false;

  final Map<String, List<String>> _excuses = {
    'Trabalho': [
      "Minha internet caiu e o técnico disse que é um problema na 'rebimboca da parafuseta' do modem.",
      "Comi um iogurte vencido em 2018 e estou vendo cores que não existem.",
      "Meu gato deletou a apresentação e estou tentando recuperar os dados mentalmente.",
      "Estou preso numa atualização do Windows que diz 'Não desligue' há 4 horas.",
    ],
    'Encontro': [
      "Minha avó acabou de fugir do asilo e está pilotando um kart.",
      "Lembrei que deixei meu peixe dourado fora d'água para tomar sol.",
      "Meu ex-namorado(a) acabou de virar meu vizinho de porta.",
      "Recebi um chamado urgente para ser testemunha de um casamento online.",
    ],
    'Festa': [
      "Minha bateria social acabou e não trouxe o carregador.",
      "Tenho que levar meu cacto para passear, ele está muito estressado.",
      "Descobri que sou alérgico a pessoas depois das 22h.",
      "O horóscopo disse que se eu sair de casa hoje, Plutão colide com a Terra.",
    ],
    'Família': [
      "Estou ajudando um amigo a mudar de casa... na Austrália.",
      "Peguei uma virose que só é contagiosa para parentes de segundo grau.",
      "Tenho um compromisso inadiável com minha cama e a Netflix.",
    ]
  };

  void _generateExcuse() async {
    setState(() {
      _isGenerating = true;
    });

    // Simulate AI thinking
    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() {
      final List<String> list = _excuses[_selectedCategory] ?? [];
      _currentExcuse = list[Random().nextInt(list.length)];
      _isGenerating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GERADOR DE DESCULPAS"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Selecione o Cenário:",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCategory,
                  dropdownColor: const Color(0xFF2C2C2C),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  items: _excuses.keys.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCategory = newValue!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(20),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    blurRadius: 15,
                  )
                ],
              ),
              child: Center(
                child: _isGenerating
                    ? CircularProgressIndicator(color: Theme.of(context).primaryColor)
                    : Text(
                        _currentExcuse,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _generateExcuse,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                "GERAR DESCULPA INFALÍVEL",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
