import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://54.161.55.230:8000/api/data'));

    if (response.statusCode == 200) {
      // API 호출이 성공한 경우
      var data = jsonDecode(response.body);

      // "results" 키가 있는지 확인하고, 그 안에서 특정 조건을 만족하는 객체 찾기
      if (data['results'] != null) {
        var targetObj = data['results']
            .firstWhere((item) => item['id'] == '123', orElse: () => null);

        if (targetObj != null) {
          print('Object found: ${targetObj.toString()}');
        } else {
          print('Object not found');
        }
      } else {
        print('No results found');
      }
    } else {
      // 서버가 OK 상태 코드가 아닌 것을 반환하면 오류 던지기
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data Fetch Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: fetchData,
          child: Text('Fetch Data'),
        ),
      ),
    );
  }
}
