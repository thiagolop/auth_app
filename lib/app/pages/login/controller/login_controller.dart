import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailCadastroController = TextEditingController();
  final _passwordCadastroController = TextEditingController();
  final _nameCadastroController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get emailCadastroController => _emailCadastroController;
  TextEditingController get passwordCadastroController => _passwordCadastroController;
  TextEditingController get nameCadastroController => _nameCadastroController;
}
