import 'dart:async';

import 'package:flutter/material.dart';

class SlideContainer3 extends StatefulWidget {
  final Widget child;
  const SlideContainer3({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<SlideContainer3> createState() => _SlideContainer3State();
}

class _SlideContainer3State extends State<SlideContainer3>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(5, -0.5),
      end: const Offset(1.5, -0.5),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticInOut,
    ));

    Timer(const Duration(milliseconds: 1000), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }
}

class SlideContainer2 extends StatefulWidget {
  final Widget child;
  const SlideContainer2({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<SlideContainer2> createState() => _SlideContainer2State();
}

class _SlideContainer2State extends State<SlideContainer2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-5, -0.7),
      end: const Offset(-1.5, -0.7),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticInOut,
    ));

    Timer(const Duration(milliseconds: 2000), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }
}

class SlideContainer1 extends StatefulWidget {
  final Widget child;
  const SlideContainer1({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<SlideContainer1> createState() => _SlideContainer1State();
}

class _SlideContainer1State extends State<SlideContainer1>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -5),
      end: const Offset(0, -1.15),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticInOut,
    ));

    Timer(const Duration(milliseconds: 2700), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }
}
