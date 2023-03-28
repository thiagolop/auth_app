import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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

  static const snackBarUsuarioInvalido = SnackBar(content: Text('Usuário ou senha inválidos.'));
  static const snackBarNenhumUsuarioEmail = SnackBar(content: Text('Nenhum usuário encontrado para esse email.'));
  static const snackBarEmailEmUso = SnackBar(content: Text('Email já está em uso.'));
  static const snackBarEmailInvalido = SnackBar(content: Text('O email fornecido é inválido.'));

  Future createUserWithEmailAndPassword({required String email, required String password, required String name, context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Navigator.of(context).pushReplacementNamed('/home');
      });

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(snackBarUsuarioInvalido);
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(snackBarNenhumUsuarioEmail);
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(snackBarEmailEmUso);
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(snackBarEmailInvalido);
      } else if (e.code == 'email-already-in-use') {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
