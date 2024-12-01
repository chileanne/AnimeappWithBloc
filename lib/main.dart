import 'package:animeapp/core/theme/app_theme.dart';
import 'package:animeapp/data/bloc/anime_bloc/anime_bloc.dart';
import 'package:animeapp/data/repository/animeRepo.dart';
import 'package:animeapp/presentation/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/bloc/bloc_observer/AppBlocObserver.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context)=> AnimeRepo(),
      child: BlocProvider(
        create: (context) => AnimeBloc(context.read<AnimeRepo>() )  ,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}


