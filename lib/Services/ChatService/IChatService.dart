import 'package:brainbox_ai/BOs/ChatBO/ChatBO.dart';
import 'package:brainbox_ai/Services/ServiceHelpers/ResponseWrapper.dart';

abstract class IChatService {
  Future<ApiResponse<ChatBO?>> chatWithAI({
    required String message,
    int? chatId,
    required String userId,
  });

  Future<ApiResponse<List<ChatBO>?>> getAllChatHistories({
    required String userId,
  });

  Future<ApiResponse<ChatBO?>> getChatHistoryById({
    required int chatId,
  });
}
