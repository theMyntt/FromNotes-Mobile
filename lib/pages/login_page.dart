import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Digite seu email: '),
                  TextField()
                ]
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Digite sua senha: '),
                  TextField()
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
