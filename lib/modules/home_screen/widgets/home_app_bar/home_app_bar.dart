import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
            color: AppColors.primary,
            alignment: Alignment.center,
            height: size.height * 0.3,
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
                      const Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
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
