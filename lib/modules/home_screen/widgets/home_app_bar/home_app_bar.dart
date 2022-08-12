import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/themes/app_text_style.dart';
import '../../../../core/themes/app_colors.dart';
import '../search_input/search_input.dart';

class HomeAppBar extends PreferredSize {
  HomeAppBar({
    Key? key,
    required Size size,
    required String addPlaceRoute,
    required String? text,
  }) : super(
          key: key,
          preferredSize: size,
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            alignment: Alignment.center,
            height: size.height * 0.28,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 40.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Home',
                        style: AppTextStyle.appBarTitle,
                      ),
                      IconButton(
                        onPressed: () => Modular.to.pushNamed(addPlaceRoute),
                        icon: const Icon(
                          Icons.add_location_alt,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.place,
                        color: Colors.white,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        text ?? 'no place found',
                        textAlign: TextAlign.start,
                        style: AppTextStyle.appBarLocation,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SearchInput(
                    controller: TextEditingController(),
                    label: 'Search in yours places',
                    validator: (p0) => null,
                    search: () {},
                  )
                ],
              ),
            ),
          ),
        );
}
