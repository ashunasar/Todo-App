import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/shared/extensions/date_time.extension.dart';
import 'package:todoapp/shared/widgets/custom_text_field.widget.dart';

import '../provider/task.provider.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Add new task')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTextField(hintText: 'Enter task title'),
            const CustomTextField(hintText: 'Enter task description'),
            SizedBox(height: 15.w),
            getDateWidget(context, provider),
            SizedBox(height: 15.w),
            ElevatedButton(onPressed: () {}, child: const Text('ADD YOUR TASK'))
          ],
        ),
      ),
    );
  }

  Widget getDateWidget(BuildContext context, TaskProvider provider) {
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
                  provider.selectDate(context);
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
