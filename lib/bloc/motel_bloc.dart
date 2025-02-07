import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go/core/errors/exceptions.dart';
import 'package:go/models/motel_model.dart';
import 'package:go/repositories/motel_repository.dart';

part 'motel_event.dart';
part 'motel_state.dart';

class MotelBloc extends Bloc<MotelEvent, MotelState> {
  final MotelRepository repository;

  MotelBloc({required this.repository}) : super(MotelInitial()) {
    on<GetMotels>(_onGetMotels, transformer: droppable());
  }

  Future<void> _onGetMotels(
    GetMotels event,
    Emitter<MotelState> emit,
  ) async {
    emit(MotelLoading());
    try {
      final motels = await repository.getMotels();
      emit(MotelLoaded(motels: motels));
    } on ServerException catch (e) {
      emit(MotelError(message: e.message));
    } catch (e) {
      emit(MotelError(
          message: 'Erro desconhecido, por favor tente outra vez mais tarde.'));
    }
  }
}
