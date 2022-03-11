import 'package:app/Widgets/botao_padrao.dart';
import 'package:app/Widgets/constantes.dart';
import 'package:flutter/material.dart';

import 'relogio.dart';
import 'resultado.dart';

class TesteDoRelogio extends StatefulWidget {
  TesteDoRelogio({Key key}) : super(key: key);
  @override
  State<TesteDoRelogio> createState() {
    return TesteDoRelogioState();
  }
}

class TesteDoRelogioState extends State<TesteDoRelogio> {
  var tempo = Stopwatch()..start();

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var size = MediaQuery.of(context).size;
    var screenHeight = (size.height - appbar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
        //appBar: appbar,
        body: SingleChildScrollView(
      child: Column(
        children: [
          Relogio(
            clockHeight: size.height * .7,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: kMargemDosWidgets),
                    child: BotaoPadrao(
                      botaoTexto: 'Voltar',
                      corDoBotao: kCorGradient,
                      altura: size.height * .1,
                      textSize: .5,
                      max_height: 50,
                      aoPressionar: () {
                        updatePosition();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: kMargemDosWidgets, left: kMargemDosWidgets),
                    child: BotaoPadrao(
                      botaoTexto: 'Finalizar',
                      corDoBotao: kCorGradient,
                      altura: size.height * .1,
                      textSize: .5,
                      max_height: 50,
                      aoPressionar: () {
                        tempo.stop();
                        int min = (tempo.elapsedMilliseconds);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Resultado(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

/*  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'clock_screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }
  */