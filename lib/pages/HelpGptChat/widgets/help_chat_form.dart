import 'package:flutter/material.dart';
import 'package:vidaleve/widgets/Input/Input.dart';

class HelpChatForm extends StatefulWidget {
  final dynamic onSend;

  const HelpChatForm({
    super.key,
    required this.onSend,
  });

  @override
  State<HelpChatForm> createState() => _HelpChatFormState();
}

class _HelpChatFormState extends State<HelpChatForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: TextFormField(
                controller: message,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite sua mensagem',
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  widget.onSend(message);
                },
                icon: const Icon(Icons.send))
          ],
        ),
      ),
    );
  }
}
