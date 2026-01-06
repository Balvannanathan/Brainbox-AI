class ChatBO {
  int chatId;
  String chatName;
  List<MessageBO> messages;

  ChatBO({
    required this.chatId,
    required this.chatName,
    required this.messages,
  });
}

class MessageBO {
  int messageId;
  String question;
  String answer;

  MessageBO({
    required this.messageId,
    required this.question,
    required this.answer,
  });
}
