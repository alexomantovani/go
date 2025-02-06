import 'package:equatable/equatable.dart';

class SerializationError extends Equatable implements Error {
  const SerializationError({
    required this.message,
    required this.error,
  });

  final String message;
  final String error;

  @override
  String toString() {
    return 'SerializationError: $message\n$error\nStackTrace: $stackTrace';
  }

  @override
  List<Object?> get props => [message, error];

  @override
  StackTrace? get stackTrace => StackTrace.current;
}
