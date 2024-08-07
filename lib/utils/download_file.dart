import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future downloadFile(String imageSrc, String path) async {
  Dio dio = Dio();
  var dir = await getApplicationDocumentsDirectory();
  var imageDownloadPath = '${dir.path}/$path';
  await dio.download(imageSrc, imageDownloadPath,
      onReceiveProgress: (received, total) {
    var progress = (received / total) * 100;
    debugPrint('Rec: $received , Total: $total, $progress%');
  });

  // downloadFile function returns path where image has been downloaded
  return imageDownloadPath;
}