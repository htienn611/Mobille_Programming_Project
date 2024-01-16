class Message {
  final int id;
  final String senderID;
  final String content;
  final DateTime timestamp;
  final int conversationId;
  final int status;

  Message(
      {required this.id,
      required this.senderID,
      required this.content,
      required this.timestamp,
      required this.conversationId,
      required this.status});

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        senderID = json['senderID'],
        content = json['content'],
        timestamp = DateTime.parse(json['timestamp']),
        conversationId=json['conversationID'],
        status = json['status'];
}
