import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/modules/task/view/add_task.view.dart';

import '../../../gen/assets.gen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddTaskView())),
              child: Icon(Icons.add_rounded, size: 40.h),
            ),
            body: Column(
              children: [
                Container(
                  height: 199.h,
                  width: 360.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image:
                              AssetImage(Assets.images.morningMountain.path))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Assets.icons.hamburgerIcon.svg(),
                        Text('Good Morning\nAshu',
                            style: theme.textTheme.displaySmall),
                        Text(
                          'Feb 12, 2023',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 15.h),
                      Row(children: [
                        const Text('Task in progress'),
                        const Spacer(),
                        const Text('Completed'),
                        SizedBox(width: 10.w),
                        CircleAvatar(
                          radius: 10.r,
                          backgroundColor: const Color(0xFFD9D9D9),
                          child: Text(
                            '5',
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(fontSize: 12.sp),
                          ),
                        )
                      ]),
                      SizedBox(height: 24.h),
                      ListTile(
                        leading: CircleAvatar(
                            radius: 30.r,
                            backgroundColor: const Color(0xFFD9D9D9),
                            child:
                                Text('😄', style: TextStyle(fontSize: 24.sp))),
                        title: Text('Some random title',
                            style: theme.textTheme.titleMedium),
                        subtitle: Text(
                            'Lorem ipsum dolor sit amet, consectetur...\n Feb 12, 2023',
                            style: theme.textTheme.bodySmall!
                                .copyWith(color: const Color(0xFFC5C5C5))),
                        trailing: InkWell(
                            onTap: () {},
                            child: const Icon(Icons.remove_red_eye_outlined)),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
