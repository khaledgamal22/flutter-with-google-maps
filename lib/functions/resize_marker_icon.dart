/*
how to change marker size , this function convert image to byte data and resize it
*/

import 'dart:ui' as ui;
import 'package:flutter/services.dart';

Future<Uint8List> resizeMarkerIcon(String image, double width) async {
  // get image from assets as byte data
  var rowData = await rootBundle.load(image);
  // decode image
  var imageCodec = await ui.instantiateImageCodec(
    rowData.buffer.asUint8List(),
    targetWidth: width.toInt(),
  );
  // get frame data of image
  var imageFrame = await imageCodec.getNextFrame();
  // convert image to byte data
  var imageByteRow =
      await imageFrame.image.toByteData(format: ui.ImageByteFormat.png);
  var imageDataUint8List = imageByteRow!.buffer.asUint8List();
  return imageDataUint8List;
}
