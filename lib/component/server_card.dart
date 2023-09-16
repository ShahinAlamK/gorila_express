import 'package:flutter/material.dart';

class ServerCard extends StatelessWidget {
  const ServerCard({super.key, this.leading, this.title, this.trailing, required this.onTap});

  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color:theme.colorScheme.secondary,
        child: InkWell(
          onTap:onTap,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 12,top: 12,bottom: 12),
                child:Row(
                  children: [
                    leading??SizedBox(),
                    SizedBox(width:10),

                   title??SizedBox(),

                    Spacer(),
                    trailing??SizedBox()
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}