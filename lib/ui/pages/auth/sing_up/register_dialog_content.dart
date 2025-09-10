import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/pages/about_routes/routes/about_us_router.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/hoverable_logo.dart';
import '../../../core/widgets/password_text_field.dart';

class RegisterDialogContent extends StatelessWidget {
  const RegisterDialogContent({super.key});

  static const Color color1 = Color.fromRGBO(168, 79, 206, 1); // Opacidade 100% é 1, não 100
  static const Color color2 = Color.fromRGBO(233, 246, 242, 1);

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Stack(
        children: [
          Positioned(
            left: 40,
            top: -10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/login_register/register_retanguloroxo.png',
                height: 500,
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 0,
            child: Image.asset(
              'assets/login_register/register_retanguloverde.png',
              height: 550,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 160),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child:
                    HoverableLogo(
                      onTap: () => context.go(AboutUsRoute().location),
                      imagePath: 'assets/logo_oficial_expanded.png',
                      height: 94,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 110,
            bottom: 30,
            child: Image.asset(
              'assets/login_register/register_monitor.png',
              height: 396,
            ),
          ),
          Row(
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      width: 600,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              'Cadastre-se',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 15),
                          Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Nome:",
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  CustomTextField(
                                      labelText: 'Nome',
                                      placeholderText: 'Digite seu nome',
                                      onChanged: (String text) {}
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  CustomTextField(
                                      labelText: 'Login',
                                      placeholderText: 'Digite seu login',
                                      onChanged: (String text) {}
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Matrícula:",
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  CustomTextField(
                                      labelText: 'Matrícula',
                                      placeholderText: 'Digite sua matrícula',
                                      onChanged: (String text) {}
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Senha",
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  PasswordTextField(
                                      onValueChange: (String text) { },
                                      title: 'Senha',
                                      placeholder: 'Digite sua Senha'
                                  ),
                                  SizedBox(height: 30),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: (){},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromRGBO(76, 159, 132, 1),
                                            foregroundColor: Color.fromRGBO(255, 255, 255, 1)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: const Text(
                                            'Entrar',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Já possui conta?',
                                          style: TextStyle(
                                            color: Color.fromRGBO(22, 29, 27, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              context.pushReplacement('/login');
                                            },
                                            child: Text(
                                              'Entre!',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(22, 29, 27, 1),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700
                                              ),
                                            )
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}
