import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _emailCadastroController = TextEditingController();
  final _passwordCadastroController = TextEditingController();
  final _nameCadastroController = TextEditingController();
  final formKeyCadastroEmail = GlobalKey<FormState>();
  final formKeyCadastroPassword = GlobalKey<FormState>();
  final formKeyCadastroConfirmPassword = GlobalKey<FormState>();
  final formKeyCadastroName = GlobalKey<FormState>();
  final formKeyLoginEmail = GlobalKey<FormState>();
  final formKeyLoginPassword = GlobalKey<FormState>();

  TextEditingController get emailCadastroController => _emailCadastroController;
  TextEditingController get passwordCadastroController => _passwordCadastroController;
  TextEditingController get nameCadastroController => _nameCadastroController;

  static const snackBarUsuarioInvalido = SnackBar(content: Text('Usuário ou senha inválidos.'));
  static const snackBarNenhumUsuarioEmail = SnackBar(content: Text('Nenhum usuário encontrado para esse email.'));
  static const snackBarEmailEmUso = SnackBar(content: Text('Email já está em uso.'));
  static const snackBarEmailInvalido = SnackBar(content: Text('O email fornecido é inválido.'));

  Future createUserWithEmailAndPassword({required String email, required String password, required String name, context}) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
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
          email: emailController.text,
          password: passwordController.text,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future login({required String email, required String password, context}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn(
  //     scopes: [
  //       'email',
  //       'https://www.googleapis.com/auth/contacts.readonly',
  //     ],
  //   ).signIn();
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   if (googleUser != null) {
  //     googleAuth;
  //   }
  //   return await auth.signInWithCredential(credential);
  // }

  Future signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        if (googleSignInAuthentication.accessToken != null || googleSignInAuthentication.idToken != null) {
          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );
          final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
          final User? user = userCredential.user;
          return user!;
        } else {
          throw FirebaseAuthException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
            message: 'Missing Google Auth Token',
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  bool validateRegister() {
    if (formKeyCadastroEmail.currentState!.validate() &&
        formKeyCadastroPassword.currentState!.validate() &&
        formKeyCadastroConfirmPassword.currentState!.validate() &&
        formKeyCadastroName.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  bool validateLogin() {
    if (formKeyLoginEmail.currentState!.validate() && formKeyLoginPassword.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
