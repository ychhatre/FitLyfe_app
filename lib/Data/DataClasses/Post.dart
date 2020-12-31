import 'package:FitLyfe_app/Data/DataClasses/User.dart';

class Post {
  FitlyfeUser creator;
  List contentURL;
  String content;
  List<FitlyfeUser> likes;

  Post(this.creator, this.contentURL, this.content, this.likes);

  static Post fromJson(Map<String, dynamic> json) {
    return Post(FitlyfeUser.fromJson(json['creator']), json['creatorURL'],
        json['content'], json['likes']);
  }
}
