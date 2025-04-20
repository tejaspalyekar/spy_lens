import 'package:flutter/material.dart';
import 'package:spy_lens/utils/extension/context_extension.dart';
import 'package:spy_lens/utils/widgets/custom_text.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.navigationScreen,
    required this.animationDelay,
  });

  final IconData icon;
  final String title;
  final Widget navigationScreen;
  final int animationDelay;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 300 + animationDelay),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 4,
        shadowColor: Theme.of(context).primaryColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () {
            context.push(navigationScreen);
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1A1A1A),
                  const Color(0xFF1A1A1A).withOpacity(0.9),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: context.screenHeight * 0.08,
                    color: const Color(0xFF1E88E5),
                  ),
                  const SizedBox(height: 12),
                  CustomText(
                    textAlignment: TextAlign.center,
                    text: title,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontColor: Colors.white,
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
