// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  final String sender;
  final String message;
  final String at;

  ChatModel({
    required this.sender,
    required this.message,
    required this.at,
  });

  ChatModel copyWith({String? sender, String? message, String? at}) =>
      ChatModel(
        sender: sender ?? this.sender,
        message: message ?? this.message,
        at: at ?? this.at,
      );

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        sender: json["sender"],
        message: json["message"],
        at: json['at'],
      );

  Map<String, dynamic> toJson() => {
        "sender": sender,
        "message": message,
        "at": at,
      };
}
