import 'package:auth_app/app/core/routes/app_routes.dart';
import 'package:auth_app/app/core/ui/components/elevated_buttom_gradient.dart';
import 'package:auth_app/app/core/ui/styles/text_app.dart';
import 'package:flutter/material.dart';

class StartLoginPage extends StatelessWidget {
  const StartLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                children: [
                  Image.asset('assets/images/image1.png', height: 400),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text('Vamos Começar', style: context.textStyles.textBold.copyWith(fontSize: 30)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text('Não tem momento melhor do que agora para começar ', style: context.textStyles.textSemiBoldItalic.copyWith(fontSize: 12)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ElevatedButtomGradient(
                    text: 'Entrar',
                    borderRadius: BorderRadius.circular(16),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.signInlogin);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
