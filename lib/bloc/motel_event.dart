part of 'motel_bloc.dart';

abstract class MotelEvent extends Equatable {
  const MotelEvent();

  @override
  List<Object?> get props => [];
}

class GetMotels extends MotelEvent {}
