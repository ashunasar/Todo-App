import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../models/task.model.dart';

class TaskDialog extends StatelessWidget {
  const TaskDialog({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(task.title,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleMedium)),
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.cancel))
              ],
            ),
            SizedBox(height: 10.h),
            Text(task.description, style: theme.textTheme.titleMedium),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    color: Colors.red,
                    splashColor: Colors.red,
                    onPressed: () {
                      Navigator.pop(context, TaskAction.delete);
                    },
                    icon: const Icon(Icons.delete)),
                IconButton(
                    color: AppColors.darkBlue,
                    splashColor: AppColors.darkBlue,
                    onPressed: () {
                      Navigator.pop(context, TaskAction.edit);
                    },
                    icon: const Icon(Icons.edit))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
