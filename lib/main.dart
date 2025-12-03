import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/welcome_page.dart';
import 'pages/one_page.dart';
import 'pages/two_page.dart';
import 'pages/three_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFE36FA)),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const OnePage(),
    const TwoPage(),
    const ThreePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: bottomPadding + 12,
            child: _buildFloatingTabBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: _buildTabItem(0, 'assets/tab_one_n.webp', 'assets/tab_one_s.webp'),
          ),
          Expanded(
            child: _buildTabItem(1, 'assets/tab_two_n.webp', 'assets/tab_two_s.webp'),
          ),
          Expanded(
            child: _buildTabItem(2, 'assets/tab_three_n.webp', 'assets/tab_three_s.webp'),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String normalImage, String selectedImage) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        HapticFeedback.selectionClick();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        child: _buildTabIcon(
          isSelected ? selectedImage : normalImage,
        ),
      ),
    );
  }

  Widget _buildTabIcon(String imagePath) {
    return _buildScaledImage(imagePath);
  }

  Widget _buildScaledImage(String imagePath) {
    return FutureBuilder<Size>(
      future: _getImageSize(imagePath),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final imageSize = snapshot.data!;
          final displayWidth = imageSize.width / 2.0;
          final displayHeight = imageSize.height / 2.0;
          return SizedBox(
            width: displayWidth,
            height: displayHeight,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(Icons.image_not_supported),
                );
              },
            ),
          );
        }
        return const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        );
      },
    );
  }

  Future<Size> _getImageSize(String imagePath) async {
    final completer = Completer<Size>();
    final image = AssetImage(imagePath);
    final imageStream = image.resolve(const ImageConfiguration());
    
    late ImageStreamListener listener;
    listener = ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
      final image = imageInfo.image;
      final size = Size(image.width.toDouble(), image.height.toDouble());
      imageStream.removeListener(listener);
      if (!completer.isCompleted) {
        completer.complete(size);
      }
    }, onError: (exception, stackTrace) {
      imageStream.removeListener(listener);
      if (!completer.isCompleted) {
        completer.complete(const Size(48, 48));
      }
    });
    
    imageStream.addListener(listener);
    return completer.future;
  }
}
