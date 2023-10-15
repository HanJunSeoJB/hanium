import 'package:flutter/material.dart';
import 'package:travel_anywhere/services/tour_api_service.dart';

class DetailScreen extends StatefulWidget {
  final String contentTypeId;
  final String keyword;

  DetailScreen({required this.contentTypeId, required this.keyword});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(253, 159, 40, 1),
        title: Text('상세페이지'),
      ),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: fetchTourData(widget.contentTypeId, widget.keyword, context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error: ${snapshot.error}');
            } else {
              final data = snapshot.data;
              return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  final item = data![index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/reservation',
                            arguments: {
                              'firstImage': item['firstimage'] ?? '이미지 없음',
                              'addr1': item['addr1'] ?? '주소 없음',
                              'title': item['title'] ?? '제목 없음',
                            },
                          );
                        },
                        child: (item['firstimage'] != null &&
                                Uri.parse(item['firstimage']).isAbsolute)
                            ? Image.network(item['firstimage'],
                                width: 150, height: 150, fit: BoxFit.cover)
                            : Container(
                                // 빈 컨테이너나 원하는 기본 이미지를 추가
                                width: 150,
                                height: 150,
                                color: Colors.grey[200],
                                child: Icon(Icons.image_not_supported),
                              ),
                      ),
                      Text(item['title'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(item['addr1']),
                      SizedBox(height: 10), // 각 항목 사이의 간격
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
