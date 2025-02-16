import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go/bloc/motel_bloc.dart';
import 'package:go/core/services/styles.dart';
import 'package:go/repositories/motel_repository.dart';
import 'package:go/views/home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MotelRepository>(
          create: (context) => MotelRepository(
            client: http.Client(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MotelBloc>(
            create: (context) => MotelBloc(
              repository: context.read<MotelRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Styles.kPrimaryRed),
            useMaterial3: true,
            textTheme: TextTheme(
              titleLarge: Styles.titleLarge,
              titleMedium: Styles.titleMedium,
              titleSmall: Styles.titleSmall,
              bodyMedium: Styles.bodyMedium,
              bodySmall: Styles.bodySmall,
            ),
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
