import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news/core/theme/application_theme.dart';
import 'package:news/presentation_layer/home/home_view.dart';
import 'package:news/presentation_layer/news_description/news_discraption.dart';
import 'package:news/presentation_layer/splash/splash_view.dart';

import 'core/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightMode,
      darkTheme: ApplicationTheme.darkMode,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeView.routeName: (context) => HomeView(),
        NewsDescription.routeName: (context) => NewsDescription()
      },
      builder: EasyLoading.init(),
    );
  }
}
