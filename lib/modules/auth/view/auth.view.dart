import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.elRedLogo.svg(width: 100),
          SizedBox(height: 100.h),
          OutlinedButton.icon(
              onPressed: () {},
              icon: Assets.icons.googleIcon.svg(width: 20.w),
              label: const Text('LogIn with Google')),
          SizedBox(height: 20.h),
          OutlinedButton.icon(
              onPressed: () {},
              icon: Assets.icons.googleIcon.svg(width: 20.w),
              label: const Text('SignUp with Google')),
        ],
      ),
    )));
  }
}
