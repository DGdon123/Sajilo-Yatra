import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerIcon {
  static Future<BitmapDescriptor> getMarkerImage(
      String imagePath, int size) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final ByteData data = await rootBundle.load(imagePath);
    final Uint8List bytes = data.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo imageInfo = await codec.getNextFrame();
    final ui.Image image = imageInfo.image;
    canvas.drawImage(image, Offset.zero, Paint());
    final ui.Picture picture = pictureRecorder.endRecording();
    final ui.Image renderedImage = await picture.toImage(size, size);
    final ByteData? imageData =
        await renderedImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = imageData!.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(pngBytes);
  }
}
