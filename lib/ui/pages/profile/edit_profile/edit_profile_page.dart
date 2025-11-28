import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/enums/cursos.dart';
import 'package:if_inclusivo/domain/validators/curso_validator.dart';
import 'package:if_inclusivo/domain/validators/matricula_validator.dart';
import 'package:if_inclusivo/domain/validators/name_validator.dart';
import 'package:if_inclusivo/guards/roles.dart';
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
    Future.microtask(() {
      context.read<EditProfileViewmodel>().carregarUsuario();
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final fontScale = ResponsiveUtils.fontScale(context);

    return Consumer<EditProfileViewmodel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                child: _SampleCard(cardName: 'Perfil'),
              ),
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
  // --- Controllers fixos ---
  final _nameController = TextEditingController();
  final _biografiaController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _cursoController = TextEditingController();
  final _especialidadeController = TextEditingController();
  final _formacaoController = TextEditingController();

  // --- Estados de edição ---
  bool _isEditingName = false;
  bool _isEditingMatricula = false;
  bool _isEditingBiografia = false;
  bool _isEditingCurso = false;

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _matriculaFocus = FocusNode();
  final FocusNode _biografiaFocus = FocusNode();
  final FocusNode _cursoFocus = FocusNode();
  final FocusNode _especialidadeFocus = FocusNode();
  final FocusNode _formacaoFocus = FocusNode();

  // --- Estados de erro ---
  bool isNameError = false;
  String errorName = '';
  bool isMatriculaError = false;
  String errorMatricula = '';
  bool isCursoError = false;
  String errorCurso = '';

  bool _podeEditar(user) {
    if (user == null) return false;

    return user.roles?.contains(Roles.ROLE_ALUNO) == true ||
        user.roles?.contains(Roles.ROLE_ALUNO_NAPNE) == true ||
        user.roles?.contains(Roles.ROLE_PROFESSOR) == true ||
        user.roles?.contains(Roles.ROLE_TUTOR) == true ||
        user.roles?.contains(Roles.ROLE_INTERPRETE) == true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = context.watch<EditProfileViewmodel>().usuario;
    if (user != null) {
      // Preenche uma única vez
      if (_nameController.text.isEmpty) {
        _nameController.text = user.nome ?? '';
        _biografiaController.text = user.biografia ?? '';
        _matriculaController.text = user.matricula?.toString() ?? '';
        _cursoController.text = 'Sistemas de Informação';
        // _especialidadeController.text = user.especialidade ?? '';
        // _formacaoController.text = user.formacao ?? '';
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _biografiaController.dispose();
    _matriculaController.dispose();
    _cursoController.dispose();

    _nameFocus.dispose();
    _matriculaFocus.dispose();
    _biografiaFocus.dispose();
    _cursoFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileViewmodel>(
      builder: (context, viewModel, child) {
        final user = viewModel.usuario;
        final podeEditar = _podeEditar(user);

        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildIntroFoto(context, user?.imgPerfil),
              const SizedBox(height: 50),
              _buildForm(context, user),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: podeEditar ? () => _onSavePressed(context) : null,
                icon: const Icon(Icons.save_outlined),
                label: const Text("Salvar alterações"),
              ),
            ],
          ),
        );
      },
    );
  }

  // --- Foto de perfil ---
  Widget _buildIntroFoto(BuildContext context, String? fotoUrl) {
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
                  backgroundImage: NetworkImage(
                    fotoUrl ??
                        'https://i.pravatar.cc/150?img=3', // imagem padrão
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
                        color: const Color.fromRGBO(123, 31, 162, 1),
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

  // --- Formulário ---
  Widget _buildForm(BuildContext context, user) {
    final nameValidator = NameFieldValidator();
    final matriculaValidator = MatriculaFieldValidator();
    final cursoValidator = CursoFieldValidator();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Coluna 1 - Nome / Matrícula
          Flexible(
            child: Column(
              children: [
                _buildField(
                  context,
                  label: "Nome",
                  controller: _nameController,
                  isEditing: _isEditingName,
                  focusNode: _nameFocus,
                  onToggleEditing: (value) {
                    setState(() => _isEditingName = value);
                  },
                  validator: (value) {
                    final name = NameModel(name: value ?? '');
                    final result = nameValidator.validate(name);
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
                  errorText: isNameError ? errorName : null,
                ),
                const SizedBox(height: 25),
                _buildField(
                  context,
                  label: "Matrícula",
                  controller: _matriculaController,
                  isEditing: _isEditingMatricula,
                  onToggleEditing: (value) {
                    setState(() => _isEditingMatricula = value);
                  },
                  focusNode: _matriculaFocus,
                  validator: (value) {
                    final matricula = MatriculaModel(matricula: value ?? '');
                    final result = matriculaValidator.validate(matricula);
                    if (result.isValid) {
                      setState(() => isMatriculaError = false);
                      return null;
                    }
                    setState(() {
                      isMatriculaError = true;
                      errorMatricula = 'Matrícula inválida, ex: 2020222222222222';
                    });
                    return errorMatricula;
                  },
                  errorText: isMatriculaError ? errorMatricula : null,
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          // Coluna 2 - Biografia / Campo condicional
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildField(
                  context,
                  label: "Biografia",
                  controller: _biografiaController,
                  isEditing: _isEditingBiografia,
                  onToggleEditing: (value) {
                    setState(() => _isEditingBiografia = value);
                  },
                  focusNode: _biografiaFocus,
                ),
                const SizedBox(height: 25),
                if (user?.roles?.contains(Roles.ROLE_ALUNO) == true ||
                    user?.roles?.contains(Roles.ROLE_ALUNO_NAPNE) == true)
                  _buildField(
                    context,
                    label: "Curso",
                    controller: _cursoController,
                    isEditing: _isEditingCurso,
                    focusNode: _cursoFocus,
                    onToggleEditing: (value) {
                      setState(() => _isEditingCurso = value);
                    },
                    validator: (value) {
                      final curso = CursoModel(curso: value ?? '');
                      final result = cursoValidator.validate(curso);
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
                    errorText: isCursoError ? errorCurso : null,
                  )
                else if (user?.roles?.contains(Roles.ROLE_PROFESSOR) == true)
                  _buildField(
                    context,
                    label: "Formação",
                    controller: _cursoController,
                    isEditing: _isEditingCurso,
                    focusNode: _cursoFocus,
                    onToggleEditing: (value) {
                      setState(() => _isEditingCurso = value);
                    },
                  )
                else if (user?.roles?.contains(Roles.ROLE_TUTOR) == true ||
                      user?.roles?.contains(Roles.ROLE_INTERPRETE) == true)
                    _buildField(
                      context,
                      label: "Especialidade",
                      controller: _cursoController,
                      isEditing: _isEditingCurso,
                      focusNode: _cursoFocus,
                      onToggleEditing: (value) {
                        setState(() => _isEditingCurso = value);
                      },
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Campo reutilizável ---
  Widget _buildField(
      BuildContext context, {
        required String label,
        required TextEditingController controller,
        required bool isEditing,
        required FocusNode focusNode,
        required void Function(bool newValue) onToggleEditing,
        String? Function(String?)? validator,
        String? errorText,
      }) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(label),
        ),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          readOnly: isEditing,
          enabled: true,
          validator: validator,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            hintText: 'Digite a $label',
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(
                isEditing ? Icons.check_outlined : Icons.edit_outlined,
                color: isEditing ? Colors.green : Colors.grey,
              ),
              onPressed: () {
                final bool newState = !isEditing;
                onToggleEditing(newState);
                if (newState) {
                  Future.delayed(const Duration(milliseconds: 50), () {
                    focusNode.requestFocus();
                  });
                } else {
                  focusNode.unfocus();
                }
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorText: errorText,
          ),
        ),
      ],
    );
  }

  void _onSavePressed(BuildContext context) {
    final viewModel = context.read<EditProfileViewmodel>();
    final user = viewModel.usuario;

    // Validação
    if (isNameError || isMatriculaError || isCursoError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Corrija os erros antes de salvar."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (user?.roles?.contains(Roles.ROLE_ALUNO) == true ||
        user?.roles?.contains(Roles.ROLE_ALUNO_NAPNE) == true) {
      _salvarAluno(viewModel);
    }
    else if (user?.roles?.contains(Roles.ROLE_PROFESSOR) == true) {
      _salvarProfessor(viewModel);
    }
    else if (user?.roles?.contains(Roles.ROLE_TUTOR) == true) {
      _salvarTutor(viewModel);
    }
    else if (user?.roles?.contains(Roles.ROLE_INTERPRETE) == true) {
      _salvarInterprete(viewModel);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Perfil atualizado!"),
        backgroundColor: Colors.green,
      ),
    );

    setState(() {
      _isEditingName = false;
      _isEditingBiografia = false;
      _isEditingCurso = false;
      _isEditingMatricula = false;
    });
  }

  void _salvarAluno(EditProfileViewmodel viewModel) {
    final user = viewModel.usuario;

    AlunoDetailsRequestModel aluno = AlunoDetailsRequestModel(
      nome: _isEditingName && _nameController.text.isNotEmpty
          ? _nameController.text
          : user?.nome ?? '',
      matricula: _isEditingMatricula && _matriculaController.text.isNotEmpty
          ? int.parse(_matriculaController.text)
          : user?.matricula ?? 0,
      curso: _isEditingCurso && _cursoController.text.isNotEmpty
          ? Cursos.SI
          : Cursos.SI,
    );

    viewModel.updateAluno(aluno);
  }


  void _salvarProfessor(EditProfileViewmodel viewModel) {
    final user = viewModel.usuario;

    ProfessorDetailsRequestModel professor = ProfessorDetailsRequestModel(
      nome: _isEditingName && _nameController.text.isNotEmpty
          ? _nameController.text
          : user?.nome ?? '',
      matricula: _isEditingMatricula && _matriculaController.text.isNotEmpty
          ? int.parse(_matriculaController.text)
          : user?.matricula ?? 0,
      formacao: _isEditingCurso && _cursoController.text.isNotEmpty
          ? _cursoController.text
          : user?.nome ?? '',
    );

    viewModel.updateProfessor(professor);
  }


  void _salvarTutor(EditProfileViewmodel viewModel) {
    final user = viewModel.usuario;

    TutorDetailsRequestModel tutor = TutorDetailsRequestModel(
      nome: _isEditingName && _nameController.text.isNotEmpty
          ? _nameController.text
          : user?.nome ?? '',
      matricula: _isEditingMatricula && _matriculaController.text.isNotEmpty
          ? int.parse(_matriculaController.text)
          : user?.matricula ?? 0,
      especialidade: _isEditingBiografia && _biografiaController.text.isNotEmpty
          ? _biografiaController.text
          : user?.nome ?? '',
    );

    viewModel.updateTutor(tutor);
  }


  void _salvarInterprete(EditProfileViewmodel viewModel) {
    final user = viewModel.usuario;

    InterpreteDetailsRequestModel interprete = InterpreteDetailsRequestModel(
      nome: _isEditingName && _nameController.text.isNotEmpty
          ? _nameController.text
          : user?.nome ?? '',
      matricula: _isEditingMatricula && _matriculaController.text.isNotEmpty
          ? int.parse(_matriculaController.text)
          : user?.matricula ?? 0,
      especialidade: _isEditingBiografia && _biografiaController.text.isNotEmpty
          ? _biografiaController.text
          : user?.nome ?? '',
      salary: _isEditingMatricula && _matriculaController.text.isNotEmpty
          ? double.tryParse(_matriculaController.text) ?? 0
          : 0,
    );

    viewModel.updateInterprete(interprete);
  }


}
