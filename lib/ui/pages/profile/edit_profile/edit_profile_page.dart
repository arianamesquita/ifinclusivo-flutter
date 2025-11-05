import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/validators/curso_validator.dart';
import 'package:if_inclusivo/domain/validators/matricula_validator.dart';
import 'package:if_inclusivo/domain/validators/name_validator.dart';
import 'package:if_inclusivo/ui/pages/profile/edit_profile/viewModels/edit_profile_viewmodel.dart';
import 'package:lucid_validation/lucid_validation.dart';
import 'package:provider/provider.dart';
import '../../../../utils/responsive_utils.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<EditProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _validateForm() {
    return true;
    //final ValidationResult result = loginValidator.validate(loginModel);
    //return result.isValid;
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final fontScale = ResponsiveUtils.fontScale(context);

    return Consumer<EditProfileViewmodel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Card(child: _SampleCard(cardName: 'Testando')),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _SampleCard extends StatefulWidget {
  const _SampleCard({required this.cardName});
  final String cardName;

  @override
  State<_SampleCard> createState() => _SampleCardState();
}

class _SampleCardState extends State<_SampleCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildIntroFoto(context),

          const SizedBox(height: 50),

          _buildForm(context)
        ],
      ),
    );
  }

  _buildIntroFoto(context){
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 230,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(123, 31, 162, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
        ),

        Positioned.fill(
          child: Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 100,
                  child: const CircleAvatar(
                    radius: 96,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=3', // exemplo
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Editar foto')),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(123, 31, 162, 1),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 6),
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildForm(context){
    final TextEditingController _nameController = TextEditingController();
    final NameFieldValidator nameValidator = NameFieldValidator();
    final TextEditingController _biografiaController = TextEditingController();
    final TextEditingController _matriculaController = TextEditingController();
    final MatriculaFieldValidator matriculaValidator = MatriculaFieldValidator();
    final TextEditingController _cursoController = TextEditingController();
    final CursoFieldValidator cursoValidator = CursoFieldValidator();

    bool isNameError = false;
    String errorName = '';
    bool isMatriculaError = false;
    String errorMatricula = '';
    bool isCursoError = false;
    String errorCurso = '';
    return Padding(
        padding: const EdgeInsets.only(left: 100.0,
          right: 100.0,
          top: 0.0,
          bottom: 0.0
        ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child:
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Nome: "
                        ),
                      ),
                  ),
                  TextFormField(
                    controller: _nameController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Digite seu nome completo',
                      filled: true,
                      suffixIcon: IconButton(
                        icon: const Icon(
                            Icons.edit_outlined,
                            color: Colors.grey
                        ),
                        onPressed: () {
                          // ação ao clicar no ícone
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Editar campo')),
                          );
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      errorText: isNameError ? errorName : null,
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
                  SizedBox(height: 25,),
                  Align(
                    alignment: Alignment.topLeft,
                    child:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          "Matrícula: "
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _matriculaController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Digite sua matrícula',
                      filled: true,
                      suffixIcon: IconButton(
                        icon: const Icon(
                            Icons.edit_outlined,
                            color: Colors.grey
                        ),
                        onPressed: () {
                          // ação ao clicar no ícone
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Editar campo')),
                          );
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      errorText: isMatriculaError ? errorMatricula : null,
                    ),
                    validator: (String? value) {
                      final matricula = MatriculaModel(matricula: value ?? '');
                      final ValidationResult result = matriculaValidator.validate(matricula);
                      if (result.isValid) {
                        setState(() => isMatriculaError = false);
                        return null;
                      }
                      setState(() {
                        isMatriculaError = true;
                        errorMatricula = 'Matrícula inválido, ex: 2020222222222222';
                      });
                      return errorMatricula;
                    },
                  )
                ],
              ),
          ),
          SizedBox(width: 50,),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        "Biografia: "
                    ),
                  ),
                ),
                TextFormField(
                  controller: _biografiaController,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Digite sua biografia',
                    filled: true,
                    suffixIcon: IconButton(
                      icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.grey
                      ),
                      onPressed: () {
                        // ação ao clicar no ícone
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Editar campo')),
                        );
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    errorText: isNameError ? errorName : null,
                  ),
                ),
                SizedBox(height: 25,),
                Align(
                  alignment: Alignment.topLeft,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        "Curso: "
                    ),
                  ),
                ),
                TextFormField(
                  controller: _cursoController,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Digite seu curso',
                    filled: true,
                    suffixIcon: IconButton(
                      icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.grey
                      ),
                      onPressed: () {
                        // ação ao clicar no ícone
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Editar campo')),
                        );
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    errorText: isCursoError ? errorCurso : null,
                  ),
                  validator: (String? value) {
                    final curso = CursoModel(curso: value ?? '');
                    final ValidationResult result = cursoValidator.validate(curso);
                    if (result.isValid) {
                      setState(() => isCursoError = false);
                      return null;
                    }
                    setState(() {
                      isCursoError = true;
                      errorCurso = 'Curso inválido, ex: Sistemas de Informação';
                    });
                    return errorCurso;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
