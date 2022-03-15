import 'package:app/Widgets/botao_padrao.dart';
import 'package:app/Widgets/constantes.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
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
  var tempo;
  void iniciarCronometro() {
    tempo = Stopwatch()..start();
  }

  final screenshot_controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var size = MediaQuery.of(context).size;
    var screenHeight = (size.height - appbar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Screenshot(
      controller: screenshot_controller,
      child: Scaffold(
          //appBar: appbar,
          backgroundColor: Color(0xFFd0cbcb),
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
                          padding:
                              const EdgeInsets.only(left: kMargemDosWidgets),
                          child: BotaoPadrao(
                            botaoTexto: 'Voltar',
                            corDoBotao: kCorGradient,
                            altura: size.height * .1,
                            textSize: .5,
                            max_height: 50,
                            aoPressionar: () {
                              tempo = null;
                              updatePosition();
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: kMargemDosWidgets,
                              left: kMargemDosWidgets),
                          child: BotaoPadrao(
                            botaoTexto: 'Finalizar',
                            corDoBotao: kCorGradient,
                            altura: size.height * .1,
                            textSize: .5,
                            max_height: 50,
                            aoPressionar: () async {
                              final image =
                                  await screenshot_controller.capture();
                              if (image == null) return;
                              // filePath = await saveImage(image);
                              // var _image = MemoryImage(image);
                              // print(_image);
                              Future<ui.Image> _image = bytesToImage(image);

                              var tempoDeConclusao = pararCronometro();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Resultado(
                                    tempoConclusao: tempoDeConclusao,
                                    screenshot: Image.memory(image),
                                  ),
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
          )),
    );
  }

  static Future<ui.Image> bytesToImage(Uint8List imgBytes) async {
    ui.Codec codec = await ui.instantiateImageCodec(imgBytes);
    ui.FrameInfo frame = await codec.getNextFrame();
    return frame.image;
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