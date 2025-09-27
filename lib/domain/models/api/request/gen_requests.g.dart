// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlunoRequestModelImpl _$$AlunoRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$AlunoRequestModelImpl(
  nome: json['nome'] as String,
  login: json['login'] as String,
  senha: json['senha'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
);

Map<String, dynamic> _$$AlunoRequestModelImplToJson(
  _$AlunoRequestModelImpl instance,
) => <String, dynamic>{
  'nome': instance.nome,
  'login': instance.login,
  'senha': instance.senha,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
};

_$AlunoNapneRequestModelImpl _$$AlunoNapneRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$AlunoNapneRequestModelImpl(
  nome: json['nome'] as String,
  login: json['login'] as String,
  senha: json['senha'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  condicao: json['condicao'] as String,
  laudo: json['laudo'] as String,
  necessidadeEspecial: json['necessidadeEspecial'] as String,
  necessidadeEscolar: json['necessidadeEscolar'] as String,
  acompanhamento: json['acompanhamento'] as String,
  situacao: json['situacao'] as String,
);

Map<String, dynamic> _$$AlunoNapneRequestModelImplToJson(
  _$AlunoNapneRequestModelImpl instance,
) => <String, dynamic>{
  'nome': instance.nome,
  'login': instance.login,
  'senha': instance.senha,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'condicao': instance.condicao,
  'laudo': instance.laudo,
  'necessidadeEspecial': instance.necessidadeEspecial,
  'necessidadeEscolar': instance.necessidadeEscolar,
  'acompanhamento': instance.acompanhamento,
  'situacao': instance.situacao,
};

_$ProfessorRequestModelImpl _$$ProfessorRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProfessorRequestModelImpl(
  nome: json['nome'] as String,
  login: json['login'] as String,
  senha: json['senha'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  formacao: json['formacao'] as String,
);

Map<String, dynamic> _$$ProfessorRequestModelImplToJson(
  _$ProfessorRequestModelImpl instance,
) => <String, dynamic>{
  'nome': instance.nome,
  'login': instance.login,
  'senha': instance.senha,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'formacao': instance.formacao,
};

_$TutorRequestModelImpl _$$TutorRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$TutorRequestModelImpl(
  nome: json['nome'] as String,
  login: json['login'] as String,
  senha: json['senha'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  especialidade: json['especialidade'] as String,
);

Map<String, dynamic> _$$TutorRequestModelImplToJson(
  _$TutorRequestModelImpl instance,
) => <String, dynamic>{
  'nome': instance.nome,
  'login': instance.login,
  'senha': instance.senha,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'especialidade': instance.especialidade,
};

_$InterpreteRequestModelImpl _$$InterpreteRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$InterpreteRequestModelImpl(
  nome: json['nome'] as String,
  login: json['login'] as String,
  senha: json['senha'] as String,
  matricula: (json['matricula'] as num).toInt(),
  biografia: json['biografia'] as String?,
  especialidade: json['especialidade'] as String,
  salary: (json['salary'] as num).toDouble(),
);

Map<String, dynamic> _$$InterpreteRequestModelImplToJson(
  _$InterpreteRequestModelImpl instance,
) => <String, dynamic>{
  'nome': instance.nome,
  'login': instance.login,
  'senha': instance.senha,
  'matricula': instance.matricula,
  'biografia': instance.biografia,
  'especialidade': instance.especialidade,
  'salary': instance.salary,
};

_$LoginRequestModelImpl _$$LoginRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$LoginRequestModelImpl(
  login: json['login'] as String,
  senha: json['senha'] as String,
);

Map<String, dynamic> _$$LoginRequestModelImplToJson(
  _$LoginRequestModelImpl instance,
) => <String, dynamic>{'login': instance.login, 'senha': instance.senha};

_$ForgotPasswordRequestModelImpl _$$ForgotPasswordRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$ForgotPasswordRequestModelImpl(email: json['email'] as String);

Map<String, dynamic> _$$ForgotPasswordRequestModelImplToJson(
  _$ForgotPasswordRequestModelImpl instance,
) => <String, dynamic>{'email': instance.email};

_$ResetPasswordRequestModelImpl _$$ResetPasswordRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$ResetPasswordRequestModelImpl(
  token: json['token'] as String,
  novaSenha: json['novaSenha'] as String,
);

Map<String, dynamic> _$$ResetPasswordRequestModelImplToJson(
  _$ResetPasswordRequestModelImpl instance,
) => <String, dynamic>{
  'token': instance.token,
  'novaSenha': instance.novaSenha,
};

_$UpdatePasswordRequestModelImpl _$$UpdatePasswordRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$UpdatePasswordRequestModelImpl(
  email: json['email'] as String,
  senhaAtual: json['senhaAtual'] as String,
  novaSenha: json['novaSenha'] as String,
);

Map<String, dynamic> _$$UpdatePasswordRequestModelImplToJson(
  _$UpdatePasswordRequestModelImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'senhaAtual': instance.senhaAtual,
  'novaSenha': instance.novaSenha,
};

_$TopicoRequestModelImpl _$$TopicoRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$TopicoRequestModelImpl(
  titulo: json['titulo'] as String,
  descricao: json['descricao'] as String,
  categoria: $enumDecode(_$CategoriasEnumMap, json['categoria']),
);

Map<String, dynamic> _$$TopicoRequestModelImplToJson(
  _$TopicoRequestModelImpl instance,
) => <String, dynamic>{
  'titulo': instance.titulo,
  'descricao': instance.descricao,
  'categoria': _$CategoriasEnumMap[instance.categoria]!,
};

const _$CategoriasEnumMap = {
  Categorias.REDES: 1,
  Categorias.BANCO_DE_DADOS: 2,
  Categorias.PROGRAMACAO: 3,
  Categorias.WEB: 4,
  Categorias.ESTRUTURA_DE_DADOS: 5,
  Categorias.ARQUITETURA_DE_COMPUTADORES: 6,
};

_$PublicacaoRequestModelImpl _$$PublicacaoRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$PublicacaoRequestModelImpl(
  titulo: json['titulo'] as String,
  text: json['text'] as String,
  urlVideo: json['urlVideo'] as String?,
  urlFoto: json['urlFoto'] as String?,
);

Map<String, dynamic> _$$PublicacaoRequestModelImplToJson(
  _$PublicacaoRequestModelImpl instance,
) => <String, dynamic>{
  'titulo': instance.titulo,
  'text': instance.text,
  'urlVideo': instance.urlVideo,
  'urlFoto': instance.urlFoto,
};

_$ComentarioRequestModelImpl _$$ComentarioRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$ComentarioRequestModelImpl(content: json['content'] as String);

Map<String, dynamic> _$$ComentarioRequestModelImplToJson(
  _$ComentarioRequestModelImpl instance,
) => <String, dynamic>{'content': instance.content};

_$LibrasRequestModelImpl _$$LibrasRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$LibrasRequestModelImpl(
  palavra: json['palavra'] as String,
  descricao: json['descricao'] as String,
  url: json['url'] as String?,
  video: json['video'] as String?,
  foto: json['foto'] as String?,
  justificativa: json['justificativa'] as String?,
  status: $enumDecode(_$StatusEnumMap, json['status']),
  categorias: $enumDecode(_$CategoriasEnumMap, json['categorias']),
);

Map<String, dynamic> _$$LibrasRequestModelImplToJson(
  _$LibrasRequestModelImpl instance,
) => <String, dynamic>{
  'palavra': instance.palavra,
  'descricao': instance.descricao,
  'url': instance.url,
  'video': instance.video,
  'foto': instance.foto,
  'justificativa': instance.justificativa,
  'status': _$StatusEnumMap[instance.status]!,
  'categorias': _$CategoriasEnumMap[instance.categorias]!,
};

const _$StatusEnumMap = {
  Status.APROVADO: 1,
  Status.REPROVADO: 2,
  Status.EMANALISE: 3,
};

_$AnalisePalavraRequestModelImpl _$$AnalisePalavraRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$AnalisePalavraRequestModelImpl(
  palavra: json['palavra'] as String,
  categorias: $enumDecode(_$CategoriasEnumMap, json['categorias']),
  status: $enumDecode(_$StatusEnumMap, json['status']),
  Justificativa: json['Justificativa'] as String,
  url: json['url'] as String?,
  video: json['video'] as String?,
  foto: json['foto'] as String?,
);

Map<String, dynamic> _$$AnalisePalavraRequestModelImplToJson(
  _$AnalisePalavraRequestModelImpl instance,
) => <String, dynamic>{
  'palavra': instance.palavra,
  'categorias': _$CategoriasEnumMap[instance.categorias]!,
  'status': _$StatusEnumMap[instance.status]!,
  'Justificativa': instance.Justificativa,
  'url': instance.url,
  'video': instance.video,
  'foto': instance.foto,
};

_$CursoRequestModelImpl _$$CursoRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$CursoRequestModelImpl(nome: json['nome'] as String);

Map<String, dynamic> _$$CursoRequestModelImplToJson(
  _$CursoRequestModelImpl instance,
) => <String, dynamic>{'nome': instance.nome};

_$ConfigAcblRequestModelImpl _$$ConfigAcblRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$ConfigAcblRequestModelImpl(
  audicao: json['audicao'] as String?,
  tema: $enumDecode(_$TemaCSSEnumMap, json['tema']),
  zoom: json['zoom'] as String?,
);

Map<String, dynamic> _$$ConfigAcblRequestModelImplToJson(
  _$ConfigAcblRequestModelImpl instance,
) => <String, dynamic>{
  'audicao': instance.audicao,
  'tema': _$TemaCSSEnumMap[instance.tema]!,
  'zoom': instance.zoom,
};

const _$TemaCSSEnumMap = {TemaCSS.TEMA1: 1, TemaCSS.TEMA2: 2, TemaCSS.TEMA3: 3};

_$MessageRequestModelImpl _$$MessageRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$MessageRequestModelImpl(
  IdUserEnvia: json['IdUserEnvia'] as String,
  IdUserRecebe: json['IdUserRecebe'] as String,
  text: json['text'] as String,
);

Map<String, dynamic> _$$MessageRequestModelImplToJson(
  _$MessageRequestModelImpl instance,
) => <String, dynamic>{
  'IdUserEnvia': instance.IdUserEnvia,
  'IdUserRecebe': instance.IdUserRecebe,
  'text': instance.text,
};
