import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/bloc/motel_bloc.dart';
import 'package:go/core/errors/exceptions.dart';
import 'package:go/models/motel_model.dart';
import 'package:go/repositories/motel_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'motel_bloc_test.mocks.dart';

@GenerateMocks([MotelRepository])
void main() {
  late MotelBloc motelBloc;
  late MockMotelRepository repository;

  setUp(() {
    repository = MockMotelRepository();
    motelBloc = MotelBloc(repository: repository);
  });

  tearDown(() {
    motelBloc.close();
  });

  final List<MotelModel> mockMotels = [
    MotelModel.empty(),
    MotelModel.empty().copyWith(fantasia: 'fantasia'),
  ];

  group('GetMotels', () {
    blocTest<MotelBloc, MotelState>(
      'should emit [MotelLoading, MotelLoaded] when getMotels is successful',
      build: () {
        when(repository.getMotels()).thenAnswer((_) async => mockMotels);
        return motelBloc;
      },
      act: (bloc) => bloc.add(GetMotels()),
      expect: () => [
        MotelLoading(),
        MotelLoaded(motels: mockMotels),
      ],
      verify: (_) {
        verify(repository.getMotels()).called(1);
      },
    );

    blocTest<MotelBloc, MotelState>(
      'should throw [MotelLoading, MotelError] when getMotels throws ServerException',
      build: () {
        when(repository.getMotels()).thenThrow(
          ServerException(message: 'Erro do servidor', statusCode: 500),
        );
        return motelBloc;
      },
      act: (bloc) => bloc.add(GetMotels()),
      expect: () => [
        MotelLoading(),
        MotelError(message: 'Erro do servidor'),
      ],
      verify: (_) {
        verify(repository.getMotels()).called(1);
      },
    );

    blocTest<MotelBloc, MotelState>(
      'should emit [MotelLoading, MotelError] when getMotels throws UnknownException',
      build: () {
        when(repository.getMotels())
            .thenThrow(UnknownException(exception: 'Erro desconhecido'));
        return motelBloc;
      },
      act: (bloc) => bloc.add(GetMotels()),
      expect: () => [
        MotelLoading(),
        MotelError(
            message:
                'Erro desconhecido, por favor tente outra vez mais tarde.'),
      ],
      verify: (_) {
        verify(repository.getMotels()).called(1);
      },
    );

    blocTest<MotelBloc, MotelState>(
      'should maintain the previous state if a new request is made while it is already loaded',
      build: () {
        when(repository.getMotels()).thenAnswer((_) async => mockMotels);
        return motelBloc;
      },
      seed: () => MotelLoaded(motels: mockMotels),
      act: (bloc) => bloc.add(GetMotels()),
      expect: () => [
        MotelLoading(),
        MotelLoaded(motels: mockMotels),
      ],
      verify: (_) {
        verify(repository.getMotels()).called(1);
      },
    );

    blocTest<MotelBloc, MotelState>(
      'should ignore additional events if one is already in progress',
      build: () {
        when(repository.getMotels()).thenAnswer((_) async => Future.delayed(
            const Duration(milliseconds: 500), () => mockMotels));
        return motelBloc;
      },
      act: (bloc) {
        bloc.add(GetMotels());
        bloc.add(GetMotels());
      },
      wait: const Duration(milliseconds: 600),
      expect: () => [
        MotelLoading(),
        MotelLoaded(motels: mockMotels),
      ],
      verify: (_) {
        verify(repository.getMotels()).called(1);
      },
    );
  });
}
