import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  List<String> _processedBarcodes;
  VisionText _ingredients;

  void getProcessImage() async {
    final imageFile = 
      await ImagePicker.pickImage(
          source: ImageSource.camera
    );

    List<String> processedBarcodes;

    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(imageFile);

    final BarcodeDetector barcodeDetector =
        FirebaseVision.instance.barcodeDetector(
      BarcodeDetectorOptions(
          barcodeFormats: (BarcodeFormat.codabar |
              BarcodeFormat.code128 |
              BarcodeFormat.ean13 |
              BarcodeFormat.ean8 |
              BarcodeFormat.upca |
              BarcodeFormat.upce)),
    );
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();

    final List<Barcode> barcodes =
        await barcodeDetector.detectInImage(visionImage);
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);

    for (Barcode barcode in barcodes) {
      final String rawValue = barcode.rawValue;
      processedBarcodes.add(rawValue);
    }

    if (mounted) {
      await setState(() {
        _ingredients = visionText;
        _processedBarcodes = processedBarcodes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Product'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getProcessImage();
        },
        child: Icon(CupertinoIcons.photo_camera),
      ),
    );
  }
}
