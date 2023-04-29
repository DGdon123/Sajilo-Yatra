import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> generatePdfFile() async {
  // Create a new PDF document
  final pdf = pw.Document();

  // Add a page to the document
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Center(
        child: pw.Text(
          "Hello, world!",
          style: const pw.TextStyle(fontSize: 24),
        ),
      ),
    ),
  );

  // Save the document to a file
  final bytes = await pdf.save();
  final file = File('example.pdf');
  await file.writeAsBytes(bytes);
}
