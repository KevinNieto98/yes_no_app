import 'package:dio/dio.dart';
import 'package:yes_no_ap/domain/entities/message.dart';
import 'package:yes_no_ap/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    //print(response.data);
    //return response;

    final yesNoModel = YesNoModel.fromJson(response.data);
    return yesNoModel.toMessageEntity();// Replace 'Message()' with the appropriate value to return.
  }
}
