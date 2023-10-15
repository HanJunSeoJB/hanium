import 'package:flutter/material.dart';

class NoResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('검색 결과 없음'),
      ),
      body: Center(
        child: Text('검색어와 일치하는 결과가 없습니다.'),
      ),
    );
  }
}
