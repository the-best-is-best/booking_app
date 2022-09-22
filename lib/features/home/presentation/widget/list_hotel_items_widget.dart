import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/values_manager.dart';

class ListHotelItemsWidget extends StatelessWidget {
  const ListHotelItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(
          right: AppMargin.m20,
          left: AppMargin.m20,
          bottom: AppSize.s20,
        ),
        child: Row(
          children: [
            // image section
            Container(
              width: 150,
              height: AppSize.s150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s20),
                  bottomLeft: Radius.circular(AppSize.s20),
                ),
                color: ColorManager.grey,
                image: DecorationImage(
                    image: AssetImage(ImageAssets.explore_1),
                    fit: BoxFit.cover),
              ),
            ),
            // text Container
            Expanded(
              child: Container(
                height: AppSize.s150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(AppSize.s20),
                    bottomRight: Radius.circular(AppSize.s20),
                  ),
                  color: ColorManager.grey.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppPadding.p16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Queen Hotel',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      Text(
                        'Wembley, London',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                          color: ColorManager.grey,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: ColorManager.primary,
                                    size: AppSize.s16,
                                  ),
                                  Text(
                                    ' 3.0 Km to city ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                      color: ColorManager.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    const Icon(
                                      Icons.star,
                                      color: ColorManager.primary,
                                      size: AppSize.s16,
                                    ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ' \$100',
                                style:
                                Theme.of(context).textTheme.displayMedium,
                              ),
                              Text(
                                '/per night',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                  color: ColorManager.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
