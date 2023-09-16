import 'package:flutter/material.dart';
import 'package:gorila_express/style/size_config.dart';

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
      borderRadius: BorderRadius.circular(getW(10)),
      child: Material(
        color:theme.colorScheme.secondary,
        child: InkWell(
          onTap:onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getW(15),vertical: getH(10)),
              child:Row(
                children: [
                  leading??const SizedBox(),
                  SizedBox(width:getW(15)),

                 title??const SizedBox(),

                  const Spacer(),
                  trailing??const SizedBox()
                ],
              ),
          ),
        ),
      ),
    );
  }
}