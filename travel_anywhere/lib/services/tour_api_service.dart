import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_anywhere/screens/no_search_screen.dart';

Future<List<dynamic>> fetchTourData(
    String contentTypeId, String keyword, BuildContext context) async {
  final params = {
    'MobileOS': 'AND',
    'MobileApp': 'test',
    'keyword': keyword,
    '_type': 'json',
    'contentTypeId': contentTypeId,
    'serviceKey':
        'duBQaOf5uSa/N3D0J/k1xqZvWnR9zEYC7O5xVx2kR8jDeh2IbMwBt15nBxkfk2gsmfGY/jzD30P01HUm/2focw==', // 여기에 실제 서비스 키를 입력해주세요
  };

  final uri = Uri(
    scheme: 'http',
    host: 'apis.data.go.kr',
    path: '/B551011/KorService1/searchKeyword1',
    queryParameters: params,
  );

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final String decodedBody = utf8.decode(response.bodyBytes);
    print(decodedBody);
    final Map<String, dynamic> jsonResponse = json.decode(decodedBody);

    if (jsonResponse['response']['body']['totalCount'] == 0) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => NoResultsScreen()),
      );
      return [];
    }
    print(jsonResponse);
    return jsonResponse['response']['body']['items']['item'];
  } else {
    throw Exception(
        'Failed to load data from API. Status code: ${response.statusCode}');
  }
}
