import 'dart:convert';

TranslationModel translationModelFromJson(String str) =>
    TranslationModel.fromJson(json.decode(str));

String translationModelToJson(TranslationModel data) =>
    json.encode(data.toJson());

class TranslationModel {
  TranslationModel({
    this.originalText = '',
    this.translatedText = '',
  });

  String originalText;
  String translatedText;

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      TranslationModel(
          originalText: json['original'], translatedText: json['translated']);

  Map<String, dynamic> toJson() => {
        'original': originalText,
        'translated': translatedText,
      };
}

