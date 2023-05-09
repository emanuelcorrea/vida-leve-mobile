import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vidaleve/pages/CreateUser/widgets/CreateUserButton.dart';
import 'package:vidaleve/pages/ForgotPassword/widgets/ForgotBack.dart';
import 'package:vidaleve/widgets/Input/Input.dart';

class CreateUserForm extends StatefulWidget {
  const CreateUserForm({super.key});

  @override
  State<CreateUserForm> createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 40.0, right: 50.0),
        child: Column(
          children: [
            Input(placeholder: 'Nome', icon: const Icon(Icons.person), controller: _name),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Input(placeholder: 'E-mail', icon: const Icon(Icons.mail), controller: _email),
            ),
            
            Input(placeholder: 'Senha', icon: const Icon(Icons.lock), controller: _password, type: 'password',),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CreateUserButton(formKey: _formKey, email: _email, password: _password, name: _name),
            ),
            const ForgotBack()
          ],
        ),
      ),
    );
  }
}