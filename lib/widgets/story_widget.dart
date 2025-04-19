import 'package:flutter/material.dart';
import 'package:instagram/widgets/circle_story.dart';

class StoryWidget extends StatelessWidget {
  final String username;
  final List<String> storyImages;
  const StoryWidget({
    Key? key,
    required this.username,
    required this.storyImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryViewScreen(
                    username: username,
                    storyImages: storyImages,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.pink, width: 3)),
                ),
                const CircleStory(),
              ],
            ),
          ),
        ),
        Text(
          username,
          style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
        ),
      ],
    );
  }
}

class StoryViewScreen extends StatefulWidget {
  final String username;
  final List<String> storyImages;

  const StoryViewScreen({
    Key? key,
    required this.username,
    required this.storyImages,
  }) : super(key: key);

  @override
  _StoryViewScreenState createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  int currentIndex = 0;

  void nextStory() {
    if (currentIndex < widget.storyImages.length - 1) {
      setState(() => currentIndex++);
    } else {
      Navigator.pop(context);
    }
  }

  void previousStory() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        final width = MediaQuery.of(context).size.width;
        if (details.globalPosition.dx < width / 2) {
          previousStory();
        } else {
          nextStory();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(
              child: Image.network(
                widget.storyImages[currentIndex],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              top: 40,
              left: 16,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.storyImages[0]),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.username,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
