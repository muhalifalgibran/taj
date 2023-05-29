import 'package:equatable/equatable.dart';
import 'package:taj/core/error/error_type.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure({
    this.message = 'Server Error',
    this.errorType = ApiErrorType.unknown,
    this.statusCode,
  });

  final String message;
  final String errorType;
  final int? statusCode;

  @override
  List<Object> get props => [
        message,
        errorType,
      ];
}
