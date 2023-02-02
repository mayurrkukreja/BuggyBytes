import 'package:flutter/material.dart';
import 'package:house_rent/model/house.dart';
import 'package:house_rent/widget/circle_icon_button.dart';

class BestOffer extends StatelessWidget {
  final listOfOffer = House.generateBestOffer();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Offer',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {},
                child: const Text('See All'),
              ),
            ],
          ),
          SizedBox(height: 10),
          ...listOfOffer
              .map((el) => Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(el.imageUrl),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            SizedBox(width: 10),
                            Column(
                              children: [
                                Text(
                                  el.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  el.address,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          child: CircleIconButton(
                            iconUrl: 'assets/icons/heart.svg',
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
