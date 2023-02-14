import 'package:animated_emoji/emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/shared/colors/app_colors.dart';
import 'package:todoapp/shared/extensions/date_time.extension.dart';
import 'package:todoapp/shared/widgets/custom_text_field.widget.dart';

import '../provider/task.provider.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add new task')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70.h),
              Consumer<TaskProvider>(builder: (context, value, child) {
                return InkWell(
                  onTap: () {
                    value.pickTaskEmojiMood(context);
                  },
                  child: Container(
                    height: 80.h,
                    width: 80.w,
                    padding: EdgeInsets.all(5.h),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColors.lightBlue, width: 2)),
                    child: value.selectedTaskEmojiMood != null
                        ? AnimatedEmoji(value.selectedTaskEmojiMood!)
                        : Icon(Icons.add_rounded,
                            color: AppColors.lightBlue, size: 50.h),
                  ),
                );
              }),
              SizedBox(height: 30.h),
              const CustomTextField(hintText: 'Enter task title'),
              const CustomTextField(hintText: 'Enter task description'),
              SizedBox(height: 15.w),
              getDateWidget(context),
              SizedBox(height: 15.w),
              ElevatedButton(
                  onPressed: () {}, child: const Text('ADD YOUR TASK'))
            ],
          ),
        ),
      ),
    );
  }

  Widget getDateWidget(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<TaskProvider>(builder: (context, value, child) {
      return Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 7.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
            child: Row(children: [
              Text(value.pickedDate.format()),
              SizedBox(width: 10.w),
              InkWell(
                onTap: () {
                  value.selectDate(context);
                },
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(3.r)),
                  child: Icon(Icons.calendar_month_outlined,
                      size: 20.w, color: Colors.white),
                ),
              )
            ]),
          )
        ],
      );
    });
  }
}