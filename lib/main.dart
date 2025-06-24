import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/Data/Online/Bloc/photos_bloc.dart';
import 'package:wallpaper_app/page_1.dart';
import 'package:wallpaper_app/splashscreen.dart';

void main() {
  runApp(BlocProvider(create: (context) => PhotosBloc(),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WallZ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Splashscreen(),
    );
  }
}

