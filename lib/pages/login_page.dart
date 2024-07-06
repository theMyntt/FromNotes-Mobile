import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faça login para continuar!'),
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Wrap(
            runSpacing: 20.0,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Digite seu email: '),
                  TextField(
                    controller: _email,
                    textCapitalization: TextCapitalization.none,
                  )
                ]
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Digite sua senha: '),
                  TextField(
                    controller: _password
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () {}, child: Text('Fazer login')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
