// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_simple_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SimpleLibrasModelImpl _$$SimpleLibrasModelImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleLibrasModelImpl(
  id: json['id'] as String,
  palavra: json['palavra'] as String,
  categorias: $enumDecode(_$CategoriasEnumMap, json['categorias']),
);

Map<String, dynamic> _$$SimpleLibrasModelImplToJson(
  _$SimpleLibrasModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'palavra': instance.palavra,
  'categorias': _$CategoriasEnumMap[instance.categorias]!,
};

const _$CategoriasEnumMap = {
  Categorias.REDES: 'REDES',
  Categorias.BANCO_DE_DADOS: 'BANCO_DE_DADOS',
  Categorias.PROGRAMACAO: 'PROGRAMACAO',
  Categorias.WEB: 'WEB',
  Categorias.ESTRUTURA_DE_DADOS: 'ESTRUTURA_DE_DADOS',
  Categorias.ARQUITETURA_DE_COMPUTADORES: 'ARQUITETURA_DE_COMPUTADORES',
};

_$SimpleTopicoModelImpl _$$SimpleTopicoModelImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleTopicoModelImpl(
  id: json['id'] as String,
  titulo: json['titulo'] as String,
  descricao: json['descricao'] as String,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  professor: SimpleUsuarioModel.fromJson(
    json['professor'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$SimpleTopicoModelImplToJson(
  _$SimpleTopicoModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'titulo': instance.titulo,
  'descricao': instance.descricao,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'professor': instance.professor,
};

_$SimplePublicacaoModelImpl _$$SimplePublicacaoModelImplFromJson(
  Map<String, dynamic> json,
) => _$SimplePublicacaoModelImpl(
  id: json['id'] as String,
  titulo: json['titulo'] as String,
  text: json['text'] as String,
  urlVideo: json['urlVideo'] as String?,
  urlFoto: json['urlFoto'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  usuario: SimpleUsuarioModel.fromJson(json['usuario'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$SimplePublicacaoModelImplToJson(
  _$SimplePublicacaoModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'titulo': instance.titulo,
  'text': instance.text,
  'urlVideo': instance.urlVideo,
  'urlFoto': instance.urlFoto,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'usuario': instance.usuario,
};

_$SimpleComentarioModelImpl _$$SimpleComentarioModelImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleComentarioModelImpl(
  id: json['id'] as String,
  content: json['content'] as String,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
);

Map<String, dynamic> _$$SimpleComentarioModelImplToJson(
  _$SimpleComentarioModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'content': instance.content,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
};

_$SimpleUsuarioModelUsuarioImpl _$$SimpleUsuarioModelUsuarioImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleUsuarioModelUsuarioImpl(
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumMap, e))
          .toList(),
  $type: json['userType'] as String?,
);

Map<String, dynamic> _$$SimpleUsuarioModelUsuarioImplToJson(
  _$SimpleUsuarioModelUsuarioImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'roles': instance.roles.map((e) => _$RolesEnumMap[e]!).toList(),
  'userType': instance.$type,
};

const _$RolesEnumMap = {
  Roles.ROLE_ALUNO: 'ROLE_ALUNO',
  Roles.ROLE_ALUNO_NAPNE: 'ROLE_ALUNO_NAPNE',
  Roles.ROLE_PROFESSOR: 'ROLE_PROFESSOR',
  Roles.ROLE_TUTOR: 'ROLE_TUTOR',
  Roles.ROLE_INTERPRETE: 'ROLE_INTERPRETE',
};

_$SimpleTutorModelImpl _$$SimpleTutorModelImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleTutorModelImpl(
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumMap, e))
          .toList(),
  especialidade: json['especialidade'] as String,
  $type: json['userType'] as String?,
);

Map<String, dynamic> _$$SimpleTutorModelImplToJson(
  _$SimpleTutorModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'roles': instance.roles.map((e) => _$RolesEnumMap[e]!).toList(),
  'especialidade': instance.especialidade,
  'userType': instance.$type,
};

_$SimpleProfessorModelImpl _$$SimpleProfessorModelImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleProfessorModelImpl(
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumMap, e))
          .toList(),
  formacao: json['formacao'] as String,
  $type: json['userType'] as String?,
);

Map<String, dynamic> _$$SimpleProfessorModelImplToJson(
  _$SimpleProfessorModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'roles': instance.roles.map((e) => _$RolesEnumMap[e]!).toList(),
  'formacao': instance.formacao,
  'userType': instance.$type,
};

_$SimpleAlunoModelImpl _$$SimpleAlunoModelImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleAlunoModelImpl(
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumMap, e))
          .toList(),
  curso: CursoRequestModel.fromJson(json['curso'] as Map<String, dynamic>),
  $type: json['userType'] as String?,
);

Map<String, dynamic> _$$SimpleAlunoModelImplToJson(
  _$SimpleAlunoModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'roles': instance.roles.map((e) => _$RolesEnumMap[e]!).toList(),
  'curso': instance.curso,
  'userType': instance.$type,
};

_$SimpleAlunoNapneModelImpl _$$SimpleAlunoNapneModelImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleAlunoNapneModelImpl(
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumMap, e))
          .toList(),
  curso: CursoRequestModel.fromJson(json['curso'] as Map<String, dynamic>),
  condicao: json['condicao'] as String,
  necessidadeEspecial: json['necessidadeEspecial'] as String,
  necessidadeEscolar: json['necessidadeEscolar'] as String,
  $type: json['userType'] as String?,
);

Map<String, dynamic> _$$SimpleAlunoNapneModelImplToJson(
  _$SimpleAlunoNapneModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'roles': instance.roles.map((e) => _$RolesEnumMap[e]!).toList(),
  'curso': instance.curso,
  'condicao': instance.condicao,
  'necessidadeEspecial': instance.necessidadeEspecial,
  'necessidadeEscolar': instance.necessidadeEscolar,
  'userType': instance.$type,
};

_$SimpleInterpreteModelImpl _$$SimpleInterpreteModelImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleInterpreteModelImpl(
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  dataCriacao: DateTime.parse(json['dataCriacao'] as String),
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumMap, e))
          .toList(),
  especialidade: json['especialidade'] as String,
  salary: (json['salary'] as num).toDouble(),
  $type: json['userType'] as String?,
);

Map<String, dynamic> _$$SimpleInterpreteModelImplToJson(
  _$SimpleInterpreteModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'dataCriacao': instance.dataCriacao.toIso8601String(),
  'roles': instance.roles.map((e) => _$RolesEnumMap[e]!).toList(),
  'especialidade': instance.especialidade,
  'salary': instance.salary,
  'userType': instance.$type,
};

_$SimpleMessageModelImpl _$$SimpleMessageModelImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleMessageModelImpl(
  id: json['id'] as String,
  text: json['text'] as String,
);

Map<String, dynamic> _$$SimpleMessageModelImplToJson(
  _$SimpleMessageModelImpl instance,
) => <String, dynamic>{'id': instance.id, 'text': instance.text};
