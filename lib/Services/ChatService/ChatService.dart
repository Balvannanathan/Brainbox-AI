import 'package:brainbox_ai/BOs/ChatBO/ChatBO.dart';
import 'package:brainbox_ai/Helpers/Utility/ErrorHandling.dart';
import 'package:brainbox_ai/Services/ChatService/IChatService.dart';
import 'package:brainbox_ai/Services/ServiceHelpers/RequestWrapper.dart';
import 'package:brainbox_ai/Services/ServiceHelpers/ResponseWrapper.dart';

class ChatService implements IChatService {
  @override
  Future<ApiResponse<ChatBO?>> chatWithAI({
    required String message,
    int? chatId,
    required String userId,
  }) async {
    try {

      var dio = RequestWrapper.getDio();

      var response = await dio.post(
        '/chat',
        data: {'message': message, 'session_id': chatId, 'user_id': userId},
      );

      var apiResponse = ApiResponse.fromDioResponse(
        response,
        fromJson: (json) => ChatBO.fromJson(json),
      );

      return apiResponse;
    } on Exception catch (ex) {
      ex.logException();

      return ApiResponse(
        statusCode: ApiStatusCode.serverError,
        data: null,
        message: ex.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<List<ChatBO>?>> getAllChatHistories({
    required String userId,
  }) async {
    try {
      var dio = RequestWrapper.getDio();

      var response = await dio.post('/sessions', data: {'user_id': userId});

      var apiResponse = ApiResponse.fromDioResponse(
        response,
        fromJson: (json) =>
            List<ChatBO>.from(json.map((x) => ChatBO.fromJson(x))),
      );

      return apiResponse;
    } on Exception catch (ex) {
      ex.logException();

      return ApiResponse(
        statusCode: ApiStatusCode.serverError,
        data: null,
        message: ex.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<ChatBO?>> getChatHistoryById({required int chatId}) async {
    try {
      var dio = RequestWrapper.getDio();

      var response = await dio.get('/session/$chatId');

      var apiResponse = ApiResponse.fromDioResponse(
        response,
        fromJson: (json) => ChatBO.fromJson(json),
      );

      return apiResponse;
    } on Exception catch (ex) {
      ex.logException();

      return ApiResponse(
        statusCode: ApiStatusCode.serverError,
        data: null,
        message: ex.toString(),
      );
    }
  }
}
