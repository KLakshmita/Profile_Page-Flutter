import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_profile_settings_app/widgets/drawer_layout.dart';

import 'bloc/drawer_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Profile Settings App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        primaryColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.lightBlueAccent),
      ),
      home: BlocProvider<DrawerBloc>(
        create: (context) => DrawerBloc(),
        child: DrawerLayout(),
      ),
    );
  }
}
