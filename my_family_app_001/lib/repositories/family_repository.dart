import 'dart:async';

import 'package:meta/meta.dart';

import '../family.dart';
import 'family_api_client.dart';

class FamilyRepository {
  final FamilyApiClient quoteApiClient;

  FamilyRepository({@required this.quoteApiClient})
      : assert(quoteApiClient != null);

  Future<Family> fetchFamily() async {
    return await quoteApiClient.fetchQuote();
  }
}