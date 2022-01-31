class Announcement{
  final String title;
  final String description;
  final String link;

  Announcement(this.title,this.description,this.link);

  Announcement.fromJson(Map<dynamic,dynamic> json)
  : title=json['title'] as String,
    description=json['description'] as String,
    link = json['link'] as String;

  Map<dynamic,dynamic> toJson() => <dynamic,dynamic>{
    'description':description,
    'title':title,
    'link':link
  };
}
