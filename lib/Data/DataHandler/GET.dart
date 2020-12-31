import 'dart:convert';

import 'package:FitLyfe_app/Data/DataClasses/Post.dart';
import 'package:FitLyfe_app/Data/DataClasses/User.dart';
import 'package:FitLyfe_app/components/globals.dart';
import 'package:http/http.dart' as http;

Future<FitlyfeUser> getUserData(String uid) async {
  final response = await http.get("$apiURL/users/$uid");
  final responseJson = jsonDecode(response.body);
  return response.statusCode == 200 ? FitlyfeUser.fromJson(responseJson) : null;
}

Future<Post> getPost(String postID) async {
  final response = await http.get("$apiURL/posts/$postID");
  final responseJson = jsonDecode(response.body);
  return response.statusCode == 200 ? Post.fromJson(responseJson) : null;
}

Future<List<FitlyfeUser>> getUsers() async {
  final response = await http.get("$apiURL/users");
  final responseList = jsonDecode(response.body);
  if (response.statusCode == 200) {
    final users =
        responseList.map((userJson) => FitlyfeUser.fromJson(userJson)).toList();
    return users;
  } else {
    return null;
  }
}

Future<List<Post>> getPosts() async {
  final response = await http.get("$apiURL/posts");
  final responseJson = jsonDecode(response.body);
  if (response.statusCode == 200) {
    final posts =
        responseJson.map((postObj) => Post.fromJson(postObj)).toList();
    return posts;
  } else {
    return null;
  }
}
