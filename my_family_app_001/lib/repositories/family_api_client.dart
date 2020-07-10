import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../family.dart';

class FamilyApiClient {
  final _baseUrl = 'https://myfamilytree-00120200612203048.azurewebsites.net';
  final http.Client httpClient;
  FamilyApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Family> fetchQuote() async {
    final url = '$_baseUrl/api/Families';
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);
    return Family.fromJson(json);
  }

}