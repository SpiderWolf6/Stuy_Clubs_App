import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';

    final user = FirebaseAuth.instance.currentUser!;

    fetchData(String url) async {
      String? token = await FirebaseMessaging.instance.getToken();
      print('Token: $token');
      var send = {
        "fcm": token,
        "user_id": user.email!,
      };
      http.Response response = await http.post(
        Uri.parse(url),
        body: send,
      );
      print("sent");
      return json.decode(response.body);
    }