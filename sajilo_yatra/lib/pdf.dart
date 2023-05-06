import 'dart:io';
import 'package:pdf/widgets.dart' as pw;

class PdfCreator {
  final String fileName;

  PdfCreator(this.fileName);

  Future<void> createPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );

    final file = File('$fileName.pdf');
    await file.writeAsBytes(await pdf.save());
  }
}
