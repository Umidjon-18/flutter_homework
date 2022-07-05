import 'package:flutter/material.dart';

class AnimationFirst extends StatefulWidget {
  const AnimationFirst({Key? key}) : super(key: key);

  @override
  State<AnimationFirst> createState() => _AnimationFirstState();
}

class _AnimationFirstState extends State<AnimationFirst>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  Animation? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _controller,
          child: const SizedBox(
            width: 200,
            height: 200,
            child: Image(
              image: AssetImage('assets/images/ic_image1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
