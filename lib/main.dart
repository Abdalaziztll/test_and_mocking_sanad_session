
import 'package:flutter/material.dart';
import 'package:test_and_mock_session/model/data_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

ValueNotifier<PureData> data = ValueNotifier(PureData());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: data,
        builder: (context, value, child) {
          if (value is DataSuccess) {
            if (value.list.isEmpty) {
              return const Center(
                child: Icon(Icons.not_interested),
              );
            } else {
              return ListView.builder(
                itemCount: value.list.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    value.list[index].question,
                  ),
                ),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Hello World"),
            ),
          );

          // ? remove comment to get Data
          // QuizService quizService = QuizService(dio: Dio());
          // data.value = await quizService.getDataExampleWithMock();
          // print(data.value);
        },
      ),
    );
  }
}
