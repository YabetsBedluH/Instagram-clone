import 'package:flutter/material.dart';
import 'package:instagram/widgets/post_cart.dart';
import 'package:instagram/widgets/story_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLiked = false;
  final List _stories = ['story 1', 'story 2', 'story 3', 'story 4', 'story 5'];

  final List _posts = ['post 1', 'post 2', 'post 3', 'post 4', 'post 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        //*automaticallyImplyLeading* makes the arrow in navigation disappear
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.black,
        title: const SizedBox(
          height: 50,
          width: 120,
          child: Image(image: AssetImage('assets/img/logo.png')),
        ),
        actions: const [
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.favorite_border)),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.send,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 0, 0, 0),
            height: 1,
            // our width will depend on the size of the device that's why we are using mediaquery
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                itemCount: _stories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StoryWidget(
                    username: _stories[index],
                    storyImages: [
                      'https://i.pinimg.com/736x/c9/04/8e/c9048e2112726c1d2a5e3a553a523c5a.jpg',
                      'https://cdn.pixabay.com/photo/2022/04/05/20/21/jack-russell-terrier-7114378_960_720.jpg',
                      'https://cdn.pixabay.com/photo/2017/06/20/22/14/man-2425121_960_720.jpg',
                      'https://cdn.pixabay.com/photo/2017/08/06/15/13/woman-2593366_960_720.jpg',
                    ],
                  );
                }),
          ),
          Container(
            color: const Color.fromARGB(255, 0, 0, 0),
            height: 1,
            width: MediaQuery.of(context).size.width,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _posts.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return const PostCart();
                }),
          ),
        ],
      ),
    );
  }
}
