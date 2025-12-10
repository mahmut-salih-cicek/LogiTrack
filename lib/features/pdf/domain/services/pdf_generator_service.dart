import 'dart:io';

abstract class PdfGeneratorService {
  Future<File> generatePodPdf({
    required String loadNumber,
    required String stopAddress,
    required String receiverName,
    required DateTime timestamp,
  });

  Future<File> generateEodPdf({
    required DateTime shiftStart,
    required DateTime shiftEnd,
    required int completedStops,
  });
}

