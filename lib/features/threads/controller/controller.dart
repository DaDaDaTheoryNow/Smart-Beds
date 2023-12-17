import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_beds/common/models/thread.dart';
import 'package:smart_beds/common/models/thread_message.dart';
import 'package:smart_beds/common/pages.dart';
import 'package:smart_beds/common/util/dialog/app_dialog.dart';
import 'package:smart_beds/features/shared/controller.dart';
import 'package:smart_beds/features/threads/controller/state.dart';

class ThreadsController extends GetxController {
  final state = ThreadsState();
  final sharedState = Get.find<SharedController>().state;

  final dio = Dio();
  final appDialog = AppDialog();

  void goToThreadFormPage() {
    Get.offNamedUntil(AppPages.threadForm, (route) => true);
  }

  void goToThreadMessagesPage(int id) async {
    appDialog.loading();
    await getMessagesForThread(id);
    await Future.delayed(const Duration(milliseconds: 350));
    appDialog.close();
    Get.offNamedUntil(AppPages.threadMessages, (route) => true);
  }

  Future<void> getThreads() async {
    const url = 'https://hackaton15.onrender.com/thread/get-threads';

    state.isThreadsLoading = true;

    final response = await dio.get(
      url,
    );

    if (response.statusCode == 200) {
      debugPrint("success get threads");
      if (response.data != null && response.data.isNotEmpty) {
        List<Thread> plants = List<Thread>.from(
            response.data.map((data) => Thread.fromJson(data)));
        state.threads = plants;
      }
    }

    state.isThreadsLoading = false;
  }

  Future<void> addNewThread(String title, String message) async {
    if (sharedState.tokenResponse == null) {
      return;
    }

    const url = 'https://hackaton15.onrender.com/thread/new-thread';

    Map<String, dynamic> jsonData = {
      "title": title,
      "text": message,
    };
    String jsonString = jsonEncode(jsonData);

    FocusManager.instance.primaryFocus?.unfocus();
    await dio.post(
      url,
      data: jsonString,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${sharedState.tokenResponse!.accessToken}',
        },
      ),
    );

    getThreads();
    Get.back();
  }

  Future<void> getMessagesForThread(int threadId,
      {bool withLoading = true}) async {
    if (withLoading) {
      state.isThreadMessagesLoading = true;
    }

    final url =
        'https://hackaton15.onrender.com/thread/get-thread-by-id-with-messages/${threadId}';

    final response = await dio.get(
      url,
    );

    if (response.statusCode == 200) {
      if (response.data != null && response.data.isNotEmpty) {
        List<ThreadMessage> message = List<ThreadMessage>.from(response
            .data['messages']
            .map((data) => ThreadMessage.fromJson(data)));

        state.threadMessage = message;
      }
    }

    if (withLoading) {
      state.isThreadMessagesLoading = false;
    }

    state.currentThreadId = threadId;
  }

  Future<void> sendMessageToThread(String message) async {
    if (sharedState.tokenResponse == null) {
      return;
    }

    const url = 'https://hackaton15.onrender.com/message/new-message';

    Map<String, dynamic> jsonData = {
      "thread_id": state.currentThreadId,
      "text": message,
    };
    String jsonString = jsonEncode(jsonData);

    FocusManager.instance.primaryFocus?.unfocus();
    appDialog.loading();
    await dio.post(
      url,
      data: jsonString,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${sharedState.tokenResponse!.accessToken}',
        },
      ),
    );

    await getMessagesForThread(state.currentThreadId, withLoading: false);
    appDialog.close();
  }

  @override
  void onInit() {
    getThreads();
    super.onInit();
  }
}
