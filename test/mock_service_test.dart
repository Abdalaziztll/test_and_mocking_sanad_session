import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart'; // Replace with the actual path
import 'package:test_and_mock_session/model/data_model.dart';
import 'package:test_and_mock_session/service/quiz_service.dart';

import 'mock_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('init mocking object', () {
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
    });

    test('should return DataSuccess when API returns data', () async {
      // Arrange
      final responsePayload = [
        {"id": "1", "question": "What is Flutter?"},
        {"id": "2", "question": "What is Dart?"}
      ];

      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: responsePayload,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await QuizService(dio: mockDio).getDataExampleWithMock();

      expect(result, isA<DataSuccess>());
      final dataSuccess = result as DataSuccess;
      expect(dataSuccess.list.length, 2);
      expect(dataSuccess.list[0].question, "What is Flutter?");
    });

    test('should throw Exception on API error', () async {
      when(mockDio.get(any)).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        error: 'Something went wrong!',
      ));

      expect(() => QuizService(dio: mockDio).getDataExampleWithMock(),
          throwsException);
    });
  });
}
