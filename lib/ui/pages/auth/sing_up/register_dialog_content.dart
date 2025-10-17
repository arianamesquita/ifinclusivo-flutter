import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/enums/cursos.dart';
import 'package:if_inclusivo/domain/validators/email_validador.dart';
import 'package:if_inclusivo/domain/validators/login_validator.dart';
import 'package:if_inclusivo/domain/validators/name_validator.dart';
import 'package:if_inclusivo/domain/validators/password_validator.dart';
import 'package:if_inclusivo/ui/pages/auth/modal/auth_modals.dart';
import 'package:if_inclusivo/ui/pages/auth/sing_up/viewModels/registerViewModel.dart';
import 'package:lucid_validation/lucid_validation.dart';
import 'package:provider/provider.dart';

import '../../../../routing/app_router.dart';
import '../../../../utils/responsive_utils.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/hoverable_logo.dart';
import '../../../core/widgets/password_text_field.dart';

class RegisterDialogContent extends StatefulWidget {
  const RegisterDialogContent({super.key});

  @override
  State<RegisterDialogContent> createState() => _RegisterDialogContent();
}

class _RegisterDialogContent extends State<RegisterDialogContent> {
  final TextEditingController _nameController = TextEditingController();
  final NameFieldValidator nameValidator = NameFieldValidator();
  final TextEditingController _emailController = TextEditingController();
  final EmailFieldValidator emailValidator = EmailFieldValidator();
  final TextEditingController _senhaController = TextEditingController();
  final PasswordFieldValidator senhaValidator = PasswordFieldValidator();
  final TextEditingController _confirmController = TextEditingController();
  final TextEditingController _especialidadeController = TextEditingController();
  final TextEditingController _especialidade2Controller = TextEditingController();
  final TextEditingController _formacaoController = TextEditingController();
  String? _tipoSelecionado;
  Cursos? _cursoSelecionado;

  bool isNameError = false;
  String errorName = '';
  bool isEmailError = false;
  String errorEmail = '';
  bool isSenhaError = false;
  String errorSenha = '';
  bool isConfirmError = false;
  String errorConfirm = '';
  bool isValid = false;
  bool passwordVisible = false;
  bool password2Visible = false;

  @override
  void initState() {
    super.initState();
  }

