import 'package:auth_app/app/core/ui/components/elevated_buttom_gradient.dart';
import 'package:auth_app/app/core/ui/styles/colors_app.dart';
import 'package:auth_app/app/core/ui/styles/text_app.dart';
import 'package:auth_app/app/pages/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class RegisterLoginPage extends StatefulWidget {
  const RegisterLoginPage({super.key});

  @override
  State<RegisterLoginPage> createState() => _RegisterLoginPageState();
}

class _RegisterLoginPageState extends State<RegisterLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(builder: (context, LoginController controller, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
          centerTitle: true,
          backgroundColor: context.colorsApp.primaryColorDark,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 20),
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
                      child: Image.asset('assets/images/image2.png', height: 300),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text('Cadastro', style: context.textStyles.textBold.copyWith(fontSize: 30)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: controller.emailCadastroController,
                      onChanged: (text) {
                        setState(() {
                          controller.emailCadastroController.selection = TextSelection.fromPosition(TextPosition(offset: controller.emailCadastroController.text.length));
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Digite seu email',
                        prefixIcon: const Icon(Icons.email),
                        suffixIcon: controller.emailCadastroController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    controller.emailCadastroController.clear();
                                  });
                                },
                              )
                            : null,
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
                      controller: controller.passwordCadastroController,
                      keyboardType: TextInputType.emailAddress,
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
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                      decoration: const InputDecoration(
                        labelText: 'Confirmar senha',
                        hintText: 'Digite sua senha',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo obrigatório'),
                        Validatorless.min(6, 'Senha deve ter no mínimo 6 caracteres'),
                        Validatorless.compare(controller.passwordCadastroController, 'As senhas não são iguais'),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: controller.nameCadastroController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        hintText: 'Digite seu nome',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo obrigatório'),
                        Validatorless.min(6, 'Senha deve ter no mínimo 6 caracteres'),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const ElevatedButtomGradient(
                    text: 'Entrar',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
