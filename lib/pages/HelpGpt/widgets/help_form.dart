import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/pages/HelpGpt/widgets/help_button.dart';
import 'package:vidaleve/pages/Login/widgets/LoginButton.dart';
import 'package:vidaleve/pages/Login/widgets/LoginForget.dart';
import 'package:vidaleve/providers/help_provider.dart';
import 'package:vidaleve/services/help_cpt.dart';
import 'package:vidaleve/widgets/FormButton/FormButton.dart';
import 'package:vidaleve/widgets/Input/Input.dart';

class HelpForm extends StatefulWidget {
  const HelpForm({super.key});

  @override
  State<HelpForm> createState() => _HelpFormState();
}

class _HelpFormState extends State<HelpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController sintomas = TextEditingController();
  TextEditingController fadiga = TextEditingController();
  TextEditingController sleep = TextEditingController();
  TextEditingController apetite = TextEditingController();

  final HelpGptService _gptService = HelpGptService();

  @override
  void dispose() {
    sintomas.dispose();
    fadiga.dispose();
    sleep.dispose();
    super.dispose();
  }

  setContext(dynamic newContext) {
    Provider.of<HelpProvider>(context, listen: false).setContext(newContext);
  }

  askGpt(chatContext) async {
    dynamic newContext = await _gptService.ask(chatContext);

    return newContext['data'];
  }

  @override
  Widget build(BuildContext context) {
    void onPressed() async {
      print('clicou');

      dynamic newContext = [
        {
          "role": "user",
          "content":
              "Olá, me ajuda, to com fadiga, sem sono e com pouco apetite, o que pode ser?",
        },
        {
          "role": "chat",
          "content":
              "A fadiga, a falta de sono e a perda de apetite podem ser sintomas de várias condições diferentes, desde problemas de saúde física até questões emocionais. Algumas possíveis causas para esses sintomas podem incluir: Estresse...",
        }
      ];

      setContext(newContext);

      context.go('/help-gpt/chat');
    }
    
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 40.0, right: 50.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Input(
              placeholder: 'Quais são os sintomas que está sentindo?',
              controller: sintomas,
            ),
            const SizedBox(height: 20),
            Input(
              placeholder: 'Você tem sentido fadiga recentemente?',
              controller: fadiga,
            ),
            const SizedBox(height: 20),
            Input(
              placeholder: 'Você tem tido dificuldade em dormir?',
              controller: sleep,
            ),
            const SizedBox(height: 20),
            Input(
              placeholder: 'Você tem notado uma mudança de apetite?',
              controller: apetite,
            ),
            const SizedBox(height: 20),
            HelpButton(onPressed: onPressed)
          ],
        ),
      ),
    );
  }
}
