import 'dart:convert';

class Article {
    final int? userId;
    final int? id;
    final String? title;
    final String? body;

    Article({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    Article copyWith({
        int? userId,
        int? id,
        String? title,
        String? body,
    }) => 
        Article(
            userId: userId ?? this.userId,
            id: id ?? this.id,
            title: title ?? this.title,
            body: body ?? this.body,
        );

    factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
