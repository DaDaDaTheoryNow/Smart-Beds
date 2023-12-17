class ThreadMessage {
  final int threadId;
  final String text;
  final int id;
  final int userId;
  final String date;

  ThreadMessage({
    required this.threadId,
    required this.text,
    required this.id,
    required this.userId,
    required this.date,
  });

  factory ThreadMessage.fromJson(Map<String, dynamic> json) {
    return ThreadMessage(
      threadId: json['thread_id'] ?? 0,
      text: json['text'] ?? '',
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      date: json['date'] ?? '',
    );
  }
}
