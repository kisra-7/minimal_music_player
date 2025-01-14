import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/theme_controller.dart';

// ignore: must_be_immutable
class ImageBox extends StatelessWidget {
  final Widget? child;
  void Function()? onTap;
  ImageBox({super.key, required this.child, this.onTap});
  final themeCOntroller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(top: 15, bottom: 20, left: 15, right: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
                color: themeCOntroller.isSavedDarkMOde()
                    ? Colors.black
                    : Colors.grey.shade500,
                blurRadius: 15,
                offset: const Offset(4, 5)),
            BoxShadow(
                color: themeCOntroller.isSavedDarkMOde()
                    ? Colors.grey.shade800
                    : Colors.white,
                blurRadius: 15,
                offset: const Offset(-4, -4))
          ],
        ),
        child: child,
      ),
    );
  }
}
