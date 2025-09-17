class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({required this.message, this.statusCode});

  @override
  String toString() => 'ApiException: $message (StatusCode: $statusCode)';
}

class InternalServerException extends ApiException {
  InternalServerException()
    : super(
        message:
            "Ocorreu um erro inesperado no servidor. Tente novamente mais tarde.",
        statusCode: 500,
      );
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({String? message})
    : super(
        message: message ?? "Você não tem autorização para realizar esta ação.",
        statusCode: 401,
      );
}

class ForbiddenException extends ApiException {
  ForbiddenException({String? message})
    : super(
        message: message ?? "Você não tem autorização para realizar esta ação.",
        statusCode: 403,
      );
}

class NotFoundException extends ApiException {
  NotFoundException({String? message})
    : super(message: message ?? "Recurso não encontrado", statusCode: 404);
}
