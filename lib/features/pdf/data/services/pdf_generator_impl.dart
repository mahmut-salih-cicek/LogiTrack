import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import '../../domain/services/pdf_generator_service.dart';

class PdfGeneratorImpl implements PdfGeneratorService {
  @override
  Future<File> generatePodPdf({
    required String loadNumber,
    required String stopAddress,
    required String receiverName,
    required DateTime timestamp,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('TURUSA Logistics', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              pw.Text('Proof of Delivery', style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('Load Number: $loadNumber'),
              pw.Text('Address: $stopAddress'),
              pw.Text('Receiver: $receiverName'),
              pw.Text('Date: ${timestamp.toString()}'),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/pod_${DateTime.now().millisecondsSinceEpoch}.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  @override
  Future<File> generateEodPdf({
    required DateTime shiftStart,
    required DateTime shiftEnd,
    required int completedStops,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('TURUSA Logistics', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              pw.Text('End of Day Report', style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('Shift Start: ${shiftStart.toString()}'),
              pw.Text('Shift End: ${shiftEnd.toString()}'),
              pw.Text('Completed Stops: $completedStops'),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/eod_${DateTime.now().millisecondsSinceEpoch}.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }
}

