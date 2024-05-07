import 'package:flutter/material.dart';


class AppButton extends StatefulWidget {
  final String name;
  Color? bgColor = const Color(0xFF2F3035);
  Color? textColor = Colors.white;
  final Function() onTap;
   AppButton({super.key, required this.name, required this.onTap, required this.bgColor, required this.textColor});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
                color: widget.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}
