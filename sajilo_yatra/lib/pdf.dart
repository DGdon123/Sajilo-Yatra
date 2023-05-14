import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfCreator {
  final int myColorValue = 0xFFFFFFFF;
  final String fileName;

  PdfCreator(this.fileName);

  Future<void> createPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Image(pw.MemoryImage(
              File('images/logos.png').readAsBytesSync(),
            )),
            pw.Text('Hello World!kbkjbjbk',
                style: pw.TextStyle(
                  color: PdfColor.fromInt(myColorValue),
                )),
          ],
        ),
      ),
    );

    final file = File('$fileName.pdf');
    await file.writeAsBytes(await pdf.save());
  }
}
