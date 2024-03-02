import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class HomePageProtocol extends StatefulWidget {
  @override
  _HomePageProtocolState createState() => _HomePageProtocolState();
}

class _HomePageProtocolState extends State<HomePageProtocol> {
  late StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    _initDeepLinkListener();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  Future<void> _initDeepLinkListener() async {
    _sub = linkStream.listen((String? link) {
      // Handle incoming deep link
      _handleDeepLink(link);
    }, onError: (err) {
      // Handle error
      print('Error: $err');
    });

    // Initial deep link check (in case the app was launched from a deep link)
    final initialLink = await getInitialLink();
    _handleDeepLink(initialLink);
  }

  void _handleDeepLink(String? link) {
    if (link != null) {
      // Parse the tokens from the deep link
      final Uri uri = Uri.parse(link);
      final accessToken = uri.queryParameters['accessToken'];
      final refreshToken = uri.queryParameters['refreshToken'];
      print('accessToken = $accessToken');
      print('refreshToken = $refreshToken');
      // Process the tokens as needed
      // e.g., store them, authenticate the user, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deep Link Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            openUrl('https://basic-auth-324k.onrender.com/api/auth/google');
          },
          child: Text('Go to Link'),
        ),
      ),
    );
  }

  Future<void> openUrl(String url) async {
    final _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) { // <--
      throw Exception('Could not launch $_url');
    }
  }

}
