import 'package:flutter/material.dart';
import 'relogio.dart';

class RespostaDoPaciente extends StatelessWidget {
  final double time;
  final Image paciente_screenshot;

  const RespostaDoPaciente({Key key, this.time, this.paciente_screenshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resposta do Paciente'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: tempo == null
                  ? const Text(
                      'O paciente não moveu nenhum número',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    )
                  : Text(
                      'Tempo de conclusão: $time segundos.',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                'Print do relógio feito pelo paciente:',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            paciente_screenshot,
          ],
        ),
      ),
    );
  }
}
