// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:test_and_mock_session/model/data_model.dart';
import 'package:test_and_mock_session/model/quiz_model.dart';

class QuizService {
  Dio dio;
  QuizService({
    required this.dio,
  });

  

// ! Mocking for Dio class --- 
// ? This code must be refactor ?  // 

Future<PureData> getDataExampleWithMock() async {
  try {
     // Use the passed dio or create a new one
    Response response = await dio
        .get("https://66bb7c806a4ab5edd63891b2.mockapi.io/api/v1/Quiz");

    return DataSuccess(
      list: List.generate(
        response.data.length,
        (index) => QuizModel.fromMap(
          response.data[index],
        ),
      ),
    );
  } catch (e) {
    throw Exception();
  }
}
}


