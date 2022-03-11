/* Criar aqui os widgets de texto, icones e etc para reutilizar
em qualquer parte do código. isso evita a repetição de código.
*/

import 'package:flutter/material.dart';

// Tamanho do padding dos widgets na tela
const kMargemDosWidgets = 10.0;

var kCorDoTema = Color(0xFF842382);

const kCorGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFF842382),
    Color(0xFF872ad3),
    Color(0xFFae5fce),
  ],
);

const kCorInativaGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFF8c8888),
    Color(0xFF999191),
    Color(0xFF7f7979),
  ],
);
