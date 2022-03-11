import 'package:app/Widgets/constantes.dart';

import 'resultado.dart';
import 'package:flutter/material.dart';

double _maxValue({double value, double max}) {
  if (value < max) {
    return value;
  } else
    return max;
}

class Relogio extends StatefulWidget {
  double clockHeight;
  Relogio({this.clockHeight});
  @override
  _RelogioState createState() => _RelogioState();
}

class _RelogioState extends State<Relogio> {
  var tempo = Stopwatch()..start();

  double _setPosition({double value, double newValue}) {
    value = newValue;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var size = MediaQuery.of(context).size;
    var screenHeight = (size.height - appbar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    var mainContainerSize = size.height * .85;
    var clockSize = size.width;
    var buttonSize = clockSize * .12;
    return Container(
      height: mainContainerSize,
      //  color: Color(0xFFd0cbcb),
      child: Stack(
        children: [
          Positioned(
            top: screenHeight * .27,
            child: Container(
              height: _maxValue(value: clockSize, max: 350),
              //height: widget.clockHeight,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('imagens/clock circle.png'),
                    fit: BoxFit.fitHeight),
                shape: BoxShape.circle,
                // border: Border.all(color: Colors.black, width: 6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 6,
                    blurRadius: 7,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Center(
                    child: Transform(
                      child: Container(
                        width: size.width * .15,
                        height: clockSize * .42,
                        //  color: Colors.blue,
                        margin: const EdgeInsets.all(80.0),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            Offset centerOfGestureDetector = Offset(
                                constraints.maxWidth / 2,
                                constraints.maxHeight / 2);
                            return GestureDetector(
                              // behavior: HitTestBehavior.opaque,
                              onPanStart: (details) {
                                final touchPositionFromCenter =
                                    details.localPosition -
                                        centerOfGestureDetector;
                                upsetAngle = oldAngle -
                                    touchPositionFromCenter.direction;
                              },
                              onPanEnd: (details) {
                                setState(
                                  () {
                                    oldAngle = finalAngle;
                                  },
                                );
                              },
                              onPanUpdate: (details) {
                                final touchPositionFromCenter =
                                    details.localPosition -
                                        centerOfGestureDetector;

                                setState(
                                  () {
                                    finalAngle =
                                        touchPositionFromCenter.direction +
                                            upsetAngle;
                                  },
                                );
                              },
                              child: Image.asset(
                                'imagens/clock hand 3.png',
                                // width: 30,
                                // height: 10,
                                // color: Colors.black,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()..rotateZ(finalAngle),
                    ),
                  ),
                  Center(
                    child: Transform(
                      child: Container(
                        width: size.width * .12,
                        height: clockSize * .7,
                        // color: Colors.red,
                        margin: const EdgeInsets.all(80.0),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            Offset mcenterOfGestureDetector = Offset(
                                constraints.maxWidth / 2,
                                constraints.maxHeight / 2);
                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onPanStart: (details) {
                                final mtouchPositionFromCenter =
                                    details.localPosition -
                                        mcenterOfGestureDetector;
                                mupsetAngle = moldAngle -
                                    mtouchPositionFromCenter.direction;
                              },
                              onPanEnd: (details) {
                                setState(
                                  () {
                                    moldAngle = mfinalAngle;
                                  },
                                );
                              },
                              onPanUpdate: (details) {
                                final mtouchPositionFromCenter =
                                    details.localPosition -
                                        mcenterOfGestureDetector;

                                setState(
                                  () {
                                    mfinalAngle =
                                        mtouchPositionFromCenter.direction +
                                            mupsetAngle;
                                  },
                                );
                              },
                              child: Image.asset(
                                'imagens/clock hand 3.png',
                                // color: Colors.black,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()..rotateZ(mfinalAngle),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: clockSize * .07,
                      height: clockSize * .08,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('imagens/ponteiro circulo.jpg'),
                            fit: BoxFit.fitHeight),

                        // border: Border.all(color: Colors.black, width: 6),

                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: x1,
            top: y1,
            //  left: _setPosition(value: x1, newValue: screenHeight * .05),
            //  top: _setPosition(value: y1, newValue: size.width * .05),
            child: Draggable(
              child: botao(texto: '1', tamanho: buttonSize),
              feedback: botao(texto: '1', tamanho: buttonSize),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  // _setPosition(value: x1, new_value: dragDetails.offset.dx);
                  // _setPosition(value: y1, new_value: dragDetails.offset.dy);
                  x1 = dragDetails.offset.dx;
                  y1 = dragDetails.offset.dy;
                });
              },
            ),
          ),
          Positioned(
            left: x2,
            top: y2,
            child: Draggable(
              child: botao(texto: '2', tamanho: buttonSize),
              feedback: botao(texto: '2', tamanho: buttonSize),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  x2 = dragDetails.offset.dx;
                  y2 = dragDetails.offset.dy;
                });
              },
            ),
          ),
          Positioned(
            left: x3,
            top: y3,
            child: Draggable(
              child: botao(texto: '3', tamanho: buttonSize),
              feedback: botao(texto: '3', tamanho: buttonSize),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  x3 = dragDetails.offset.dx;
                  y3 = dragDetails.offset.dy;
                });
              },
            ),
          ),
          Positioned(
            left: x4,
            top: y4,
            child: Draggable(
              child: botao(texto: '4', tamanho: buttonSize),
              feedback: botao(texto: '4', tamanho: buttonSize),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  x4 = dragDetails.offset.dx;

                  y4 = dragDetails.offset.dy;
                });
              },
            ),
          ),
          Positioned(
            left: x5,
            top: y5,
            child: Draggable(
              child: botao(texto: '5', tamanho: buttonSize),
              feedback: botao(texto: '5', tamanho: buttonSize),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  x5 = dragDetails.offset.dx;
                  y5 = dragDetails.offset.dy;
                });
              },
            ),
          ),
          Positioned(
            left: x6,
            top: y6,
            child: Draggable(
              child: botao(texto: '6', tamanho: buttonSize),
              feedback: botao(texto: '6', tamanho: buttonSize),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  x6 = dragDetails.offset.dx;
                  y6 = dragDetails.offset.dy;
                });
              },
            ),
          ),
          Positioned(
            left: x7,
            top: y7,
            child: Draggable(
              child: botao(texto: '7', tamanho: buttonSize),
              feedback: botao(texto: '7', tamanho: buttonSize),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  x7 = dragDetails.offset.dx;
                  y7 = dragDetails.offset.dy;
                });
              },
            ),
          ),
          Positioned(
            left: x8,
            top: y8,
            child: Draggable(
              child: botao(texto: '8', tamanho: buttonSize),
              feedback: botao(texto: '8', tamanho: buttonSize),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  x8 = dragDetails.offset.dx;
                  y8 = dragDetails.offset.dy;
                });
              },
            ),
          ),
          Positioned(
            left: x9,
            top: y9,
            child: Draggable(
              child: botao(texto: '9', tamanho: buttonSize),
              feedback: botao(texto: '9', tamanho: buttonSize),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  x9 = dragDetails.offset.dx;
                  y9 = dragDetails.offset.dy;
                });
              },
            ),
          ),
          Positioned(
            left: x10,
            top: y10,
            child: Draggable(
              child: botao(texto: '10', tamanho: buttonSize),
              feedback: botao(texto: '10', tamanho: buttonSize),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  x10 = dragDetails.offset.dx;
                  y10 = dragDetails.offset.dy;
                });
              },
            ),
          ),
          Positioned(
            left: x11,
            top: y11,
            child: Draggable(
              child: botao(texto: '11', tamanho: buttonSize),
              feedback: botao(texto: '11', tamanho: buttonSize),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  x11 = dragDetails.offset.dx;
                  y11 = dragDetails.offset.dy;
                });
              },
            ),
          ),
          Positioned(
            left: x12,
            top: y12,
            child: Draggable(
              child: botao(texto: '12', tamanho: buttonSize),
              feedback: botao(texto: '12', tamanho: buttonSize),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  x12 = dragDetails.offset.dx;
                  y12 = dragDetails.offset.dy;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget botao({texto, tamanho}) {
    return Container(
      width: _maxValue(value: tamanho, max: 40),
      height: _maxValue(value: tamanho, max: 40),
      decoration: const BoxDecoration(
        gradient: kCorGradient,
        shape: BoxShape.circle,
      ),
      child: TextButton(
        style: TextButton.styleFrom(),
        onPressed: () {},
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: _maxValue(value: tamanho * .45, max: 20),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget numeros(
      {double coodX, double coodY, String numero, Function arrastar}) {
    return Positioned(
      left: coodX,
      top: coodY,
      child: Draggable(
        child: botao(texto: numero),
        feedback: botao(texto: numero),
        childWhenDragging: Container(),
        onDragEnd: (dragDetails) {
          setState(() {
            coodX = dragDetails.offset.dx;
            coodY = dragDetails.offset.dy;
          });
        },
      ),
    );
  }
}

double x1 = 10;
double y1 = 30;
double x2 = 60;
double y2 = 30;
double x3 = 110;
double y3 = 30;
double x4 = 160;
double y4 = 30;
double x5 = 210;
double y5 = 30;
double x6 = 260;
double y6 = 30;
double x7 = 10;
double y7 = 80;
double x8 = 60;
double y8 = 80;
double x9 = 110;
double y9 = 80;
double x10 = 160;
double y10 = 80;
double x11 = 210;
double y11 = 80;
double x12 = 260;
double y12 = 80;
double finalAngle = 0.0;
double oldAngle = 0.0;
double upsetAngle = 0.0;
double mfinalAngle = 30.30;
double moldAngle = 30.30;
double mupsetAngle = 30.30;

void updatePosition() {
  x1 = 10;
  y1 = 30;
  x2 = 60;
  y2 = 30;
  x3 = 110;
  y3 = 30;
  x4 = 160;
  y4 = 30;
  x5 = 210;
  y5 = 30;
  x6 = 260;
  y6 = 30;
  x7 = 10;
  y7 = 80;
  x8 = 60;
  y8 = 80;
  x9 = 110;
  y9 = 80;
  x10 = 160;
  y10 = 80;
  x11 = 210;
  y11 = 80;
  x12 = 260;
  y12 = 80;
  finalAngle = 0.0;
  oldAngle = 0.0;
  upsetAngle = 0.0;
  mfinalAngle = 30.30;
  moldAngle = 30.30;
  mupsetAngle = 30.30;
}
