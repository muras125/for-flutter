import 'dart:html';

import 'package:equatable/equatable.dart';

class Family extends Equatable{
  /*final id;
  final String quoteText;
  final String quoteAuthor;
  const Quote({this.id, this.quoteText, this.quoteAuthor});*/

  final id;
  final String familyName;
  final DateTime marriageDate;
  final String wifeName;
  final String husbandName;
  final String familyStatus;
  final String familyRootID;
  final  File familyImage;

  const Family({this.id, this.familyName, this.marriageDate, this.wifeName, this.husbandName, this.familyStatus, this.familyRootID, this.familyImage});

  @override
  // TODO: implement props
  List<Object> get props => [id, familyName, marriageDate, wifeName, husbandName, familyStatus, familyRootID, familyImage];

  static Family fromJson(dynamic json) {
    return Family(
      id: json['_id'],
      familyName: json['familyName'],
      marriageDate: json['marriageDate'],

      wifeName: json['wifeName'],
      husbandName: json['husbandName'],
      familyStatus: json['familyStatus'],
      familyRootID: json['familyRootID'],
      familyImage: json['familyImage'],

    );
  }

  @override
  String toString() => 'Family { id: $id }';


}