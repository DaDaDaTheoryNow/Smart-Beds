import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_beds/common/models/thread.dart';
import 'package:smart_beds/features/threads/controller/controller.dart';

class ThreadWidget extends GetView<ThreadsController> {
  final Thread thread;

  const ThreadWidget({super.key, required this.thread});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          controller.goToThreadMessagesPage(thread.id);
        },
        child: Card(
          elevation: 2.0,
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${thread.title}    ${thread.date.year}-${thread.date.month}-${thread.date.day}    ${thread.date.hour}:${thread.date.minute}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  thread.text,
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  'by Unknown App User',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
