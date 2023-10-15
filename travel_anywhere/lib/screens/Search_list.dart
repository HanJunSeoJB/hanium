import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_anywhere/screens/detail.dart';

String determineContentTypeId(String keyword) {
  Map<String, List<String>> keywordMap = {
    '32': ['펜션', '모텔', '호텔', '글램핑'],
    '28': ['스포츠', '바이킹', '카라반', '골프장', '자전거'],
    '39': ['돼지', '우럭', '반점', '커피', '국', '돈'],
  };

  String contentTypeId = '32'; // default value

  for (String key in keywordMap.keys) {
    for (String value in keywordMap[key]!) {
      if (keyword.contains(value)) {
        contentTypeId = key;
        break;
      }
    }
  }

  return contentTypeId;
}

void navigateToDetailScreen(BuildContext context, String keyword) {
  String contentTypeId = determineContentTypeId(keyword);
  Get.to(() => DetailScreen(contentTypeId: contentTypeId, keyword: keyword));
}
