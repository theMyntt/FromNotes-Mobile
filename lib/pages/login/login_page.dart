import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fromnotes_mobile/config/env.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final env = Env();

  bool isLoading = false;

  Future<void> makeLogin(BuildContext context) async {
    final apiUrl = env.apiUrl;

    try {
      setState(() {
        isLoading = true;
      });
      var response = await post(Uri.parse("$apiUrl/v1/user/sync-out"), body: {
        'email': _email.text.toString(),
        'password': _password.text.toString()
      });

      if (response.statusCode != 201) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário não encontrado')),
        );
        return;
      }

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', jsonResponse['name']);
      prefs.setString('token', jsonResponse['id']);

      Navigator.pushNamed(context, '/home');

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro durante o login')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Faça login para continuar!'),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
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
                            autocorrect: false,
                            enableSuggestions: false,
                          )
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Digite sua senha: '),
                        TextField(
                          controller: _password,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                        )
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () => makeLogin(context),
                          child: const Text('Fazer login')),
                    )
                  ],
                ),
              ),
            ),
            if (isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        ));
  }
}
