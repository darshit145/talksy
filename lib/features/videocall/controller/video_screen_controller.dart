import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import '../../auth/screen/login_screen.dart';
import '../../chat/domain/model/video_call_helper.dart';

class VideoScreenController extends ChangeNotifier{
  RTCVideoRenderer localRenderer = RTCVideoRenderer();
  Signaling signaling = Signaling();
  RTCVideoRenderer remoteRenderer = RTCVideoRenderer();
  String? roomId;
  TextEditingController textEditingController = TextEditingController(text: '');


  Future<void> makeVideoCall()async{
    showCupertinoSnackbar("Cheack Your Internet Connection\nPlease Try Again Later");
    await localRenderer.initialize();
    await remoteRenderer.initialize();

    signaling.onAddRemoteStream = ((stream) {
      remoteRenderer.srcObject = stream;
      notifyListeners();
    });
    await signaling.openUserMedia(localRenderer, remoteRenderer);
    notifyListeners();

    ///This is for creating the room on the firebase
    roomId = await signaling.createRoom(remoteRenderer);
    textEditingController.text = roomId!;
    //we have to send this room id to user 2
    sendNotification(roomId!);

  }

  Future<void> reciveaCall(String roomId)async{
    await localRenderer.initialize();
    await remoteRenderer.initialize();

    signaling.onAddRemoteStream = ((stream) {
      remoteRenderer.srcObject = stream;
      notifyListeners();
    });
    await signaling.openUserMedia(localRenderer, remoteRenderer);


    ///This is for creating the room on the firebase
    signaling.joinRoom(
      roomId,
        remoteRenderer,
    );
    notifyListeners();
  }

  Future<void> sendNotification(String id)async{
    await Future.delayed(Duration(seconds: 5));
        String user2Token ="cc0LVuozRmS8O4ecvDHW3n:APA91bF7gLaDZe1PwwlHc792vzzH3FGGTlg2IEswapUfp6xq1rnElr2s7hmbwOSoq2j8mrEmu8W40kzg_U1y2xhmM3nNeJqJV4yKBF-XVoN0NqWQDwdS4UU";
        String token = await getKey();
       var r= await http.post(
          Uri.parse(
              'https://fcm.googleapis.com/v1/projects/talksy-d8e7f/messages:send'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, dynamic>{
            "message": {
              "token":
              user2Token,
              "notification": {
                "body": 'This is the push notification',
                "title": 'Push Notification',
              },
              "data": {"id": id}
            }
          }),
        );
       print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
       print(r.body);
       print(r.statusCode);
    //     print('toen');
  }

  Future<void> hangUp()async{
    await signaling.hangUp(localRenderer);
    await localRenderer.dispose();
    await remoteRenderer.dispose();
    notifyListeners();
  }

}

Future<String> getKey() async {
  final scopes = [
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/firebase.database',
    'https://www.googleapis.com/auth/firebase.messaging',
  ];
  final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson({
        "type": "service_account",
        "project_id": "talksy-d8e7f",
        "private_key_id": "e787802e2aeea521ba3a7e45cf0ce0f364563ffc",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDVRX/DvWES5TcQ\nCP3CXE+OWs80fXFngBWLlQG3CiUbb/sMeSl3uIxgEBx1qnYcsrjq79EyvY4KDg+K\nmQriz77oiPojBbvj0qmXV2eYOVSVXybRauDXr4EWXier8O4VVe7K4xhDK/lhfyug\n8M8y3SU2rRqY+HJtIMqWQQP+6wM+po0jQpxco1yQ7pIlsOuI2+RI2b60t6xwL1oV\nQ5W+bSrHogD/DLuIVp6VjKY1R0BAgrBlC3cU7Q6Fm+DRCkEzICwpkZ0GkYOUOtOY\nDcuxSlRkK/erzEOvOoaBy5kil9/oqAANy98okngE+99hD9SK/iEFpGgJ5RwZHf8D\nkRo0T3YDAgMBAAECggEAHK4QbOpc5rVurq2EMSzIbAyChydZZpbpuXrBH3Qcolsa\n58YBZr6pbfUCBsF0ybjaYjRRgyEiO/BBHx0j7XViJxOIjnN5HWguczzcoF1mplcE\njtlFwZYx5f1Pw3EOa03CONl04U+auoWSAJNxoart6V46UJjp4QqtrlVcQV3USAp5\n3Clt3U40WvDDbsq18rkfiW5jvzrHi9V8TdJJWQq4QlsK8tW4Ex9xgqm+YF1g/zyW\nbcogzF+SRs9NS9mm0SXDNWRAkG7DXCQ8SEz5vY1bhSFXYkXZV4iS3UhTIuwpmu8O\ny33l7putmAwvOBosxVY57xVsA/m+FHHWvi34YyK6GQKBgQDv8Y0AeOq4KmWRnrcG\nCASwgI11IL9tq9Dq97gWtxpXgGWYNYQshePC4Kb/wt1jy21B7Ylpw0fD3PQVa8Q7\nCez1EWg6bcl+OC0wtmWgR5S+gyVPEyFyLzFvfPVmsml2SIeJBqL5QiQW4grs5yfT\n2d2sqxxMQ2jQqIDerboUaCyfmQKBgQDjiwgWoeSU2x5VdduzFWvNLPHXz2ofXkpW\nwUrcV/tDQQVOojGHv1k5jkuZye0Sj0lyIp19WF+6c4yx6+GD2ak3CCSkWte45lhr\nznQymfMOtQI1hYXnyG8S2ZReQQJdvgbEDjZyMH5+sgVV6C7h1V+MITD8y1umCc19\nXTO9ew+z+wKBgQCXWotTDPMikLvZC4Dv8QbkP3L7u1iFWahDT1d0HLQlFfz/8mIZ\no6t0Njmhg84bMSsON0RCzsfqKOpeyMfTZgNu4zgYA0DiuZTn8WZRoFWXhyp1ot+q\nI1LPvMcfrNMRpda4/NK44JvbQ2MY5Qcef4Nxc8453Ru041XHIVcLoFrloQKBgEA4\noFrK7Jn60i/qqMx9skRheAyiFOCvmymrOnbAOkF8G4RbEMGwhv1QpRPNwySm3mLh\nVDPpenNEY6Rf3/F3wGOw366nmRUtpi0fQvp5KvmuquXyPp3xmy/lyxNjI8jTdlNl\nc4Z9G2ak1g6uDnVc5K/HOm1O9BoD0ESexpinIAJ7AoGALOBQMtudmLFgSGHFYJyD\nphzbyJbfBY/6JPdlMtA2dcrAxr4n5KuROcjHI5ZC6EKlTQFbf51qh2qD9YOLB9bZ\nLVuDv8PUPaK8KMYYqfq5ebBWoc6nSY+lzE/JbMzmbBkWh/kA60b924tVVKWVw/qj\nw0hkzKC0AvFerYoulxsdAAA=\n-----END PRIVATE KEY-----\n",
        "client_email": "firebase-adminsdk-fbsvc@talksy-d8e7f.iam.gserviceaccount.com",
        "client_id": "112370411597805117153",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40talksy-d8e7f.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com"
      }),
      scopes);
  final accessserverkey = client.credentials.accessToken.data;
  return accessserverkey;
}
