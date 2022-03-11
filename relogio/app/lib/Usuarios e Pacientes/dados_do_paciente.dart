import 'package:app/main.dart';
import 'package:app/Widgets/botao_padrao.dart';
import 'package:app/Widgets/constantes.dart';
import 'package:flutter/material.dart';
import '../menu.dart';
import 'paciente.dart';
//
// Instância da classe das perguntas do exame
// Antes de iniciar o exame, o profissional vai informar alguns dados do paciente
//
// Variáveis referentes a essa página:

TextEditingController nomeDoPacienteControlador = TextEditingController();
TextEditingController idadeDoPacienteControlador = TextEditingController();
//
//
TextEditingController localDoExame = TextEditingController();
TextEditingController localEspecifico = TextEditingController();
//
//
double alturaDaCaixaDeTexto = .1;

enum escolaridadeDoPaciente {
  Analfabeto,
  UmAQuatro,
  CincoAOito,
  NoveOuMais,
  nulo
}

escolaridadeDoPaciente escolaridade = escolaridadeDoPaciente.nulo;

class DadosDoPaciente extends StatefulWidget {
  @override
  _DadosDoPacienteState createState() => _DadosDoPacienteState();
}

class _DadosDoPacienteState extends State<DadosDoPaciente> {
  void atribuirDadosDoPaciente() {
    Paciente novoPaciente = Paciente();
    novoPaciente
        .atribuirNome(nomeDoPacienteControlador.text.trimRight().trimLeft());
    novoPaciente.atribuirIdade(
      int.parse(idadeDoPacienteControlador.text),
      //
    );

    if (escolaridade == escolaridadeDoPaciente.Analfabeto) {
      novoPaciente.atribuirEscolaridade('Analfabeto', escolaridade);
    } else if (escolaridade == escolaridadeDoPaciente.UmAQuatro) {
      novoPaciente.atribuirEscolaridade(
          '1 a 4 anos de escolaridade', escolaridade);
    } else if (escolaridade == escolaridadeDoPaciente.CincoAOito) {
      novoPaciente.atribuirEscolaridade(
          '5 a 8 anos de escolaridade', escolaridade);
    } else if (escolaridade == escolaridadeDoPaciente.NoveOuMais) {
      novoPaciente.atribuirEscolaridade(
          '9 ou mais anos de escolaridade', escolaridade);
    }
  }

  GlobalKey<FormState> _paciente_nome_formkey = GlobalKey<FormState>();
  GlobalKey<FormState> _paciente_idade_formkey = GlobalKey<FormState>();

