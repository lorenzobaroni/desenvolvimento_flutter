import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final Color color;
  final Widget leading;
  final Widget title;
  final Widget subTitle;
  final Widget trailing;
  final void Function() onTap;
  const CustomTile({
    super.key,
    required this.color,
    required this.leading,
    required this.title,
    required this.subTitle,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: 8, width: 16);
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(2), 
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    leading,
                    gap,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title,
                          gap,
                          subTitle,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              trailing,
            ],
          ),
      ),
    );
  }
}
