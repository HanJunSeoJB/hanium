import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_anywhere/services/assets_manager.dart';
import 'package:travel_anywhere/services/google_map.dart';
import 'package:travel_anywhere/widgets/text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.msg,
    required this.chatIndex,
    this.shouldAnimate = false,
  });

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          chatIndex == 0 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            decoration: BoxDecoration(
              color: chatIndex == 0
                  ? Color.fromRGBO(253, 159, 40, 1)
                  : Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
                bottomLeft:
                    chatIndex == 0 ? Radius.circular(12.0) : Radius.circular(0),
                bottomRight:
                    chatIndex == 0 ? Radius.circular(0) : Radius.circular(12.0),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userIamge
                      : AssetsManager.botImage,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: chatIndex == 0
                      ? TextWidget(
                          label: msg,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // 여기를 start로 설정하여 텍스트와 버튼이 왼쪽으로 정렬되도록 합니다.
                          children: [
                            shouldAnimate
                                ? DefaultTextStyle(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                    child: AnimatedTextKit(
                                      isRepeatingAnimation: false,
                                      repeatForever: false,
                                      displayFullTextOnTap: true,
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        TyperAnimatedText(
                                          msg.trim(),
                                        ),
                                      ],
                                    ),
                                  )
                                : Text(
                                    msg.trim(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                            // '일정 생성하기' 버튼 추가
                            if (chatIndex !=
                                0) // 채팅 인덱스를 확인하여 버튼이 봇 메시지에만 표시되도록 합니다.
                              TextButton(
                                onPressed: () {
                                  Get.to(MapScreen());
                                },
                                child: Text(
                                  '일정 생성하기',
                                  style: const TextStyle(
                                    color: Colors
                                        .blue, // 버튼의 텍스트 색상을 파란색으로 설정하여 더 눈에 띄게 만듭니다.
                                  ),
                                ),
                              ),
                          ],
                        ),
                ),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.black,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
