import 'package:flutter/material.dart';

import '../constants/constants.dart';

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double? margin;
  final double? padding;

  const NeumorphicContainer({
    Key? key,
    required this.child,
    this.margin = 0,
    this.padding = 0,
  }) : super(key: key);

  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 1200),
  )..forward();

  late Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(widget.margin!),
      padding: EdgeInsets.all(widget.padding!),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[700]!.withOpacity(0.1),
            offset: const Offset(-2, -2),
            blurRadius: 2,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            offset: const Offset(2, 2),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: FadeTransition(
        opacity: _animation,
        child: widget.child,
      ),
    );
  }
}
