import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/cafe/cafe_preview_screen.dart';
import 'package:venice_caffee/widgets/dash_separator.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class VerticalCard extends StatelessWidget {
  const VerticalCard({
    super.key,
    required this.image,
    required this.title,
    required this.score,
    required this.location,
    required this.distance,
    required this.longTime,
  });

  final String image;
  final String title;
  final String score;
  final String location;
  final String distance;
  final String longTime;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CafePreviewScreen(),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        shadowColor: Theme.of(context).colorScheme.shadow,
        child: SizedBox(
          width: 214,
          height: 244,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 191,
                    height: 108,
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: FittedBox(
                            fit: BoxFit.cover, child: Image.asset(image)))),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: yellow500,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: PersianNumber(
                          number: score,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Text(
                  location,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    color: lightGray,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const DashSeparator(
                  color: brown200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          distance,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            color: lightGray,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Iconsax.driving,
                          color: primaryBrown,
                          size: 16,
                        ),
                      ],
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: brown100,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          longTime,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            color: lightGray,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Iconsax.timer_1,
                          color: primaryBrown,
                          size: 16,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
