import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/pages/HelpGptChat/widgets/help_chat_form.dart';
import 'package:vidaleve/pages/HelpGptChat/widgets/help_chat_header.dart';
import 'package:vidaleve/pages/HelpGptChat/widgets/help_chat_message.dart';
import 'package:vidaleve/providers/help_provider.dart';
import 'package:vidaleve/services/help_cpt.dart';

class HelpGptChat extends StatefulWidget {
  final dynamic form;

  const HelpGptChat({super.key, required this.form});

  @override
  State<HelpGptChat> createState() => _HelpGptChatState();
}

class _HelpGptChatState extends State<HelpGptChat> {
  final ScrollController _controller = ScrollController();
  final HelpGptService _gptService = HelpGptService();
  dynamic chatContext;

  saveContext(newContext) {
    Provider.of<HelpProvider>(context, listen: false).setContext(newContext);

    setState(() {
      chatContext = newContext;
    });

    Future.delayed(Duration(seconds: 1), () {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  askGpt(newChatContext) async {
    setState(() {
      chatContext = newChatContext;
    });

    dynamic newContext = await _gptService.ask(newChatContext);

    return newContext['data'];
  }

  _getChatContext() {
    return Provider.of<HelpProvider>(context, listen: false).chatContext;
  }

  void onSend(dynamic controller) async {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );

    dynamic newContextChat = [
      ...chatContext,
      {
        'role': 'user',
        'content': controller.text,
      }
    ];

    saveContext(newContextChat);

    controller.text = '';

    dynamic response = await askGpt(newContextChat);
    print('oi');

    saveContext(response);
  }

  @override
  Widget build(BuildContext context) {
    chatContext = _getChatContext();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HelpChatHeader(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 390,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      controller: _controller,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: chatContext.length,
                      itemBuilder: (context, index) {
                        return HelpChatMessage(
                          message: chatContext[index]['content'],
                          type: chatContext[index]['role'],
                        );
                      },
                    ),
                  ),
                ),
              ),
              HelpChatForm(onSend: onSend)
            ],
          ),
        ),
      ),
    );
  }
}
