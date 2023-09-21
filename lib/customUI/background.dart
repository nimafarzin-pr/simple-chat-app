import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background(
      {super.key, required this.child, this.image, this.blurNumber});
  final Widget child;
  final String? image;
  final double? blurNumber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 100 * 100,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff243949),
                Color(0xff517fa4),
              ],
            ),
          ),
          child: child),
    );
  }
}
