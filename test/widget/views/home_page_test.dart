import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:go/bloc/motel_bloc.dart';
import 'package:go/models/motel_model.dart';
import 'package:go/views/home_page.dart';
import 'package:go/widgets/common/home_body.dart';
import 'package:go/widgets/common/loading_widget.dart';
import 'package:go/widgets/motel/error_message_widget.dart';

import 'home_page_test.mocks.dart';

@GenerateMocks([MotelBloc])
main() {
  late MockMotelBloc mockMotelBloc;

  setUp(() {
    mockMotelBloc = MockMotelBloc();
  });

  Widget makeTestableWidget(Widget child) {
    return BlocProvider<MotelBloc>.value(
      value: mockMotelBloc,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets("Checks whether the main elements of the HomePage are rendered",
      (WidgetTester tester) async {
    when(mockMotelBloc.state).thenReturn(MotelLoading());
    when(mockMotelBloc.stream).thenAnswer((_) => Stream.value(MotelLoading()));

    await tester.pumpWidget(makeTestableWidget(const HomePage()));

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Displays [LoadingWidget] when state is MotelLoading',
      (WidgetTester tester) async {
    when(mockMotelBloc.state).thenReturn(MotelLoading());
    when(mockMotelBloc.stream).thenAnswer((_) => Stream.value(MotelLoading()));

    await tester.pumpWidget(makeTestableWidget(const HomePage()));

    expect(find.byType(LoadingWidget), findsOneWidget);
  });

  testWidgets('Display [ErrorMessageWidget] when state is MotelError',
      (WidgetTester tester) async {
    when(mockMotelBloc.state)
        .thenReturn(MotelError(message: 'Erro ao carregar dados'));
    when(mockMotelBloc.stream).thenAnswer(
        (_) => Stream.value(MotelError(message: 'Erro ao carregar dados')));

    await tester.pumpWidget(makeTestableWidget(const HomePage()));

    expect(find.byType(ErrorMessageWidget), findsOneWidget);
    expect(find.text('Erro ao carregar dados'), findsOneWidget);
  });

  testWidgets('Displays [HomeBody] when state is MotelLoaded',
      (WidgetTester tester) async {
    final motels = [MotelModel.empty()];
    when(mockMotelBloc.state).thenReturn(MotelLoaded(motels: motels));
    when(mockMotelBloc.stream)
        .thenAnswer((_) => Stream.value(MotelLoaded(motels: motels)));

    await tester.pumpWidget(makeTestableWidget(const HomePage()));

    expect(find.byType(HomeBody), findsOneWidget);
  });
}
