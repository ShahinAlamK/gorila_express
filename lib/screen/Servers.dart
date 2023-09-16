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
        title: const Text("Servers"),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height:getH(10)),

            TextField(
              style:theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: "Search location",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: getW(15),vertical: getH(16)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.transparent)
                ),
                prefixIcon: Icon(Icons.search,size: getW(45),color:theme.iconTheme.color,),
                filled: true,
                fillColor: theme.colorScheme.secondary,
              ),
            ),


            SizedBox(height: getH(20)),

            Expanded(
              child: ListView.builder(
                itemCount: 10,
                  itemBuilder: (_,index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ServerCard(
                    leading: const CircleAvatar(radius: 20,backgroundColor:Colors.orange,),
                    title:  Text("Singapore",style:theme.textTheme.bodyMedium),
                    trailing: Row(
                      children: [
                        Image.asset("assets/image/signal.png",height: 20,color: Colors.green,),
                        SizedBox(width:getW(15)),
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