  void _resetForm() {
    _nameController.clear();
    _emailController.clear();
    _senhaController.clear();
    _especialidadeController.clear();
    _especialidade2Controller.clear();
    _formacaoController.clear();

    setState(() {
      _cursoSelecionado = null;
      _tipoSelecionado = null;
    });
  }


  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RegisterViewModel>();
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final fontScale = ResponsiveUtils.fontScale(context);
    return Scaffold(
      body: Stack(
        children: [
          if (deviceType == DeviceScreenType.desktop)
            _buildIntro(context),
          Row(
            children: [
              if (deviceType == DeviceScreenType.desktop)
                const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      width: deviceType == DeviceScreenType.desktop ? 600 :
                        deviceType == DeviceScreenType.tablet ? 500 : 300,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              'Cadastre-se',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontStyle: FontStyle.normal,
                                fontSize: (Theme.of(context).textTheme.headlineMedium?.fontSize
                                    ?? 20) * fontScale,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Nome Completo",
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.onSurface,
                                          fontStyle: FontStyle.normal,
                                          fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize
                                              ?? 18) * fontScale,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 6,
                                              offset: const Offset(0,3)
                                          )
                                        ]
                                    ),
                                    child: TextFormField(
                                      controller: _nameController,
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onSurface,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Digite seu nome',
                                        filled: true,
                                        fillColor: Color.fromRGBO(252, 249, 248, 1),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide: BorderSide.none,
                                        ), // dá a borda Material
                                        errorText: isNameError ? errorName : null, // mostra o erro se existir
                                      ),
                                      validator: (String? value) {
                                        final name = NameModel(name: value ?? '');
                                        final ValidationResult result = nameValidator.validate(name);
                                        if (result.isValid) {
                                          setState(() => isNameError = false);
                                          return null;
                                        }
                                        setState(() {
                                          isNameError = true;
                                          errorName = 'Nome inválido, ex: João da Silva';
                                        });
                                        return errorName;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "E-mail",
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.onSurface,
                                          fontStyle: FontStyle.normal,
                                          fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize
                                              ?? 18) * fontScale,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 6,
                                              offset: const Offset(0,3)
                                          )
                                        ]
                                    ),
                                    child: TextFormField(
                                      controller: _emailController,
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onSurface,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Digite seu e-mail',
                                        filled: true,
                                        fillColor: Color.fromRGBO(252, 249, 248, 1),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide: BorderSide.none,
                                        ), // dá a borda Material
                                        errorText: isEmailError ? errorEmail : null, // mostra o erro se existir
                                      ),
                                      validator: (String? value) {
                                        final email = EmailModel(email: value ?? '');
                                        final ValidationResult result = emailValidator.validate(email);
                                        if (result.isValid) {
                                          setState(() => isEmailError = false);
                                          return null;
                                        }
                                        setState(() {
                                          isEmailError = true;
                                          errorEmail = 'E-mail inválido, ex: joao.silva@estudante.ifgoiano.edu.br';
                                        });
                                        return errorEmail;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Senha",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onSurface,
                                        fontStyle: FontStyle.normal,
                                        fontSize:
                                        (Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize ??
                                            18) *
                                            fontScale,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 6,
                                              offset: const Offset(0,3)
                                          )
                                        ]
                                    ),
                                    child: TextFormField(
                                      controller: _senhaController,
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onSurface,
                                      ),
                                      obscureText: !passwordVisible,
                                      decoration: InputDecoration(
                                        hintText: 'Digite sua senha',
                                        filled: true,
                                        fillColor: Color.fromRGBO(252, 249, 248, 1),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide: BorderSide.none,
                                        ),
                                        errorText: isSenhaError ? errorSenha : null, // mostra o erro se existir
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            passwordVisible ? Icons.visibility_off : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              passwordVisible = !passwordVisible;
                                            });
                                          },
                                        ),
                                      ),
                                      validator: (String? value) {
                                        final password = PasswordModel(password: value ?? '');
                                        final ValidationResult result = senhaValidator.validate(password);

                                        if (result.isValid) {
                                          setState(() => isSenhaError = false);
                                          return null;
                                        }

                                        setState(() {
                                          isSenhaError = true;
                                          errorSenha = 'Deve conter 6 letras.';
                                        });
                                        return errorSenha;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Confirmar senha",
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.onSurface,
                                          fontStyle: FontStyle.normal,
                                          fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize
                                              ?? 18) * fontScale,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 6,
                                              offset: const Offset(0,3)
                                          )
                                        ]
                                    ),
                                    child: TextFormField(
                                      controller: _confirmController,
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onSurface,
                                      ),
                                      obscureText: !password2Visible,
                                      decoration: InputDecoration(
                                        hintText: 'Digite a mesma senha do campo anterior.',
                                        filled: true,
                                        fillColor: Color.fromRGBO(252, 249, 248, 1),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide: BorderSide.none,
                                        ), // dá a borda Material
                                        errorText: isConfirmError ? errorConfirm : null, // mostra o erro se existir
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            password2Visible ? Icons.visibility_off : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              password2Visible = !passwordVisible;
                                            });
                                          },
                                        ),
                                      ),
                                      validator: (String? value) {
                                        final isEqual = value == _senhaController.text;
                                        if (isEqual) {
                                          setState(() => isConfirmError = false);
                                          return null;
                                        }
                                        setState(() {
                                          isConfirmError = true;
                                          errorConfirm = 'Senha inválida, a senha deve ter no mínimo 6 caracteres.';
                                        });
                                        return errorConfirm;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Quem é você?",
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.onSurface,
                                          fontStyle: FontStyle.normal,
                                          fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize
                                              ?? 18) * fontScale,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  RadioGroup<String>(
                                    groupValue: _tipoSelecionado,
                                    onChanged: (value) {
                                      setState(() {
                                        _tipoSelecionado = value;
                                        print('O tipo selecionado $_tipoSelecionado');
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text(
                                              'Professor',
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.onSurface,
                                              )
                                          ),
                                          value: 'professor',
                                        ),
                                        RadioListTile<String>(
                                          title: Text(
                                              'Tutor',
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.onSurface,
                                              )
                                          ),
                                          value: 'tutor',
                                        ),
                                        RadioListTile<String>(
                                          title: Text(
                                              'Intérprete',
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.onSurface,
                                              )
                                          ),
                                          value: 'interprete',
                                        ),
                                        RadioListTile<String>(
                                          title: Text(
                                              'Aluno',
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.onSurface,
                                              )
                                          ),
                                          value: 'aluno',
                                        ),
                                      ],
                                    )
                                  ),
                                  if(_tipoSelecionado == 'professor') ...[
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "Formação (Opcional)",
                                        style: TextStyle(
                                            color: Theme.of(context).colorScheme.onSurface,
                                            fontStyle: FontStyle.normal,
                                            fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize
                                                ?? 18) * fontScale,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 6,
                                                offset: const Offset(0,3)
                                            )
                                          ]
                                      ),
                                      child: TextFormField(
                                        controller: _formacaoController,
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.onSurface,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Digite qual sua formação.',
                                          filled: true,
                                          fillColor: Color.fromRGBO(252, 249, 248, 1),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide: BorderSide.none,
                                          ), // dá a borda Material
                                        ),
                                      ),
                                    ),
                                  ] else if (_tipoSelecionado == 'tutor') ...[
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "Especialidade",
                                        style: TextStyle(
                                            color: Theme.of(context).colorScheme.onSurface,
                                            fontStyle: FontStyle.normal,
                                            fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize
                                                ?? 18) * fontScale,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 6,
                                                offset: const Offset(0,3)
                                            )
                                          ]
                                      ),
                                      child: TextFormField(
                                        controller: _especialidadeController,
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.onSurface,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Digite qual sua especialidade.',
                                          filled: true,
                                          fillColor: Color.fromRGBO(252, 249, 248, 1),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide: BorderSide.none,
                                          ), // dá a borda Material
                                        ),
                                      ),
                                    ),
                                  ] else if (_tipoSelecionado == 'interprete') ...[
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "Especialidade",
                                        style: TextStyle(
                                            color: Theme.of(context).colorScheme.onSurface,
                                            fontStyle: FontStyle.normal,
                                            fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize
                                                ?? 18) * fontScale,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 6,
                                                offset: const Offset(0,3)
                                            )
                                          ]
                                      ),
                                      child: TextFormField(
                                        controller: _especialidade2Controller,
                                        style: const TextStyle(
                                            color: Color.fromRGBO(22, 29, 27, 1)
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Digite qual sua especialidade.',
                                          filled: true,
                                          fillColor: Color.fromRGBO(252, 249, 248, 1),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide: BorderSide.none,
                                          ), // dá a borda Material
                                        ),
                                      ),
                                    ),
                                  ] else if (_tipoSelecionado == 'aluno') ...[
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "Curso",
                                        style: TextStyle(
                                            color: Theme.of(context).colorScheme.onSurface,
                                            fontStyle: FontStyle.normal,
                                            fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize
                                                ?? 18) * fontScale,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                    DropdownButtonFormField<Cursos>(
                                      value: _cursoSelecionado,
                                      items: Cursos.values.map((curso) {
                                        return DropdownMenuItem<Cursos>(
                                          value: curso,
                                          child: Text(
                                            curso == Cursos.SISTEMAS_INFORMACAO
                                                ? 'Sistemas de Informação'
                                                : 'Ensino Médio - Técnico de TI',
                                            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _cursoSelecionado = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      dropdownColor: Colors.white,
                                      isDense: true,
                                    ),
                                  ],
                                  SizedBox(height: 30),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          if(_tipoSelecionado == 'professor') {
                                            final professorData = ProfessorRequestModel(
                                              nome: _nameController.text,
                                              login: _emailController.text,
                                              senha: _senhaController.text,
                                              formacao: _formacaoController.text,
                                              matricula:0,
                                            );
                                            final success = await viewModel.registerNewProfessor(professorData);
                                            if(success && viewModel.errorMessage == null){
                                              AuthModals.userCreatedSuccess(context: context);
                                              LoginRoute().pushReplacement(context);
                                              _resetForm();
                                            } else {
                                              viewModel.errorMessage ?? 'Usuário Duplicado';
                                              AuthModals.userRegisterError(context: context);
                                              _resetForm();
                                            }                                          }else if(_tipoSelecionado == 'tutor') {
                                            final tutorData = TutorRequestModel(
                                              nome: _nameController.text,
                                              login: _emailController.text,
                                              senha: _senhaController.text,
                                              especialidade: _especialidadeController.text,
                                              matricula:0,
                                            );
                                            final success = await viewModel.registerNewTutor(tutorData);
                                            print('Salvo com sucesso $success');
                                            if(success && viewModel.errorMessage == null){
                                              AuthModals.userCreatedSuccess(context: context);
                                              LoginRoute().pushReplacement(context);
                                              _resetForm();
                                            } else {
                                              viewModel.errorMessage ?? 'Usuário Duplicado';
                                              AuthModals.userRegisterError(context: context);
                                              _resetForm();
                                            }                                          }else if(_tipoSelecionado == 'interprete') {
                                            final interpreteData = InterpreteRequestModel(
                                              nome: _nameController.text,
                                              login: _emailController.text,
                                              senha: _senhaController.text,
                                              salary: 0,
                                              especialidade: _especialidadeController.text,
                                              matricula:0,
                                            );
                                            final success = await viewModel.registerNewInterprete(interpreteData);
                                            print('Salvo com sucesso $success');
                                            if(success && viewModel.errorMessage == null){
                                              AuthModals.userCreatedSuccess(context: context);
                                              LoginRoute().pushReplacement(context);
                                              _resetForm();
                                            } else {
                                              viewModel.errorMessage ?? 'Usuário Duplicado';
                                              AuthModals.userRegisterError(context: context);
                                              _resetForm();
                                            }
                                          }else if(_tipoSelecionado == 'aluno') {
                                            final alunoData = AlunoRequestModel(
                                              nome: _nameController.text,
                                              login: _emailController.text,
                                              senha: _senhaController.text,
                                              curso: _cursoSelecionado!,
                                              matricula:0,
                                            );
                                            final success = await viewModel.registerNewAluno(alunoData);
                                            print('Salvo com sucesso $success');
                                            if(success && viewModel.errorMessage == null){
                                              AuthModals.userCreatedSuccess(context: context);
                                              LoginRoute().pushReplacement(context);
                                              _resetForm();
                                            } else {
                                              viewModel.errorMessage ?? 'Usuário Duplicado';
                                              AuthModals.userRegisterError(context: context);
                                              _resetForm();
                                            }
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromRGBO(76, 159, 132, 1),
                                            foregroundColor: Color.fromRGBO(255, 255, 255, 1)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Cadastrar',
                                            style: TextStyle(
                                                fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize
                                                    ?? 18) * fontScale,
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
                                            color: Theme.of(context).colorScheme.onSurface,
                                            fontSize: (Theme.of(context).textTheme.bodyMedium?.fontSize
                                                ?? 16) * fontScale,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              LoginRoute().pushReplacement(context);
                                            },
                                            child: Text(
                                              'Entre',
                                              style: TextStyle(
                                                  color: Theme.of(context).colorScheme.onSurface,
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
                    ),
                  )
              )
            ],
          )
        ],
      ),
    );
  }
  _buildIntro(context){
    return Stack(
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
                      onTap: () => AboutUsRoute().go(context),
                      imagePath: 'assets/logo/logo_expanded_light.svg',
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
        ]
    );
  }
}
