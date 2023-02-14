import 'package:animated_emoji/emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/modules/home/provider/home.provider.dart';
import 'package:todoapp/modules/task/view/add_task.view.dart';
import 'package:todoapp/shared/colors/app_colors.dart';
import 'package:todoapp/shared/extensions/date_time.extension.dart';
import 'package:todoapp/shared/extensions/string_extension.dart';
import 'package:todoapp/shared/models/task.model.dart';
import 'package:todoapp/shared/widgets/task_dialog.widget.dart';

import '../../../gen/assets.gen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
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
                Expanded(
                  child: Padding(
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
                            backgroundColor: AppColors.lightGrey,
                            child: Text(
                              '5',
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(fontSize: 12.sp),
                            ),
                          )
                        ]),
                        SizedBox(height: 24.h),
                        SingleChildScrollView(
                          child: Consumer<HomeProvider>(
                              builder: (context, value, child) {
                            return Column(
                                children: value.tasks
                                    .map((e) => ListTile(
                                          leading: CircleAvatar(
                                              radius: 30.r,
                                              backgroundColor:
                                                  AppColors.lightGrey,
                                              child: AnimatedEmoji(
                                                e.emojiData,
                                                size: 30.h,
                                              )),
                                          title: Text(e.title,
                                              style:
                                                  theme.textTheme.titleMedium),
                                          subtitle: Text(
                                              '${e.description.truncateText(35)}\n ${e.date.format()}',
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      color: AppColors.grey)),
                                          trailing: InkWell(
                                              onTap: () {
                                                value.showTaskDialog(
                                                    context, e);
                                              },
                                              child: const Icon(Icons
                                                  .remove_red_eye_outlined)),
                                        ))
                                    .toList());
                          }),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
