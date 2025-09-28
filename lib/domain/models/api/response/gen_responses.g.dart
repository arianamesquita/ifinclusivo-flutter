// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlunoResponseModelImpl _$$AlunoResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$AlunoResponseModelImpl(
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
  login: json['login'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  configAcessibilidadeEntity:
      json['configAcessibilidadeEntity'] == null
          ? null
          : ConfigAcblResponseModel.fromJson(
            json['configAcessibilidadeEntity'] as Map<String, dynamic>,
          ),
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumMap, e))
          .toList(),
  token: json['token'] as String?,
  firebaseToken: json['firebaseToken'] as String?,
  curso: CursoRequestModel.fromJson(json['curso'] as Map<String, dynamic>),
  $type: json['userType'] as String?,
);

Map<String, dynamic> _$$AlunoResponseModelImplToJson(
  _$AlunoResponseModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'login': instance.login,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'configAcessibilidadeEntity': instance.configAcessibilidadeEntity,
  'roles': instance.roles.map((e) => _$RolesEnumMap[e]!).toList(),
  'token': instance.token,
  'firebaseToken': instance.firebaseToken,
  'curso': instance.curso,
  'userType': instance.$type,
};

const _$RolesEnumMap = {
  Roles.ROLE_ALUNO: 'ROLE_ALUNO',
  Roles.ROLE_ALUNO_NAPNE: 'ROLE_ALUNO_NAPNE',
  Roles.ROLE_PROFESSOR: 'ROLE_PROFESSOR',
  Roles.ROLE_TUTOR: 'ROLE_TUTOR',
  Roles.ROLE_INTERPRETE: 'ROLE_INTERPRETE',
};

_$AlunoNapneResponseModelImpl _$$AlunoNapneResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$AlunoNapneResponseModelImpl(
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
  login: json['login'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  configAcessibilidadeEntity:
      json['configAcessibilidadeEntity'] == null
          ? null
          : ConfigAcblResponseModel.fromJson(
            json['configAcessibilidadeEntity'] as Map<String, dynamic>,
          ),
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumMap, e))
          .toList(),
  token: json['token'] as String?,
  firebaseToken: json['firebaseToken'] as String?,
  curso: CursoRequestModel.fromJson(json['curso'] as Map<String, dynamic>),
  condicao: json['condicao'] as String,
  laudo: json['laudo'] as String,
  necessidadeEspecial: json['necessidadeEspecial'] as String,
  necessidadeEscolar: json['necessidadeEscolar'] as String,
  acompanhamento: json['acompanhamento'] as String,
  situacao: json['situacao'] as String,
  $type: json['userType'] as String?,
);

Map<String, dynamic> _$$AlunoNapneResponseModelImplToJson(
  _$AlunoNapneResponseModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'login': instance.login,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'configAcessibilidadeEntity': instance.configAcessibilidadeEntity,
  'roles': instance.roles.map((e) => _$RolesEnumMap[e]!).toList(),
  'token': instance.token,
  'firebaseToken': instance.firebaseToken,
  'curso': instance.curso,
  'condicao': instance.condicao,
  'laudo': instance.laudo,
  'necessidadeEspecial': instance.necessidadeEspecial,
  'necessidadeEscolar': instance.necessidadeEscolar,
  'acompanhamento': instance.acompanhamento,
  'situacao': instance.situacao,
  'userType': instance.$type,
};

_$ProfessorResponseModelImpl _$$ProfessorResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProfessorResponseModelImpl(
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
  login: json['login'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  configAcessibilidadeEntity:
      json['configAcessibilidadeEntity'] == null
          ? null
          : ConfigAcblResponseModel.fromJson(
            json['configAcessibilidadeEntity'] as Map<String, dynamic>,
          ),
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumMap, e))
          .toList(),
  token: json['token'] as String?,
  firebaseToken: json['firebaseToken'] as String?,
  formacao: json['formacao'] as String,
  topicos:
      (json['topicos'] as List<dynamic>)
          .map((e) => SimpleTopicoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  $type: json['userType'] as String?,
);

Map<String, dynamic> _$$ProfessorResponseModelImplToJson(
  _$ProfessorResponseModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'login': instance.login,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'configAcessibilidadeEntity': instance.configAcessibilidadeEntity,
  'roles': instance.roles.map((e) => _$RolesEnumMap[e]!).toList(),
  'token': instance.token,
  'firebaseToken': instance.firebaseToken,
  'formacao': instance.formacao,
  'topicos': instance.topicos,
  'userType': instance.$type,
};

