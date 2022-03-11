import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  int min;
  final Image screenshot;
  Resultado({this.min, this.screenshot});

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var size = MediaQuery.of(context).size;
    var screenHeight = (size.height - appbar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "resultado",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              container_padrao(
                altura: size.height * .07,
                largura: size.width,
                filho: texto(
                  text: 'Critérios para a avaliação',
                ),
              ),
              container_padrao(
                altura: size.height * .1,
                largura: size.width,
                filho: texto(
                  text:
                      'Avaliação dos resultados (Escore de Shulman): Ponto de corte: 3',
                ),
              ),
              container_padrao(
                // altura: size.height * .1,
                largura: size.width,
                filho: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    texto(
                      text:
                          '0 - Inabilidade absoluta para representar o relógio;',
                    ),
                    texto(
                      text:
                          '1 - O desenho tem algo a ver com o relógio, mas com desorganização visuoespacial grave;',
                    ),
                    texto(
                      text:
                          '2 - Desorganização visuiespacial moderada que leva a uma marcação de hora incorreta, perseveração, confusão esquerda-direita, números faltando, números repetidos, sem ponteiros, com ponteiros em excesso;',
                    ),
                    texto(
                      text:
                          '3 - Distribuição visuoespacial correta com marcação errada da hora;',
                    ),
                    texto(
                      text:
                          '4 - Pequenos erros espaciais com dígitos e hora corretos;',
                    ),
                    texto(
                      text: '5 - Relógio perfeito;',
                    ),
                  ],
                ),
              ),
              //
              SizedBox(
                height: size.height * .051,
              ),
              //

              Row(
                children: [
                  Text(
                    'Pontuação:',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 5),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 5),
                          )),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget container_padrao({double altura, double largura, Widget filho}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: largura,
        height: altura,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: filho,
      ),
    );
  }

  var estilo_texto = TextStyle(fontSize: 20);

  Widget texto({text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: estilo_texto,
      ),
    );
  }
}
