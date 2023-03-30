import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';

class card_swipe extends StatefulWidget {
  final data;
  const card_swipe({Key? key, required this.data}) : super(key: key);

  @override
  State<card_swipe> createState() => _card_swipeState();
}

class _card_swipeState extends State<card_swipe> with SingleTickerProviderStateMixin {
  late AnimationController cardAnimationController;
  double direction = 0;
  Offset dragStartOffset = Offset(0, 0);
  Offset dragUpdateOffset = Offset(0, 0);

  @override
  void initState() {
    super.initState();
    cardAnimationController = AnimationController.unbounded(vsync: this);
  }
  bool _swipeMeetsEscapeVelocity(Offset dragOffset, Velocity velocity){
    return dragOffset.distance + velocity.pixelsPerSecond.distance > 3*MediaQuery.of(context).size.width/4 && velocity.pixelsPerSecond.distance > 400;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: cardAnimationController,
      builder: (context, _){
        return Transform.translate(
          offset: Offset.fromDirection(direction, cardAnimationController.value),
          child: GestureDetector(
            onPanStart: (DragStartDetails details){
              dragStartOffset = details.globalPosition;
            },
            onPanUpdate: (DragUpdateDetails details){
              dragUpdateOffset = details.globalPosition;

              Offset userDragOffset = dragUpdateOffset - dragStartOffset;
              direction = userDragOffset.direction;
              cardAnimationController.value = userDragOffset.distance;
            },
            onPanEnd: (DragEndDetails details){
              Offset userDragOffset = dragUpdateOffset - dragStartOffset;
              if(_swipeMeetsEscapeVelocity(userDragOffset, details.velocity)){
                FrictionSimulation frictionSimulation = FrictionSimulation(1, cardAnimationController.value, 0);
                cardAnimationController.animateWith(frictionSimulation);
              }else{
                SpringDescription springDescription = SpringDescription(mass: 5, stiffness: 5, damping: 5);
                SpringSimulation springSimulation = SpringSimulation(springDescription, cardAnimationController.value, 0, details.velocity.pixelsPerSecond.distance);
                cardAnimationController.animateWith(springSimulation);
              }
              SpringDescription springDescription = SpringDescription(mass: 5, stiffness: 5, damping: 5);
              SpringSimulation springSimulation = SpringSimulation(springDescription, cardAnimationController.value, 0, details.velocity.pixelsPerSecond.distance);
              cardAnimationController.animateWith(springSimulation);
            },
            child: Container(
              //margin: const EdgeInsets.only(top: 20),
              height: screenWidth*1.4,
              width: screenWidth-60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xffc7c7c7)),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 2), // Shadow position
                  ),
                ],
              ),
              child: Center(
                child: Text(widget.data, style: TextStyle(fontSize: 22, fontFamily: "Outfit", color: Colors.black, decoration: TextDecoration.none, fontWeight: FontWeight.w400)),
              ),
            ),
          ),
        );
      },
    );
  }
}