  void selecionarProsseguir() {
    atribuirDadosDoPaciente();

    //  Future test1 = updatePosition();
    //String test2 = retornarLocalidade();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Menu(),
      ),
    );
  }

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
    var labelsize = screenHeight * .03;
    var cursorsize = screenHeight * .04;
    var containerSize = screenHeight * .47;
    //
    //

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: kCorGradient,
/*
                image: DecorationImage(
                    image: AssetImage('imagens/clock circle.jpg'),
                    fit: BoxFit.cover),
                 */
              ),
              height: containerSize,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    'Antes de prosseguir para o exame, preencha algumas informações.',
                    style: TextStyle(
                        fontSize:
                            _maxValue(value: containerSize * .15, max: 40),
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          const Shadow(
                              color: Colors.black,
                              offset: Offset(3, 3),
                              blurRadius: 3)
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * .05),
            Text(
              'Dados do Paciente',
              style: TextStyle(
                  fontSize: _maxValue(value: screenHeight * .06, max: 35),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * .03),

            Padding(
              padding: const EdgeInsets.all(kMargemDosWidgets),
              child: caixaDeTexto(
                  label: 'Nome do Paciente',
                  controlador: nomeDoPacienteControlador,
                  altura: screenHeight * alturaDaCaixaDeTexto,
                  labelSize: labelsize,
                  cursorSize: cursorsize,
                  validador: _paciente_nome_formkey),
            ),
            SizedBox(height: screenHeight * .03),
            Padding(
              padding: const EdgeInsets.all(kMargemDosWidgets),
              child: caixaDeTexto(
                  label: 'Idade do Paciente',
                  controlador: idadeDoPacienteControlador,
                  altura: screenHeight * alturaDaCaixaDeTexto,
                  labelSize: labelsize,
                  cursorSize: cursorsize,
                  validador: _paciente_idade_formkey,
                  isNumber: true),
            ),
            SizedBox(height: screenHeight * .04),

            Padding(
              padding: const EdgeInsets.all(kMargemDosWidgets),
              child: Text(
                'Informe quantos anos de escolaridade tem o paciente:',
                style: TextStyle(
                    fontSize: _maxValue(value: screenHeight * .05, max: 34),
                    fontWeight: FontWeight.w700),
                //textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kMargemDosWidgets),
              child: Row(
                children: [
                  Expanded(
                    child: BotaoPadrao(
                      altura: screenHeight * .1,
                      aoPressionar: () {
                        setState(() {
                          escolaridade = escolaridadeDoPaciente.Analfabeto;
                        });
                      },
                      botaoTexto: 'Analfabeto',
                      //textSize: .5,
                      corDoBotao:
                          escolaridade == escolaridadeDoPaciente.Analfabeto
                              ? kCorGradient
                              : kCorInativaGradient,
                      max_height: 29,
                    ),
                  ),
                  SizedBox(width: size.width * .04),
                  Expanded(
                      child: BotaoPadrao(
                    altura: screenHeight * .1,
                    aoPressionar: () {
                      setState(() {
                        escolaridade = escolaridadeDoPaciente.UmAQuatro;
                      });
                    },
                    botaoTexto: '1 a 4 anos ',
                    //  textSize: 4,
                    corDoBotao: escolaridade == escolaridadeDoPaciente.UmAQuatro
                        ? kCorGradient
                        : kCorInativaGradient,
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kMargemDosWidgets),
              child: Row(
                children: [
                  Expanded(
                    child: BotaoPadrao(
                      altura: screenHeight * .1,
                      aoPressionar: () {
                        setState(() {
                          setState(() {
                            escolaridade = escolaridadeDoPaciente.CincoAOito;
                          });
                        });
                      },
                      botaoTexto: '5 a 8 anos',
                      // textSize: 4,
                      corDoBotao:
                          escolaridade == escolaridadeDoPaciente.CincoAOito
                              ? kCorGradient
                              : kCorInativaGradient,
                    ),
                  ),
                  SizedBox(width: size.width * .04),
                  Expanded(
                      child: BotaoPadrao(
                    altura: screenHeight * .1,
                    aoPressionar: () {
                      setState(() {
                        escolaridade = escolaridadeDoPaciente.NoveOuMais;
                      });
                    },
                    botaoTexto: '9 ou mais',
                    textSize: .5,
                    corDoBotao:
                        escolaridade == escolaridadeDoPaciente.NoveOuMais
                            ? kCorGradient
                            : kCorInativaGradient,
                  )),
                ],
              ),
            ),
            //
            //
            SizedBox(height: screenHeight * .05),

            //
            //
            //
            //
            Padding(
              padding: const EdgeInsets.all(kMargemDosWidgets),
              child: BotaoPadrao(
                altura: screenHeight * .11,
                aoPressionar: escolaridade != escolaridadeDoPaciente.nulo
                    ? () {
                        if (_paciente_nome_formkey.currentState.validate() &&
                            _paciente_idade_formkey.currentState.validate()) {
                          selecionarProsseguir();
                        }
                      }
                    : () {},
                botaoTexto: 'Prosseguir',
                textSize: .5,
                corDoBotao: escolaridade != escolaridadeDoPaciente.nulo
                    ? kCorGradient
                    : kCorInativaGradient,
                max_height: 50,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget caixaDeTexto(
      {String label,
      TextEditingController controlador,
      double altura,
      double labelSize,
      double cursorSize,
      bool isNumber = false,
      bool centerLabel = false,
      GlobalKey<FormState> validador}) {
    return Form(
      key: validador,
      child: SizedBox(
        height: altura,
        child: TextFormField(
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            cursorHeight: cursorSize,
            cursorColor: kCorDoTema,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: labelSize,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kCorDoTema, width: 1.5),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.5),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.5),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.5),
              ),
            ),
            controller: controlador,
            textAlign: centerLabel == true ? TextAlign.center : TextAlign.start,
            validator: (value) {
              if (value.isEmpty) {
                return 'Você deve preencher este campo!';
              }
            }),
      ),
    );
  }
}
