import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonBase extends StatelessWidget {
  final String? copyLink;
  final Icon? iconButton;
  final Widget? child, childBelow;
  final IconData? icon;
  final String? text;
  final String image;
  final bool center;
  final TextStyle? style;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onLongPress;

  final GestureTapCallback? iconButtonOnTap;
  final GestureTapCallback? iconButtonOnLongPress;

  const ButtonBase(
      {this.iconButton,
        this.copyLink,
        this.icon,
        this.style,
        this.text = "",
        this.child,
        this.childBelow,
        this.image = "",
        this.center = false,
        this.onTap,
        this.onLongPress,
        this.iconButtonOnTap,
        this.iconButtonOnLongPress,
        Key? key})
      : super(key: key);

  Widget getStringAsTextWidget(BuildContext context, String text,bool center) {
    if (text.isEmpty) {
      return Container();
    }

    if(center) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.all(8), // space between icon and text
          child: Text(
            text,
            /* textAlign: TextAlign.justify,*/
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: style ??
                const TextStyle(color: Colors.black, fontSize: 24,),
          ),
        ),
      );
    }

    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8), // space between icon and text
        child: Text(
          text,
          /* textAlign: TextAlign.justify,*/
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: style ??
              const TextStyle(color: Colors.black, fontSize: 24,),
        ),
      ),
    );
  }

  Widget getIconAsIconButton(BuildContext context, Icon? icon) {
    if (icon == null) {
      return Container();
    } else if (text != "") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: iconButtonOnTap,
            onLongPress: iconButtonOnLongPress,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: iconButton,
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(top: 6, left: 5, right: 5),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Container(
          decoration:
          BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(children: [
              Expanded(
                child: Container(
                  decoration: (iconButton!=null)
                      ? const BoxDecoration(
                    border: Border(
                      right:
                      BorderSide(width: 0.3, color: Colors.white),
                    ),
                  )
                      : const BoxDecoration(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          if (icon != null)
                            Icon(icon, color: Colors.blue,),
                            getStringAsTextWidget(context, text ?? "", center),
                            if (child != null) child!,
                          ],
                        ),
                      if (childBelow != null) childBelow!
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              getIconAsIconButton(context, iconButton),
            ]),
          ),
        ),
      ),
    );
  }
}