_$TutorResponseModelImpl _$$TutorResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$TutorResponseModelImpl(
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
  login: json['login'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  configAcessibilidadeEntity:
      json['configAcessibilidadeEntity'] == null
          ? null
          : ConfigAcblResponseModel.fromJson(
            json['configAcessibilidadeEntity'] as Map<String, dynamic>,
          ),
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumMap, e))
          .toList(),
  token: json['token'] as String?,
  firebaseToken: json['firebaseToken'] as String?,
  especialidade: json['especialidade'] as String,
  $type: json['userType'] as String?,
);

Map<String, dynamic> _$$TutorResponseModelImplToJson(
  _$TutorResponseModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'login': instance.login,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'configAcessibilidadeEntity': instance.configAcessibilidadeEntity,
  'roles': instance.roles.map((e) => _$RolesEnumMap[e]!).toList(),
  'token': instance.token,
  'firebaseToken': instance.firebaseToken,
  'especialidade': instance.especialidade,
  'userType': instance.$type,
};

_$InterpreteResponseModelImpl _$$InterpreteResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$InterpreteResponseModelImpl(
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
  login: json['login'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  configAcessibilidadeEntity:
      json['configAcessibilidadeEntity'] == null
          ? null
          : ConfigAcblResponseModel.fromJson(
            json['configAcessibilidadeEntity'] as Map<String, dynamic>,
          ),
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumMap, e))
          .toList(),
  token: json['token'] as String?,
  firebaseToken: json['firebaseToken'] as String?,
  especialidade: json['especialidade'] as String,
  salary: (json['salary'] as num).toDouble(),
  libras:
      (json['libras'] as List<dynamic>)
          .map((e) => SimpleLibrasModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  $type: json['userType'] as String?,
);

Map<String, dynamic> _$$InterpreteResponseModelImplToJson(
  _$InterpreteResponseModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'login': instance.login,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'configAcessibilidadeEntity': instance.configAcessibilidadeEntity,
  'roles': instance.roles.map((e) => _$RolesEnumMap[e]!).toList(),
  'token': instance.token,
  'firebaseToken': instance.firebaseToken,
  'especialidade': instance.especialidade,
  'salary': instance.salary,
  'libras': instance.libras,
  'userType': instance.$type,
};

_$AutorCardModelImpl _$$AutorCardModelImplFromJson(Map<String, dynamic> json) =>
    _$AutorCardModelImpl(
      id: (json['id'] as num).toInt(),
      nome: json['nome'] as String,
    );

Map<String, dynamic> _$$AutorCardModelImplToJson(
  _$AutorCardModelImpl instance,
) => <String, dynamic>{'id': instance.id, 'nome': instance.nome};

_$PublicacaoDetalhadaModelImpl _$$PublicacaoDetalhadaModelImplFromJson(
  Map<String, dynamic> json,
) => _$PublicacaoDetalhadaModelImpl(
  id: (json['id'] as num).toInt(),
  titulo: json['titulo'] as String,
  texto: json['texto'] as String,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  usuario: AutorCardModel.fromJson(json['usuario'] as Map<String, dynamic>),
  categorias:
      (json['categorias'] as List<dynamic>)
          .map((e) => $enumDecode(_$CategoriasEnumMap, e))
          .toSet(),
  totalLikes: (json['totalLikes'] as num).toInt(),
  totalRespostas: (json['totalRespostas'] as num).toInt(),
  curtidoPeloUsuario: json['curtidoPeloUsuario'] as bool,
  respostaEscolhidaId: (json['respostaEscolhidaId'] as num?)?.toInt(),
);

Map<String, dynamic> _$$PublicacaoDetalhadaModelImplToJson(
  _$PublicacaoDetalhadaModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'titulo': instance.titulo,
  'texto': instance.texto,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'usuario': instance.usuario.toJson(),
  'categorias':
      instance.categorias.map((e) => _$CategoriasEnumMap[e]!).toList(),
  'totalLikes': instance.totalLikes,
  'totalRespostas': instance.totalRespostas,
  'curtidoPeloUsuario': instance.curtidoPeloUsuario,
  'respostaEscolhidaId': instance.respostaEscolhidaId,
};

const _$CategoriasEnumMap = {
  Categorias.REDES: 'REDES',
  Categorias.BANCO_DE_DADOS: 'BANCO_DE_DADOS',
  Categorias.PROGRAMACAO: 'PROGRAMACAO',
  Categorias.WEB: 'WEB',
  Categorias.ESTRUTURA_DE_DADOS: 'ESTRUTURA_DE_DADOS',
  Categorias.ARQUITETURA_DE_COMPUTADORES: 'ARQUITETURA_DE_COMPUTADORES',
};

