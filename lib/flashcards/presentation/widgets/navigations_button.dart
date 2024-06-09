import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll<double>(0),
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
      ),
      child: Icon(
        icon,
        size: 32.w,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
    );
  }
}
