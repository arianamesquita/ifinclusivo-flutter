// lib/ui/pages/auth/login_dialog_content.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/core/widgets/custom_text_field.dart';
import 'package:if_inclusivo/ui/core/widgets/password_text_field.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

import '../../../../routing/app_router.dart';
import '../../../core/widgets/hoverable_logo.dart';

class LoginDialogContent extends StatelessWidget {
  const LoginDialogContent({super.key});
  static const Color color1 = Color.fromRGBO(168, 79, 206, 1); // Opacidade 100% é 1, não 100
  static const Color color2 = Color.fromRGBO(233, 246, 242, 1);

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final fontScale = ResponsiveUtils.fontScale(context);
    return Dialog.fullscreen(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color2, color1],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.6362, 0.3638], // metade roxo, metade branco
          ),
        ),
        child: Stack(
          children: [
            if (deviceType == DeviceScreenType.desktop)
              _buildIntro(context),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Center(
                        child: Container(
                          width: deviceType == DeviceScreenType.desktop ? 500 :
                            deviceType == DeviceScreenType.tablet ? 400 : 300,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Bem-Vindo de Volta",
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontStyle: FontStyle.normal,
                                    fontSize: (Theme.of(context).textTheme.headlineMedium?.fontSize
                                        ?? 25) * fontScale,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(height: 25),
                              Form(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontStyle: FontStyle.normal,
                                              fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize
                                                  ?? 18) * fontScale,
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
                                          "Senha",
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontStyle: FontStyle.normal,
                                              fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize
                                                  ?? 18) * fontScale,
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
                                              child: Text(
                                                  'Entrar',
                                                style: TextStyle(
                                                    fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize
                                                        ?? 18) * fontScale,
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            )
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      SizedBox(
                                        width: double.infinity,
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                                'Esqueci minha Senha',
                                              style: TextStyle(
                                                color: Color.fromRGBO(22, 29, 27, 1),
                                                  fontSize: (Theme.of(context).textTheme.bodyMedium?.fontSize
                                                      ?? 16) * fontScale,
                                                fontWeight: FontWeight.w400,
                                                decoration: TextDecoration.underline
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
                                                'Não possui conta?',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(22, 29, 27, 1),
                                                fontSize: (Theme.of(context).textTheme.bodyMedium?.fontSize
                                                    ?? 16) * fontScale,
                                                  fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  context.pushReplacement('/register');
                                                },
                                                child: Text(
                                                  'Cadastre-se',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(22, 29, 27, 1),
                                                      fontSize: (Theme.of(context).textTheme.bodyMedium?.fontSize
                                                          ?? 16) * fontScale,
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
                        )
                    )
                ),
                if (deviceType == DeviceScreenType.desktop)
                  const Expanded(flex: 1, child: SizedBox()),
              ]
            )
          ],
        ),
      ),
    );
  }

  _buildIntro(context){
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: HoverableLogo(
                      onTap: () => AboutUsRoute().go(context),
                      imagePath: 'assets/logo_oficial_expanded.png',
                      height: 114,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width < 1240 ?
           MediaQuery.of(context).size.width * 0.12 :
           MediaQuery.of(context).size.width * 0.20,
          top: MediaQuery.of(context).size.width < 1240 ?
            MediaQuery.of(context).size.width * 0.60 :
            MediaQuery.of(context).size.width * 0.10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/login_register/login_notebook.png',
              height: 370,
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset(
            'assets/login_register/login_decorativa.png',
            height: 150,
          ),
        ),
      ]
    );
  }
}
