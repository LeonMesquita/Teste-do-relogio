import 'package:flutter/material.dart';
import 'constantes.dart';

class BotaoPadrao extends StatefulWidget {
  final String botaoTexto;
  final Function() aoPressionar;
  final Gradient corDoBotao;
  final double textSize;
  final double altura;
  final double largura;
  double max_height;
  BotaoPadrao(
      {Key key,
      this.botaoTexto,
      this.aoPressionar,
      this.corDoBotao = kCorGradient,
      this.textSize = .5,
      this.altura,
      this.largura,
      this.max_height = 30})
      : super(key: key);

  @override
  State<BotaoPadrao> createState() => _BotaoPadraoState();
}

class _BotaoPadraoState extends State<BotaoPadrao> {
  double _maxValue({double value, double max}) {
    if (value < max) {
      return value;
    } else
      return max;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.altura,
      decoration: BoxDecoration(
        gradient: widget.corDoBotao,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: widget.aoPressionar,
        child: Text(
          widget.botaoTexto,
          style: TextStyle(
              fontSize: _maxValue(
                  value: widget.altura * widget.textSize,
                  max: widget.max_height),
              // fontSize: widget.altura! * widget.textSize,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          textAlign: TextAlign.center,
        ),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          //backgroundColor: kCorDoTema,
          primary: Colors.black,
          //fixedSize: const Size(double.infinity, altura!),
        ),
      ),
    );
  }
}
