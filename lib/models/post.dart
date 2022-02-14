class Post{
  final int id;
  final String title;
  final String description;
  final String? createdAt;

  Post(this.id, this.title, this.description, this.createdAt);

  Post.fromJson(Map<String, dynamic> json)
    : id = json['id'],
    title = json['title'],
    description = json['description'],
    createdAt = json['created_at'];

}
