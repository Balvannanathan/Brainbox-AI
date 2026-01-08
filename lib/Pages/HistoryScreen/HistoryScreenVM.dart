import 'package:brainbox_ai/BOs/ChatBO/ChatBO.dart';
import 'package:brainbox_ai/Helpers/Navigations/NavigationConfig.dart';
import 'package:brainbox_ai/Helpers/Utility/ErrorHandling.dart';
import 'package:brainbox_ai/Pages/HistoryScreen/HistoryScreenModel.dart';
import 'package:brainbox_ai/Services/ServiceHelpers/ResponseWrapper.dart';
import 'package:intl/intl.dart';

class HistoryScreenVM extends HistoryScreenModel {
  HistoryScreenVM() {
    setIsLoading(true);
    setHistory([]);
    setGroupedChats({});

    getAllChatHistories();
  }

  Future<void> getAllChatHistories() async {
    try {
      setIsLoading(true);

      await Future.delayed(const Duration(seconds: 2));

      final response = await chatService.getAllChatHistories(userId: 'user123');

      if (response.statusCode == ApiStatusCode.success) {
        setHistory(response.data!);
      }

      groupChatsByDate(history!);
      setIsLoading(false);
    } on Exception catch (e) {
      setIsLoading(false);
      e.logException();
    }
  }

  void groupChatsByDate(List<ChatBO> chats) {
    try {
      chats.sort(
        (a, b) => DateTime.parse(
          b.updatedAt ?? '',
        ).compareTo(DateTime.parse(a.updatedAt ?? '')),
      );

      final Map<String, List<ChatBO>> groupedChats = {};

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = today.subtract(const Duration(days: 1));

      for (final chat in chats) {
        final chatDateTime = DateTime.parse(chat.createdAt ?? '');
        final chatDate = DateTime(
          chatDateTime.year,
          chatDateTime.month,
          chatDateTime.day,
        );

        String label;

        if (chatDate == today) {
          label = 'Today';
        } else if (chatDate == yesterday) {
          label = 'Yesterday';
        } else {
          label = DateFormat('dd MMM yyyy').format(chatDateTime);
        }

        groupedChats.putIfAbsent(label, () => []);
        groupedChats[label]!.add(chat);
      }

      setGroupedChats(groupedChats);

      setIsLoading(false);
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void searchChat(String searchQuery) {
    try {
      if (searchQuery.isEmpty) {
        groupChatsByDate(history!);
        return;
      }
      final filteredChats = history!.where((chat) {
        return chat.chatName.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();

      groupChatsByDate(filteredChats);
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void navigateToChatScreen(int chatId) {
    push(NavigationConfig.chatScreen, data: chatId);
  }
}
