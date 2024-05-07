import 'package:flutter/material.dart';
import 'package:ticket_finder/utils/app_colors.dart';

import '../screens/search/search_screen.dart';

class PopularDestinationCard extends StatefulWidget {
  final PopularDestination popularDestination;
  final ValueChanged<String> onChanged;
  const PopularDestinationCard({super.key, required this.popularDestination, required this.onChanged});

  @override
  State<PopularDestinationCard> createState() => _PopularDestinationCardState();
}

class _PopularDestinationCardState extends State<PopularDestinationCard> {

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        setState(() {
          widget.onChanged(widget.popularDestination.city);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.grey3))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Image.asset(widget.popularDestination.image, fit: BoxFit.cover),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.popularDestination.city,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const Text(
                      "Популярное направление",
                      style: TextStyle(
                        color: AppColors.grey3,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

