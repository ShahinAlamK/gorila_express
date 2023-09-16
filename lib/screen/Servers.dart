import 'package:flutter/material.dart';
import 'package:gorila_express/style/size_config.dart';
import '../component/server_card.dart';


class ServerScreen extends StatefulWidget {
  const ServerScreen({super.key});

  @override
  State<ServerScreen> createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: Text("Servers"),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: AppSize.vertical!*2.5),

            TextField(
              style:theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: "Search location",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent)
                ),
                prefixIcon: Icon(Icons.search,size: 30,color:theme.iconTheme.color,),
                filled: true,
                fillColor: theme.colorScheme.secondary,
              ),
            ),


            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 5),
                itemCount: 10,
                  itemBuilder: (_,index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ServerCard(
                    leading: CircleAvatar(radius: 20,backgroundColor:Colors.orange,),
                    title:  Text("Singapore",style:theme.textTheme.bodyMedium),
                    trailing: Row(
                      children: [
                        Image.asset("assets/image/signal.png",height: 20,color: Colors.green,),
                        SizedBox(width:7),
                        Text("100 ms",style:theme.textTheme.bodySmall),

                      ],
                    ),
                    onTap: () { },),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

