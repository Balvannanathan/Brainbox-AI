class ChatBO {
  int chatId;
  String chatName;
  List<MessageBO>? messages;
  String? createdAt;
  String? updatedAt;

  ChatBO({
    required this.chatId,
    required this.chatName,
    this.messages,
    this.createdAt,
    this.updatedAt,
  });

  factory ChatBO.fromJson(Map<String, dynamic> json) {
    return ChatBO(
      chatId: json['session_id'],
      chatName: json['session_name'],
      messages: (json['messages'] as List<dynamic>?)
          ?.map((x) => MessageBO.fromJson(x))
          .toList(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class MessageBO {
  int messageId;
  String question;
  String answer;
  String? createdAt;

  MessageBO({
    required this.messageId,
    required this.question,
    required this.answer,
    this.createdAt,
  });

  factory MessageBO.fromJson(Map<String, dynamic> json) {
    return MessageBO(
      messageId: json['message_id'],
      question: json['question'],
      answer: json['answer'],
      createdAt: json['timestamp'],
    );
  }
}
