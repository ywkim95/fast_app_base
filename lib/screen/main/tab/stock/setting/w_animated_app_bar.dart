import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController scrollController;
  final AnimationController animationController;
  const AnimatedAppBar({
    super.key,
    required this.title,
    required this.scrollController,
    required this.animationController,
  });

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  Duration get duration => 10.ms;
  double scrollPosition = 0;

  // Animation<double> 또는 CurvedAnimation
  late CurvedAnimation animation = CurvedAnimation(
      parent: widget.animationController, curve: Curves.bounceInOut);
  @override
  void initState() {
    widget.animationController.addListener(() {
      setState(() {});
    });
    widget.scrollController.addListener(() {
      setState(() {
        scrollPosition = widget.scrollController.position.pixels;
      });
    });
    super.initState();
  }

  bool get isTriggered => scrollPosition > 80.0;
  double getValue(double initial, double target) {
    if (isTriggered) {
      return target;
    }
    double fraction = scrollPosition / 80;
    return initial + (target - initial) * fraction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.only(
                left: getValue(20.0, 50.0),
                top: getValue(50.0, 15.0),
              ),
              child: AnimatedDefaultTextStyle(
                style: TextStyle(
                  fontSize: getValue(30.0, 18.0),
                  fontWeight: FontWeight.bold,
                ),
                duration: duration,
                child: widget.title.text.make(),
              ),
            ),
            Tap(
              onTap: () {
                Nav.pop(context);
              },
              child: const Arrow(
                direction: AxisDirection.left,
              ),
            ).p20(),
            Positioned(
              // animation.value는 0~1사이만 움직임
              left: animation.value * 200,
              child: TweenAnimationBuilder<Color?>(
                tween: ColorTween(
                  begin: Colors.green,
                  end: isTriggered ? Colors.blue : Colors.green,
                ),
                duration: 1000.ms,
                builder: (context, value, child) => ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    value ?? Colors.green,
                    BlendMode.modulate,
                  ),
                  child: child,
                ),
                child: Image.asset(
                  '$basePath/icon/map_point.png',
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
