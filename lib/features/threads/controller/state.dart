import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smart_beds/common/models/thread.dart';
import 'package:smart_beds/common/models/thread_message.dart';

class ThreadsState {
  final RxBool _isThreadsLoading = false.obs;
  bool get isThreadsLoading => _isThreadsLoading.value;
  set isThreadsLoading(bool value) => _isThreadsLoading.value = value;

  final RxList<Thread> _threads = <Thread>[].obs;
  List<Thread> get threads => _threads;
  set threads(List<Thread> value) => _threads.value = value;

  final RxList<ThreadMessage> _threadMessage = <ThreadMessage>[].obs;
  List<ThreadMessage> get threadMessage => _threadMessage;
  set threadMessage(List<ThreadMessage> value) => _threadMessage.value = value;

  final RxBool _isThreadMessagesLoading = false.obs;
  bool get isThreadMessagesLoading => _isThreadMessagesLoading.value;
  set isThreadMessagesLoading(bool value) =>
      _isThreadMessagesLoading.value = value;

  final Rx<TextEditingController> _userMessage = TextEditingController().obs;
  TextEditingController get userMessage => _userMessage.value;
  set userMessage(TextEditingController value) => _userMessage.value = value;

  final RxInt _currentThreadId = 0.obs;
  int get currentThreadId => _currentThreadId.value;
  set currentThreadId(int value) => _currentThreadId.value = value;
}
