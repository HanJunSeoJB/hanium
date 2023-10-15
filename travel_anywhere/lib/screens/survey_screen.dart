import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  List<String> questions = [
    '여행 기간을 선택해 주세요',
    '여행 계획시 가장 중점을 두는 부분은 어디인가요?',
    '여행의 목적은 무엇이신가요?',
    '당신의 숙소 취향을 알려 주세요 !',
    '이동할 때 어떤 교통수단을 사용하실 건가요?',
  ];

  Map<String, String?> responses = {};

  List<List<String>> options = [
    ['1박 2일', '2박 3일', '3박 4일', '일주일'],
    ['숙소', '관광지', '먹거리', '액티비티'],
    ['1. 일상 탈출! 편안하게 쉬고 싶어요', '새로운 경험을 해보고 싶어요', '맛집 탐방 하고 싶어요'],
    ['호텔/리조트', '독채 펜션', '게스트하우스'],
    ['뚜벅이', '자전거', '버스', '자동차(렌터카)'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          String question = questions[index];
          List<String> optionList = options[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  question,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Column(
                children: optionList.map((option) {
                  return ListTile(
                    leading: Radio<String>(
                      value: option,
                      groupValue: responses[question],
                      onChanged: (value) {
                        setState(() {
                          responses[question] = value;
                        });
                      },
                    ),
                    title: Text(option),
                  );
                }).toList(),
              ),
              Divider(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/chatScreen');
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
