import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/theme/light_theme.dart';
import 'package:todoapp/modules/task/provider/task.provider.dart';

import 'modules/home/provider/home.provider.dart';
import 'modules/home/view/home.view.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (ctx) => TaskProvider()),
    ChangeNotifierProvider(create: (ctx) => HomeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        title: 'Elred Todo App',
        home: const HomeView(),
      ),
    );
  }
}
