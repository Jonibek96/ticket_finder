import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SwitchButton extends StatefulWidget {
  bool switchValue = false;
   SwitchButton({super.key, required this.switchValue});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.switchValue = !widget.switchValue;
        });
      },
      child: Stack(
        alignment: widget.switchValue ? Alignment.centerLeft : Alignment.centerRight,
        children: [
          Container(
            height: 14,
            width: 34,
            decoration: BoxDecoration(
              color: widget.switchValue ? const Color(0xFF5E5F61): AppColors.blueDark,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration:  BoxDecoration(
                color: widget.switchValue ? Colors.white : AppColors.blueSpecial,
                shape: BoxShape.circle
            ),
          )
        ],
      ),
    );
  }
}
