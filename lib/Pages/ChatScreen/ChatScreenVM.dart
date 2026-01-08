import 'package:brainbox_ai/BOs/ChatBO/ChatBO.dart';
import 'package:brainbox_ai/Helpers/Utility/ErrorHandling.dart';
import 'package:brainbox_ai/Pages/ChatScreen/ChatScreenModel.dart';

class ChatScreenVM extends ChatScreenModel {
  ChatScreenVM(int? chatId) {
    try {
      setIsLoading(false);

      setChatBO(
        ChatBO(
          chatId: 0,
          chatName: 'Chat Name',
          messages: [],
          createdAt: '',
          updatedAt: '',
        ),
      );

      if (chatId != null) {
        getChatHistory(chatId);
      }
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
        messageId: (chatBO?.messages?.length ?? 0) + 1,
        question: message,
        answer: '',
      );

      // Add message to list
      chatBO?.messages?.add(newMessage);

      // Simulate API call delay
      // await Future.delayed(const Duration(seconds: 5));

      var response = await chatService.chatWithAI(
        message: message,
        userId: 'user123',
        chatId: chatBO?.chatId == 0 ? null : chatBO?.chatId,
      );

      if (response.data != null) {
        chatBO?.messages?.removeWhere(
          (m) => m.messageId == newMessage.messageId,
        );
        chatBO?.messages?.addAll(response.data?.messages ?? []);
        
        chatBO?.chatId = response.data?.chatId ?? 0;
        setChatBO(chatBO!);
      }

      // // Update with bot response (replace this with actual API call)
      // final index = chatBO!.messages.indexWhere(
      //   (m) => m.messageId == newMessage.messageId,
      // );
      // if (index != -1) {
      //   chatBO!.messages[index] = MessageBO(
      //     messageId: newMessage.messageId,
      //     question: message,
      //     answer:
      //         response.data.
      //   );
      // }

      setIsLoading(false);
    } on Exception catch (ex) {
      setIsLoading(false);
      ex.logException();
    }
  }

  void getChatHistory(int chatId) async {
    try {
      setIsLoading(true);

      var response = await chatService.getChatHistoryById(chatId: chatId);

      if (response.data != null) {
        setChatBO(response.data!);
      }

      setIsLoading(false);
    } on Exception catch (ex) {
      setIsLoading(false);
      ex.logException();
    }
  }

  void navigateBack() {
    try {
      pop();
    } on Exception catch (ex) {
      ex.logException();
    }
  }
}
