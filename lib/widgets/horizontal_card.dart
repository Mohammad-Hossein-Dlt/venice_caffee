import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/cafe/cafe_preview_screen.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.score,
  });

  final String image;
  final String title;
  final String description;
  final double score;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
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
            width: 358,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 218,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            PersianNumber(
                              number: score.floor().toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: RatingBarIndicator(
                                rating: score,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: yellow500,
                                ),
                                unratedColor: gray200,
                                itemCount: 5,
                                itemSize: 12,
                                direction: Axis.horizontal,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textDirection: TextDirection.rtl,
                          style:
                              const TextStyle(fontSize: 12, color: lightGray),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      SizedBox(
                        width: 110,
                        height: 104,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset(image),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.heart5,
                            color: red500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
