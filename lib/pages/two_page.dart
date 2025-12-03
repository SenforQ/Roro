import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'video_detail_page.dart';
import 'post_video_page.dart';
import 'report_page.dart';

class TwoPage extends StatefulWidget {
  const TwoPage({super.key});

  @override
  State<TwoPage> createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  List<Map<String, dynamic>> _characters = [];
  bool _isLoading = true;
  Set<String> _likedCharacters = {};
  Set<String> _blockedCharacters = {};
  Set<String> _mutedCharacters = {};

  @override
  void initState() {
    super.initState();
    _loadLikedCharacters();
    _loadBlockedAndMutedCharacters();
    _loadCharacters();
  }

  Future<void> _loadBlockedAndMutedCharacters() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final blockedList = prefs.getStringList('blocked_characters') ?? [];
      final mutedList = prefs.getStringList('muted_characters') ?? [];
      setState(() {
        _blockedCharacters = blockedList.toSet();
        _mutedCharacters = mutedList.toSet();
      });
    } catch (e) {
      // 如果加载失败，使用空集合
    }
  }

  Future<void> _loadLikedCharacters() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final likedList = prefs.getStringList('liked_characters') ?? [];
      setState(() {
        _likedCharacters = likedList.toSet();
      });
    } catch (e) {
      // 如果加载失败，使用空集合
    }
  }

  Future<void> _toggleLike(int index) async {
    final characterId = index.toString();
    final isLiked = _likedCharacters.contains(characterId);
    
    setState(() {
      if (isLiked) {
        _likedCharacters.remove(characterId);
      } else {
        _likedCharacters.add(characterId);
      }
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('liked_characters', _likedCharacters.toList());
    } catch (e) {
      // 如果保存失败，恢复状态
      setState(() {
        if (isLiked) {
          _likedCharacters.add(characterId);
        } else {
          _likedCharacters.remove(characterId);
        }
      });
    }

    if (!isLiked) {
      _showCenterToast(context, 'Thank you for your encouragement');
    }
  }

  Future<void> _loadCharacters() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/Roro_character.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      final allCharacters = jsonData.cast<Map<String, dynamic>>();
      
      // 过滤掉被拉黑和屏蔽的角色
      final filteredCharacters = <Map<String, dynamic>>[];
      for (var i = 0; i < allCharacters.length; i++) {
        final characterId = i.toString();
        if (!_blockedCharacters.contains(characterId) && 
            !_mutedCharacters.contains(characterId)) {
          filteredCharacters.add(allCharacters[i]);
        }
      }
      
      setState(() {
        _characters = filteredCharacters;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshData() async {
    await _loadBlockedAndMutedCharacters();
    await _loadCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;

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
            Positioned(
              left: 20,
              top: topPadding + 24,
              child: Image.asset(
                'assets/two_page_top_title.webp',
                width: 134,
                height: 30,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 134,
                    height: 30,
                    color: Colors.transparent,
                  );
                },
              ),
            ),
            Positioned(
              right: 20,
              top: topPadding + 24,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PostVideoPage(),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/two_page_post.webp',
                  width: 80,
                  height: 32,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 32,
                      color: Colors.transparent,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: topPadding + 24 + 30 + 17,
              bottom: 0,
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: MediaQuery.of(context).padding.bottom + 140,
                      ),
                      itemCount: _characters.length,
                      itemBuilder: (context, index) {
                        return _buildCharacterCell(index);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterCell(int index) {
    final character = _characters[index];
    final isOdd = index % 2 == 0;
    final titleImage = isOdd
        ? 'assets/two_page_left_title.webp'
        : 'assets/two_page_right_title.webp';

    return Container(
      height: 265,
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 41,
            child: Stack(
              children: [
                Image.asset(
                  'assets/two_page_body.webp',
                  width: double.infinity,
                  height: 224,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 224,
                      color: Colors.white.withOpacity(0.3),
                    );
                  },
                ),
                _buildMediaContent(character, index, isOdd),
                _buildActionButtons(character, index, isOdd),
                // _buildCharacterInfo(character, isOdd),
              ],
            ),
          ),
          Positioned(
            left: isOdd ? 0 : null,
            right: isOdd ? null : 0,
            top: 0,
            child: Stack(
              children: [
                Image.asset(
                  titleImage,
                  width: 290,
                  height: 72,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 290,
                      height: 72,
                      color: Colors.transparent,
                    );
                  },
                ),
                Positioned.fill(
                  child: Center(
                    child: Transform.translate(
                      offset: const Offset(0, 4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          character['RoroNickName'] ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaContent(
      Map<String, dynamic> character, int index, bool isOdd) {
    final thumbnailArray =
        (character['RoroShowThumbnailArray'] as List<dynamic>?) ?? [];
    final videoArray =
        (character['RoroShowVideoArray'] as List<dynamic>?) ?? [];

    String? imagePath;
    if (thumbnailArray.isNotEmpty) {
      imagePath = thumbnailArray[0].toString();
    }

    if (imagePath == null) {
      return const SizedBox.shrink();
    }

    final hasVideo = videoArray.isNotEmpty;

    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.only(
          left: isOdd ? 12 : 64,
          right: isOdd ? 64 : 12,
          top: 32,
          bottom: 12,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported),
                    );
                  },
                ),
              ),
            ),
            if (hasVideo)
              Center(
                child: GestureDetector(
                  onTap: () {
                    final videoPath = videoArray[0].toString();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoDetailPage(
                          videoPath: videoPath,
                          characterName: character['RoroNickName'] ?? '',
                          characterId: index.toString(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterInfo(Map<String, dynamic> character, bool isOdd) {
    final userIcon = character['RoroUserIcon']?.toString() ?? '';
    final nickName = character['RoroNickName']?.toString() ?? '';

    return Positioned(
      left: 12,
      bottom: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: userIcon.isNotEmpty
                  ? Image.asset(
                      userIcon,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 24,
                          height: 24,
                          color: Colors.grey[300],
                          child: const Icon(Icons.person, size: 16),
                        );
                      },
                    )
                  : Container(
                      width: 24,
                      height: 24,
                      color: Colors.grey[300],
                      child: const Icon(Icons.person, size: 16),
                    ),
            ),
            const SizedBox(width: 6),
            Text(
              nickName,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(
      Map<String, dynamic> character, int index, bool isOdd) {
    final isLiked = _likedCharacters.contains(index.toString());
    final goodImagePath = isLiked ? 'assets/two_good_s.webp.png' : 'assets/two_good.webp';
    
    return Positioned(
      right: isOdd ? 15 : null,
      left: isOdd ? null : 15,
      bottom: 12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _toggleLike(index);
            },
            child: SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(
                goodImagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    width: 40,
                    height: 40,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              _showCommentBottomSheet(context, character, index);
            },
            child: SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(
                'assets/two_commend.webp',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    width: 40,
                    height: 40,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              _showReportActionSheet(context, character, index);
            },
            child: SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(
                'assets/two_page_report.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    width: 40,
                    height: 40,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showReportActionSheet(
      BuildContext context, Map<String, dynamic> character, int filteredIndex) async {
    // 需要找到原始索引
    final String jsonString = await rootBundle.loadString('assets/Roro_character.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    final allCharacters = jsonData.cast<Map<String, dynamic>>();
    
    // 找到当前角色在原始列表中的索引
    int? originalIndex;
    for (var i = 0; i < allCharacters.length; i++) {
      if (allCharacters[i]['RoroNickName'] == character['RoroNickName']) {
        originalIndex = i;
        break;
      }
    }
    
    if (originalIndex == null) return;
    
    if (!mounted) return;
    
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReportPage(
                    character: character,
                    characterIndex: originalIndex!,
                  ),
                ),
              );
            },
            child: const Text('Report'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(context);
              await _blockCharacter(originalIndex!);
              if (mounted) {
                _navigateToRootAndRefresh(context);
              }
            },
            isDestructiveAction: true,
            child: const Text('Block'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(context);
              await _muteCharacter(originalIndex!);
              if (mounted) {
                _navigateToRootAndRefresh(context);
              }
            },
            isDestructiveAction: true,
            child: const Text('Mute'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          isDefaultAction: true,
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  Future<void> _blockCharacter(int index) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final characterId = index.toString();
      _blockedCharacters.add(characterId);
      await prefs.setStringList('blocked_characters', _blockedCharacters.toList());
    } catch (e) {
      // 如果保存失败，恢复状态
      _blockedCharacters.remove(index.toString());
    }
  }

  Future<void> _muteCharacter(int index) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final characterId = index.toString();
      _mutedCharacters.add(characterId);
      await prefs.setStringList('muted_characters', _mutedCharacters.toList());
    } catch (e) {
      // 如果保存失败，恢复状态
      _mutedCharacters.remove(index.toString());
    }
  }

  void _navigateToRootAndRefresh(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    _refreshData();
  }

  void _showCommentBottomSheet(
      BuildContext context, Map<String, dynamic> character, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CommentBottomSheet(
        characterId: index.toString(),
        characterName: character['RoroNickName'] ?? 'Character',
      ),
    );
  }

  void _showCenterToast(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}

class CommentBottomSheet extends StatefulWidget {
  final String characterId;
  final String characterName;

  const CommentBottomSheet({
    super.key,
    required this.characterId,
    required this.characterName,
  });

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _comments = [];
  bool _isLoading = true;
  String _userName = 'Roro';
  String? _avatarPath;

  @override
  void initState() {
    super.initState();
    _loadComments();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('user_name') ?? 'Roro';
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

  Future<void> _loadComments() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final commentsKey = 'comments_${widget.characterId}';
      final commentsJson = prefs.getString(commentsKey);
      
      setState(() {
        if (commentsJson != null) {
          final List<dynamic> decoded = json.decode(commentsJson);
          _comments = decoded.cast<Map<String, dynamic>>();
        } else {
          _comments = [];
        }
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _comments = [];
        _isLoading = false;
      });
    }
  }

  Future<void> _saveComments() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final commentsKey = 'comments_${widget.characterId}';
      await prefs.setString(commentsKey, json.encode(_comments));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save comment')),
        );
      }
    }
  }

  Future<void> _sendComment() async {
    final commentText = _commentController.text.trim();
    if (commentText.isEmpty) {
      return;
    }

    final newComment = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'userName': _userName,
      'content': commentText,
      'timestamp': DateTime.now().toIso8601String(),
    };

    setState(() {
      _comments.insert(0, newComment);
    });

    _commentController.clear();
    await _saveComments();

    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _comments.isEmpty
                    ? _buildEmptyState()
                    : _buildCommentsList(),
          ),
          _buildInputArea(bottomPadding),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Comments',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.close,
                size: 24,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.comment_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No comments yet',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Be the first to comment!',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: _comments.length,
      itemBuilder: (context, index) {
        return _buildCommentItem(_comments[index]);
      },
    );
  }

  Widget _buildCommentItem(Map<String, dynamic> comment) {
    final timestamp = DateTime.tryParse(comment['timestamp'] ?? '');
    final timeString = timestamp != null
        ? _formatTimestamp(timestamp)
        : 'Just now';
    
    final isCurrentUser = comment['userName'] == _userName;
    final showAvatar = isCurrentUser && _avatarPath != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showAvatar
              ? ClipOval(
                  child: Image.file(
                    File(_avatarPath!),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildDefaultAvatar(comment['userName'] ?? 'U');
                    },
                  ),
                )
              : _buildDefaultAvatar(comment['userName'] ?? 'U'),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment['userName'] ?? 'User',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        comment['content'] ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  timeString,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea(double bottomPadding) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: bottomPadding + 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText: 'Write a comment...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                maxLines: null,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _sendComment(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _sendComment,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFFF69B4),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar(String userName) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFFF69B4).withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF69B4),
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 7) {
      return '${timestamp.month}/${timestamp.day}/${timestamp.year}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
