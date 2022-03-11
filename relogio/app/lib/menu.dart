import 'package:flutter/material.dart';

import 'Teste do Relogio/teste_do_relogio.dart';
import 'Widgets/botao_padrao.dart';
import 'Widgets/constantes.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  double _maxValue({double value, double max}) {
    if (value < max) {
      return value;
    } else
      return max;
  }

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var size = MediaQuery.of(context).size;
    var screenHeight = (size.height - appbar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    var containerSize = screenHeight * .35;
    return Scaffold(
      // backgroundColor: Color(0xFFd0cbcb),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text(
                'Teste do Relógio',
                style: TextStyle(
                    fontSize: _maxValue(value: screenHeight * .08, max: 50),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenHeight * .0,
            ),
            BotaoPadrao(
              botaoTexto: 'Iniciar',
              corDoBotao: kCorGradient,
              altura: size.height * .15,
              textSize: .5,
              max_height: 50,
              aoPressionar: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TesteDoRelogio(),
                  ),
                );
              },
            ),
            SizedBox(
              height: screenHeight * .0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                height: containerSize,
                width: size.width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.warning,
                      color: Colors.yellow.shade900,
                      size: containerSize * .3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Se você clicar em Iniciar, o teste se iniciará e o cronômetro começará a correr.',
                        style: TextStyle(
                          fontSize:
                              _maxValue(value: containerSize * .13, max: 21),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
