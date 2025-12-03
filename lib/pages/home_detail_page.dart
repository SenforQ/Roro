import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'guide_voice_page.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({super.key});

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initializeAudio();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
        });
      }
    });
    _audioPlayer.onDurationChanged.listen((duration) {
      if (mounted) {
        setState(() {
          _duration = duration;
        });
      }
    });
    _audioPlayer.onPositionChanged.listen((position) {
      if (mounted) {
        setState(() {
          _position = position;
        });
      }
    });
  }

  Future<void> _initializeAudio() async {
    try {
      await _audioPlayer.setSource(AssetSource('roro_figure_vioce.MP3'));
      final duration = await _audioPlayer.getDuration();
      if (duration != null && mounted) {
        setState(() {
          _duration = duration;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load audio: $e')),
        );
      }
    }
  }

  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
  }

  Future<void> _seekTo(Duration position) async {
    await _audioPlayer.seek(position);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '${duration.inSeconds}s';
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: const Color(0xFFFF69B4),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: const Color(0xFFFF69B4),
              ),
            ),
            Positioned(
              top: topPadding + 20,
              left: 20,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4DD0E1), Color(0xFF26C6DA)],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
            Positioned(
              top: topPadding + 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GuideVoicePage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Guide Voice',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: topPadding + 80,
              left: 20,
              right: 20,
              child: _buildCharacterImage(),
            ),
            Positioned(
              top: topPadding + 80 + 300 + 20,
              left: 20,
              right: 20,
              child: _buildDialogueBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterImage() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/one_page_bg.webp',
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.person, size: 100),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: _buildAudioControlBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioControlBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFF8C00)],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: _togglePlayPause,
            child: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(left: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Slider(
              value: _position.inMilliseconds.toDouble(),
              min: 0,
              max: _duration.inMilliseconds > 0 ? _duration.inMilliseconds.toDouble() : 1,
              onChanged: (value) {
                _seekTo(Duration(milliseconds: value.toInt()));
              },
              activeColor: Colors.white,
              inactiveColor: Colors.white.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              _formatDuration(_position),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogueBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4DD0E1), Color(0xFF26C6DA)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "I...I won't give up! Even if I have one breath left, I'll protect everyone!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '(Voice rising, full of power)',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '"This isn\'t the end-it\'s my true beginning!"(Sound enhancement)',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildControlButton(
          icon: Icons.close,
          onTap: () => Navigator.pop(context),
        ),
        const SizedBox(width: 30),
        _buildControlButton(
          icon: Icons.check,
          onTap: () {
            // Confirm action
          },
          isPrimary: true,
        ),
      ],
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isPrimary ? 80 : 60,
        height: isPrimary ? 80 : 60,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD700),
          shape: BoxShape.circle,
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: const Color(0xFFFF69B4).withOpacity(0.6),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ]
              : null,
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: isPrimary ? 40 : 30,
        ),
      ),
    );
  }
}

