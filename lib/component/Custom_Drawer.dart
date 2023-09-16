import 'package:flutter/material.dart';
import 'package:gorila_express/style/size_config.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Drawer(
      child: Column(
        children: [

          Container(
            height: 200,
            width: AppSize.width,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary
            ),
            child: Center(child: Text("Gorilla Express",style:theme.textTheme.bodyLarge,),),
          ),

          Expanded(child:ListView(
            padding: EdgeInsets.zero,
            children: [

              ListTile(
                leading: const Icon(Icons.star_border_rounded),
                title: const Text("Rate App"),
                onTap: (){},
              ),

              ListTile(
                leading: const Icon(Icons.share_rounded),
                title: const Text("Invite a friend"),
                onTap: (){},
              ),

              ListTile(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: const Text("Privacy Policy"),
                onTap: (){},
              ),
            ],
          )),

        ],
      ),
    );
  }
}
