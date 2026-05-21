import 'package:dio/dio.dart';
import 'package:yes_is_my_app/models/message.dart';

class GetYesNoAnswer {
  final _dio = Dio(BaseOptions(baseUrl: 'https://yesno.wtf'));

  Future<message> getAnswer() async {
    final response = await _dio.get('/api');
    final data = response.data as Map<String, dynamic>?;
    final answer = (data != null && data['answer'] is String)
        ? data['answer'] as String
        : 'maybe';

    return message(text: answer, fromWho: FromWho.her);
  }
}
