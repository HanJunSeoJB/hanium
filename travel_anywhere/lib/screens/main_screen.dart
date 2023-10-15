import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_anywhere/screens/Search_list.dart';
import 'package:travel_anywhere/screens/detail.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final _focus = FocusNode();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 10, top: 80, bottom: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _textController,
                        focusNode: _focus,
                        keyboardType: TextInputType.text,
                        onChanged: (text) {},
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          icon: Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: GestureDetector(
                              onTap: () {
                                String keyword = _textController.text;
                                navigateToDetailScreen(context, keyword);
                              },
                              child: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      Get.toNamed('/chatScreen');
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {},
                    icon: const Icon(
                      Icons.pending,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildButton(context, 'assets/images/home.jpg', '숙소', '32'),
                  SizedBox(height: 20),
                  buildButton(context, 'assets/images/food.jpg', '음식점', '39'),
                  SizedBox(height: 20),
                  buildButton(context, 'assets/images/play.jpg', '레저', '28'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String imagePath, String buttonText,
      String contentTypeId) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Ink(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: InkWell(
          onTap: () {
            Get.to(() =>
                DetailScreen(contentTypeId: contentTypeId, keyword: "제주"));
          },
          child: Container(
            color: Colors.black.withOpacity(0.4),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  buttonText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