_$PublicacaoCardModelImpl _$$PublicacaoCardModelImplFromJson(
  Map<String, dynamic> json,
) => _$PublicacaoCardModelImpl(
  id: (json['id'] as num).toInt(),
  titulo: json['titulo'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  usuario: AutorCardModel.fromJson(json['usuario'] as Map<String, dynamic>),
  totalLikes: (json['totalLikes'] as num).toInt(),
  totalRespostas: (json['totalRespostas'] as num).toInt(),
  curtidoPeloUsuario: json['curtidoPeloUsuario'] as bool,
);

Map<String, dynamic> _$$PublicacaoCardModelImplToJson(
  _$PublicacaoCardModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'titulo': instance.titulo,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'usuario': instance.usuario.toJson(),
  'totalLikes': instance.totalLikes,
  'totalRespostas': instance.totalRespostas,
  'curtidoPeloUsuario': instance.curtidoPeloUsuario,
};

_$PublicacaoCompletaModelImpl _$$PublicacaoCompletaModelImplFromJson(
  Map<String, dynamic> json,
) => _$PublicacaoCompletaModelImpl(
  pais:
      (json['pais'] as List<dynamic>)
          .map((e) => PublicacaoCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  publicacao: PublicacaoDetalhadaModel.fromJson(
    json['publicacao'] as Map<String, dynamic>,
  ),
  respostas:
      (json['respostas'] as List<dynamic>)
          .map(
            (e) => PublicacaoDetalhadaModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$$PublicacaoCompletaModelImplToJson(
  _$PublicacaoCompletaModelImpl instance,
) => <String, dynamic>{
  'pais': instance.pais.map((e) => e.toJson()).toList(),
  'publicacao': instance.publicacao.toJson(),
  'respostas': instance.respostas.map((e) => e.toJson()).toList(),
};

_$LibrasResponseModelImpl _$$LibrasResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$LibrasResponseModelImpl(
  id: (json['id'] as num).toInt(),
  palavra: json['palavra'] as String,
  descricao: json['descricao'] as String,
  url: json['url'] as String?,
  video: json['video'] as String?,
  foto: json['foto'] as String?,
  justificativa: json['justificativa'] as String?,
  status: $enumDecode(_$StatusEnumMap, json['status']),
  categorias: $enumDecode(_$CategoriasEnumMap, json['categorias']),
  sugeriu:
      (json['sugeriu'] as List<dynamic>)
          .map((e) => SimpleUsuarioModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  interprete:
      (json['interprete'] as List<dynamic>)
          .map((e) => SimpleUsuarioModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$LibrasResponseModelImplToJson(
  _$LibrasResponseModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'palavra': instance.palavra,
  'descricao': instance.descricao,
  'url': instance.url,
  'video': instance.video,
  'foto': instance.foto,
  'justificativa': instance.justificativa,
  'status': _$StatusEnumMap[instance.status]!,
  'categorias': _$CategoriasEnumMap[instance.categorias]!,
  'sugeriu': instance.sugeriu.map((e) => e.toJson()).toList(),
  'interprete': instance.interprete.map((e) => e.toJson()).toList(),
};

const _$StatusEnumMap = {
  Status.APROVADO: 'APROVADO',
  Status.REPROVADO: 'REPROVADO',
  Status.EMANALISE: 'EMANALISE',
};

_$MessageResponseModelImpl _$$MessageResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$MessageResponseModelImpl(
  id: json['id'] as String,
  text: json['text'] as String,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  visualizado: json['visualizado'] as bool,
  userEnvia: SimpleUsuarioModel.fromJson(
    json['userEnvia'] as Map<String, dynamic>,
  ),
  userRecebe: SimpleUsuarioModel.fromJson(
    json['userRecebe'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$MessageResponseModelImplToJson(
  _$MessageResponseModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'visualizado': instance.visualizado,
  'userEnvia': instance.userEnvia.toJson(),
  'userRecebe': instance.userRecebe.toJson(),
};

_$CursoResponseModelImpl _$$CursoResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$CursoResponseModelImpl(
  id: json['id'] as String,
  nome: json['nome'] as String,
  alunos:
      (json['alunos'] as List<dynamic>)
          .map((e) => SimpleUsuarioModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$CursoResponseModelImplToJson(
  _$CursoResponseModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'alunos': instance.alunos.map((e) => e.toJson()).toList(),
};

_$ConfigAcblResponseModelImpl _$$ConfigAcblResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$ConfigAcblResponseModelImpl(
  id: json['id'] as String,
  audicao: json['audicao'] as String?,
  tema: $enumDecode(_$TemaCSSEnumMap, json['tema']),
  zoom: json['zoom'] as String?,
);

Map<String, dynamic> _$$ConfigAcblResponseModelImplToJson(
  _$ConfigAcblResponseModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'audicao': instance.audicao,
  'tema': _$TemaCSSEnumMap[instance.tema]!,
  'zoom': instance.zoom,
};

const _$TemaCSSEnumMap = {TemaCSS.TEMA1: 1, TemaCSS.TEMA2: 2, TemaCSS.TEMA3: 3};
