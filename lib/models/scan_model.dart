import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  ScanModel({
    this.prediction = '',
    this.probability = 0.00,
  });

  String prediction;
  double probability;

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
      prediction: json['prediction'], probability: json['probability']);

  Map<String, dynamic> toJson() => {
        'prediction': prediction,
        'probability': probability,
      };
}
