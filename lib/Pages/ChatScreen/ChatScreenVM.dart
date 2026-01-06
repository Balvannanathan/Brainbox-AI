import 'package:brainbox_ai/BOs/ChatBO/ChatBO.dart';
import 'package:brainbox_ai/Helpers/Utility/ErrorHandling.dart';
import 'package:brainbox_ai/Pages/ChatScreen/ChatScreenModel.dart';

class ChatScreenVM extends ChatScreenModel {
  ChatScreenVM() {
    try {
      setIsLoading(false);

      setChatBO(ChatBO(chatId: 1, chatName: 'Chat Name', messages: []));
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  // Send message method
  void sendMessage(String message) async {
    try {
      // Simulate bot typing
      setIsLoading(true);

      // Add user message to chat
      final newMessage = MessageBO(
        messageId: (chatBO?.messages.length ?? 0) + 1,
        question: message,
        answer: '', // Will be filled by bot response
      );

      // Add message to list
      chatBO?.messages.add(newMessage);

      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 5));

      // Update with bot response (replace this with actual API call)
      final index = chatBO!.messages.indexWhere(
        (m) => m.messageId == newMessage.messageId,
      );
      if (index != -1) {
        chatBO!.messages[index] = MessageBO(
          messageId: newMessage.messageId,
          question: message,
          answer:
              'This is a sample response from the bot. Replace this with your actual API integration.',
        );
      }

      setChatBO(chatBO!);

      setIsLoading(false);
    } on Exception catch (ex) {
      setIsLoading(false);
      ex.logException();
    }
  }
}
