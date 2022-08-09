import 'package:flutter/material.dart';
import 'package:greate_places/core/widgets/special_app_bar/special_app_bar.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SpecialAppBar(
        size: size,
        child: const Text(
          'PlaceDetail',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
