import 'package:auth_app/app/core/ui/components/elevated_buttom_gradient.dart';
import 'package:auth_app/app/core/ui/styles/colors_app.dart';
import 'package:auth_app/app/core/ui/styles/text_app.dart';
import 'package:auth_app/app/pages/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class SignInLoginPage extends StatefulWidget {
  const SignInLoginPage({super.key});

  @override
  State<SignInLoginPage> createState() => _SignInLoginPageState();
}

class _SignInLoginPageState extends State<SignInLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(builder: (context, controller, child) {
      return Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 20),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      context.colorsApp.primaryColorDark,
                      context.colorsApp.primaryColorLight,
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/images/image2.png', height: 400),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Digite seu email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Campo obrigatório'),
                  Validatorless.email('Email inválido'),
                ]),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: controller.passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Campo obrigatório'),
                  Validatorless.min(6, 'Senha deve ter no mínimo 6 caracteres'),
                ]),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: RichText(
                    text: TextSpan(
                        text: 'Esqueceu sua senha?',
                        style: context.textStyles.textMedium.copyWith(
                          color: context.colorsApp.primaryColorDark,
                          fontSize: 12,
                        ),
                        children: [
                      TextSpan(
                        text: ' Clique aqui',
                        style: context.textStyles.textMedium.copyWith(
                          color: context.colorsApp.primaryColorLight,
                        ),
                      ),
                    ])),
              ),
            ),
            const SizedBox(height: 16),
            const ElevatedButtomGradient(
              text: 'Entrar',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/registerlogin');
                  },
                  child: RichText(
                      text: TextSpan(
                          text: 'Não tem uma conta?',
                          style: context.textStyles.textMedium.copyWith(
                            color: context.colorsApp.primaryColorDark,
                            fontSize: 12,
                          ),
                          children: [
                        TextSpan(
                          text: ' Clique aqui',
                          style: context.textStyles.textMedium.copyWith(
                            color: context.colorsApp.primaryColorLight,
                          ),
                        ),
                      ])),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    });
  }
}
