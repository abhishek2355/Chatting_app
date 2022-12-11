class ChatMassageEntity {
  String text;
  String? imageUrl;
  String id;
  String? createdat;
  Author author;

  ChatMassageEntity(
      {required this.text,
      required this.id,
      this.createdat,
      this.imageUrl,
      required this.author});

  factory ChatMassageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMassageEntity(
        text: json['text'],
        id: json['id'],
        createdat: json['createdat'],
        imageUrl: json['image'],
        author: Author.fromJson(json['author']));
  }
}

class Author {
  String userName;
  Author({required this.userName});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(userName: json['Username']);
  }
}
