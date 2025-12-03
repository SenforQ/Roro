import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'roro_privacy_page.dart';
import 'roro_terms_page.dart';
import 'roro_about_us_page.dart';
import 'roro_editor_page.dart';

class ThreePage extends StatefulWidget {
  const ThreePage({super.key});

  @override
  State<ThreePage> createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  String _userName = 'Roro';
  String _userSignature = 'No personal signature';
  String? _avatarPath;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('user_name') ?? 'Roro';
      _userSignature = prefs.getString('user_signature') ?? 'No personal signature';
      final avatarRelativePath = prefs.getString('avatar_relative_path');
      if (avatarRelativePath != null) {
        _loadAvatarFromRelativePath(avatarRelativePath);
      }
    });
  }

  Future<void> _loadAvatarFromRelativePath(String relativePath) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$relativePath');
      if (await file.exists()) {
        setState(() {
          _avatarPath = file.path;
        });
      }
    } catch (e) {
      // 如果加载失败，使用默认头像
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                      gradient: LinearGradient(
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
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildTopSection(context),
                  _buildProfileCard(),
                  const SizedBox(height: 0),
                  _buildMenuItems(context),
                  SizedBox(height: MediaQuery.of(context).padding.bottom + 140),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: topPadding + 24,
      ),
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/mine_top_content_bg.webp',
          fit: BoxFit.cover,
          width: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.pink.withOpacity(0.3),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Transform.translate(
      offset: const Offset(0, -44),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipOval(
              child: _avatarPath != null
                  ? Image.file(
                      File(_avatarPath!),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildDefaultAvatar();
                      },
                    )
                  : Image.asset(
                      'assets/user_default.webp',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildDefaultAvatar();
                      },
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _userName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _userSignature,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      width: 80,
      height: 80,
      color: Colors.grey[300],
      child: const Icon(Icons.person, size: 40),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildMenuItem(
            iconPath: 'assets/icon_me_edit.webp',
            title: 'Edit information',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoroEditorPage(),
                ),
              ).then((saved) {
                if (saved == true) {
                  _loadUserData();
                }
              });
            },
          ),
          _buildDivider(),
          _buildMenuItem(
            iconPath: 'assets/icon_me_policy.webp',
            title: 'Privacy Policy',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoroPrivacyPage(),
                ),
              );
            },
          ),
          _buildDivider(),
          _buildMenuItem(
            iconPath: 'assets/icon_me_terms.webp',
            title: 'Terms of Use',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoroTermsPage(),
                ),
              );
            },
          ),
          _buildDivider(),
          _buildMenuItem(
            iconPath: 'assets/icon_me_us.webp',
            title: 'About Us',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoroAboutUsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFF69B4).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                iconPath,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 24,
                    color: Color(0xFFFF69B4),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 60,
      color: Colors.grey[200],
    );
  }
}
