import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb/core/constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) => const LinearGradient(
          stops: [0, .56, 1],
          colors: [
            Color(0xff90cea1),
            Color(0xff3cbec9),
            Color(0xff00b3e5),
          ],
        ).createShader(bounds),
        child: SvgPicture.asset(
          Constants.logo,
          height: 55,
          width: 39.65,
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(100);
}
