class FitlyfeUser {
  String displayName;
  String username;
  String email;
  String profilePic;
  List<String> followers;
  List<String> following;

  FitlyfeUser(this.displayName, this.username, this.email, this.profilePic,
      this.followers, this.following);

  static FitlyfeUser fromJson(Map<String, dynamic> json) {
    return FitlyfeUser(json['displayName'], json['username'], json['email'],
        json['profilePic'], json['followers'], json['following']);
  }
}
