import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kavach_v1/repository/image_repository.dart';
import 'package:kavach_v1/screens/splash_screen.dart';

import 'bloc/image/image_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ImageBloc>(
          create: (_) => ImageBloc(ImageRepository()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KAVACH',
      home: SplashScreen(),
    );
  }
}