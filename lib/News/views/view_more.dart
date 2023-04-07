import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ViewMore extends StatelessWidget {
  final String init;
  const ViewMore({super.key, required this.init});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(init),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
