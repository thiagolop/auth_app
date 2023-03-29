import 'package:auth_app/app/core/ui/components/elevated_buttom_gradient.dart';
import 'package:auth_app/app/core/ui/styles/colors_app.dart';
import 'package:auth_app/app/core/ui/styles/text_app.dart';
import 'package:auth_app/app/pages/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/zocial_icons.dart';
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
                height: 200,
                width: 200,
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
              child: Form(
                child: TextFormField(
                  key: controller.formKeyLoginEmail,
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
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: controller.formKeyLoginPassword,
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
            ElevatedButtomGradient(
              text: 'Entrar',
              onPressed: () async {
                if (!controller.formKeyLoginEmail.currentState!.validate()) {
                  await controller.login(email: controller.emailController.text, password: controller.passwordController.text);
                  if (context.mounted) Navigator.pushNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Preencha todos os campos corretamente'),
                    ),
                  );
                }
              },
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
            const SizedBox(height: 32),
            Row(
              children: [
                const Expanded(child: Divider(color: Colors.black, height: 20, thickness: 1, indent: 20, endIndent: 20)),
                Text(
                  'ou entre com',
                  style: context.textStyles.textMedium.copyWith(
                    color: context.colorsApp.primaryColorDark,
                    fontSize: 14,
                  ),
                ),
                const Expanded(child: Divider(color: Colors.black, height: 20, thickness: 1, indent: 20, endIndent: 20)),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Zocial.appstore), color: Colors.black),
                const SizedBox(width: 50),
                IconButton(
                    onPressed: () async {
                      await controller.signInWithGoogle();
                      if (context.mounted) Navigator.pushNamed(context, '/home');
                    },
                    icon: Image.asset('assets/images/google-icon.png')),
              ],
            ),
          ],
        ),
      );
    });
  }
}
