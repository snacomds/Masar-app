import 'package:flutter/material.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import "package:flutter_bloc/src/bloc_builder.dart";
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/pages/course_page.dart';
import 'package:flutter_cubit/pages/home_page.dart';
import 'package:flutter_cubit/pages/lesson_page.dart';
import 'package:flutter_cubit/pages/login_page.dart';
import 'package:flutter_cubit/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return HomePage();
          }
          if (state is AuthState) {
            return LoginPage();
          }
          if (state is CourseState) {
            return CoursePage();
          }
          if (state is LessonState) {
            return LessonPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
