class Thread {
  final String title;
  final String text;
  final int id;
  final int userId;
  final DateTime date;

  Thread({
    required this.title,
    required this.text,
    required this.id,
    required this.userId,
    required this.date,
  });

  factory Thread.fromJson(Map<String, dynamic> json) {
    return Thread(
      title: json['title'] ?? '',
      text: json['text'] ?? '',
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'text': text,
      'id': id,
      'user_id': userId,
      'date': date.toIso8601String(),
    };
  }
}
