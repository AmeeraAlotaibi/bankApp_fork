import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  int senderID;
  int receiverID;
  int amount;
  String type;

  Transaction({
    required this.amount,
    required this.type,
    required this.senderID,
    required this.receiverID,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
