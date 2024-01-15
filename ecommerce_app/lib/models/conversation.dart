class Conversation {
  final int id;
  final String idUs1;
  final String idUs2;
  final int status;

  Conversation(
      {required this.id,
      required this.idUs1,
      required this.idUs2,
      required this.status});

  Conversation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        idUs1 = json['idUs1'],
        idUs2 = json['idUs2'],
        status = json['status'];
}
