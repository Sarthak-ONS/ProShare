import 'package:flutter/material.dart';

class BuildRotatedWidget extends StatefulWidget {
  const BuildRotatedWidget(
      {Key? key,
      this.top,
      this.left,
      this.tilt,
      this.image,
      this.height = 40,
      this.width = 40})
      : super(key: key);

  final double? top;
  final double? left;
  final double? tilt;
  final String? image;
  final double? height;
  final double? width;

  @override
  _BuildRotatedWidgetState createState() => _BuildRotatedWidgetState();
}

class _BuildRotatedWidgetState extends State<BuildRotatedWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    lowerBound: 0.8,
    upperBound: 1,
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      child: ScaleTransition(
        scale: _animation,
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(widget.tilt! / 360),
          child: Image.asset(
            "Assets/Images/${widget.image}.png",
            height: widget.height,
            width: widget.width,
          ),
        ),
      ),
    );
  }
}
