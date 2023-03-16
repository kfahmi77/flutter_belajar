class Galleries {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Galleries(
      {int? albumId,
      int? id,
      String? title,
      String? url,
      String? thumbnailUrl}) {
    if (albumId != null) {
      albumId = albumId;
    }
    if (id != null) {
      id = id;
    }
    if (title != null) {
      title = title;
    }
    if (url != null) {
      url = url;
    }
    if (thumbnailUrl != null) {
      thumbnailUrl = thumbnailUrl;
    }
  }

  Galleries.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
