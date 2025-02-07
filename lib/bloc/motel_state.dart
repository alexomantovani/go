part of 'motel_bloc.dart';

abstract class MotelState extends Equatable {
  const MotelState();

  @override
  List<Object?> get props => [];
}

class MotelInitial extends MotelState {}

class MotelLoading extends MotelState {}

class MotelLoaded extends MotelState {
  final List<MotelModel> motels;

  const MotelLoaded({required this.motels});

  @override
  List<Object?> get props => [motels];
}

class MotelError extends MotelState {
  final String message;

  const MotelError({required this.message});

  @override
  List<Object?> get props => [message];
}
