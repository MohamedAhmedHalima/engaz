import 'package:flutter/material.dart';

class LinearProgressBar extends StatefulWidget {
  final double initialProgress;
  final Color color;
  final Color backgroundColor;
  final double width;
  final double height;
  final BoxDecoration decoration;
  final String? endImagePath;
  final double? endImageScale; // Optional property for scaling the image

  const LinearProgressBar({
    Key? key,
    this.initialProgress = 0.0,
    this.color = Colors.blue,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.width = double.infinity,
    this.height = 10.0,
    this.decoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 2,
          offset: Offset(0, 2),
        ),
      ],
    ),
    this.endImagePath,
    this.endImageScale = 2.0, // Default scaling for the image
  }) : super(key: key);

  @override
  LinearProgressBarState createState() => LinearProgressBarState();
}

class LinearProgressBarState extends State<LinearProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: widget.initialProgress,
      end: widget.initialProgress,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void updateProgress(double progress) {
    setState(() {
      _animation = Tween<double>(
        begin: _animation.value,
        end: progress.clamp(0.0, 1.0),
      ).animate(_animationController);
      _animationController.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final barWidth = widget.width.isFinite
        ? widget.width
        : MediaQuery.of(context).size.width;
    final imageSize = widget.height * (widget.endImageScale ?? 2);

    return Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          decoration: widget.decoration,
          child: ClipRRect(
            borderRadius: widget.decoration.borderRadius ?? BorderRadius.zero,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return LinearProgressIndicator(
                  value: _animation.value,
                  backgroundColor: widget.backgroundColor,
                  color: widget.color,
                );
              },
            ),
          ),
        ),
        if (widget.endImagePath != null)
          Positioned(
            left: 0, // Ensures the image is fixed at the end of the bar
            top: (widget.height - imageSize) / 2,
            child: Image.asset(
              widget.endImagePath!,
              height: imageSize,
              width: imageSize,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }
}
