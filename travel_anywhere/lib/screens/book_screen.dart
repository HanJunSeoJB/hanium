import 'package:flutter/material.dart';
import 'package:travel_anywhere/screens/detail_payment.dart';

class ReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    final String firstImage = arguments['firstImage'];
    final String addr1 = arguments['addr1'];
    final String title = arguments['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text('예약 페이지'),
        backgroundColor: Color.fromRGBO(253, 159, 40, 1),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Uri.parse(firstImage).isAbsolute
                  ? Image.network(
                      firstImage,
                      width: MediaQuery.of(context).size.width, // 화면 넓이로 설정
                      height: 300.0, // 원하는 높이로 설정
                      fit: BoxFit.cover, // 넓이에 맞게 이미지를 조절
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150.0,
                      color: Colors.grey[200],
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 100.0,
                        ),
                      ),
                    ),
              Expanded(
                child: Container(
                  color: Colors.white, // 흰색 박스
                  padding: const EdgeInsets.all(16.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // 텍스트를 왼쪽으로 정렬
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 12.0), // 제목과 주소 사이에 약간의 공간 추가
                      Text(
                        addr1,
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width - 328.0) /
                2, // 박스를 화면 중앙에 위치시킴
            top: 482.0,
            child: Container(
              width: 328.0,
              height: 84.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black), // 테두리 색상
                borderRadius: BorderRadius.circular(12.0), // 테두리 둥글게
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '체크인',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3.0),
                        Text('13:00PM',
                            style: TextStyle(
                                fontSize: 14)), // 여기에 체크인 날짜를 추가할 수 있습니다.
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 1.0,
                    width: 16.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0), // 왼쪽 패딩 추가
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '체크아웃',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 3.0),
                          Text('11:00AM',
                              style: TextStyle(
                                  fontSize: 14)), // 여기에 체크아웃 날짜를 추가할 수 있습니다.
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPaymentPage()),
          );
          },
          child: Text('예약하기', style: TextStyle(fontSize: 18.0)),
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(253, 159, 40, 1), // 버튼의 배경색
            onPrimary: Colors.white, // 버튼의 텍스트 색상
            padding: EdgeInsets.symmetric(vertical: 16.0), // 버튼의 수직 패딩
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // 버튼의 모서리를 둥글게
            ),
            minimumSize: Size(
                MediaQuery.of(context).size.width - 32.0, 50.0), // 버튼의 최소 크기
          ),
        ),
      ),
    );
  }
}
