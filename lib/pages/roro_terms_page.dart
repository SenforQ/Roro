import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RoroTermsPage extends StatelessWidget {
  const RoroTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = AppBar().preferredSize.height;
    final totalTopHeight = statusBarHeight + appBarHeight;
    final webViewHeight = screenSize.height - totalTopHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Use'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/base_content_bg.webp',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(98
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFFFF69B4),
                          const Color(0xFFFFD700),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: totalTopHeight,
              height: webViewHeight,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: WebViewWidget(
                  controller: WebViewController()
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..setBackgroundColor(Colors.transparent)
                    ..loadRequest(
                      Uri.parse(
                        'https://www.privacypolicies.com/live/dddb6bdd-2ff7-4b55-8c3e-094ee0823770',
                      ),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

