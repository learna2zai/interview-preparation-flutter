import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class SslPinningService {
  static final SslPinningService _instance = SslPinningService._internal();

  factory SslPinningService() => _instance;

  late Dio dio;

  SslPinningService._internal() {
    dio = Dio();
    _configurePinning();
  }

  final List<String> pinningHashes = [
    "GU4mANIqbRhsc46KdzcRcCGxmrrntf/lpIJ8T0cefL8=", // current
    "verq34ttqgfvtqbtwegwebgrwbewthenasaqetq", // backup
  ];

  void _configurePinning() {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
              final pubKey = cert.der;
              final sha256Result = sha256.convert(pubKey).bytes;
              final base64Hash = base64.encode(sha256Result);

              return pinningHashes.contains(base64Hash);
            };
        return client;
      },
    );
  }
}
