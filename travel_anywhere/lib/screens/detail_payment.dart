import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DetailPaymentPage extends StatefulWidget {
  @override
  _DetailPaymentPageState createState() => _DetailPaymentPageState();
}

class _DetailPaymentPageState extends State<DetailPaymentPage> {
  int? paymentMethod;

  @override
  Widget build(BuildContext context) {
    int sumPrice = 290000;
    final numberFormat = NumberFormat('#,##0', 'en_US');
    String formattedSumPrice = numberFormat.format(sumPrice);
  
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context); // 이전 화면으로 돌아갑니다
      },
    ),
        title: Text('결제 페이지',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromRGBO(253, 159, 40, 1)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('주문 정보', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            Text('주문자', style: TextStyle(fontSize: 18)),
            Row(
              children: [
                Expanded(child: TextField(decoration: InputDecoration(hintText: '한준서'))),
                SizedBox(width: 16),
                Expanded(child: TextField(decoration: InputDecoration(hintText: '010-1111-2222'))),
              ],
            ),
            TextField(decoration: InputDecoration(hintText: 'kasdasd@naver.com')),
            SizedBox(height: 20),

            Text('결제수단', style: TextStyle(fontSize: 18)),
            Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: paymentMethod == 0, 
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = 0;
                        });
                      }
                    ),
                    Text('카드결제'),
                    SizedBox(width: 16),
                    Checkbox(
                      value: paymentMethod == 1, 
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = 1;
                        });
                      }
                    ),
                    Text('무통장입금'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: paymentMethod == 2, 
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = 2;
                        });
                      }
                    ),
                    Text('카카오페이'),
                    SizedBox(width: 16),
                    Checkbox(
                      value: paymentMethod == 3, 
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = 3;
                        });
                      }
                    ),
                    Text('TossPay'),
                  ],
                ),
              ],
            ),

            SizedBox(height: 16),

            Text('주문 목록', style: TextStyle(fontSize: 18)),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  title: Text('제주 그랜드 호텔'),
                  trailing: Text('290,000원'),
                ),
              ],
            ),
            Divider(),

            Text('총 가격', style: TextStyle(fontSize: 18)),
            SizedBox(height: 32),
            Text('${formattedSumPrice}원', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            Center(
              child: ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('결제 완료'),
          content: Text('결제가 완료되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 대화상자 닫기
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  },
  child: Text('결제하기', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                  backgroundColor: Color.fromRGBO(253, 159, 40, 1)
                ),
),
            ),
          ],
        ),
      ),
    );
  }
}
