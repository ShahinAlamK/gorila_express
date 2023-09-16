import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gorila_express/component/Custom_Drawer.dart';
import 'package:gorila_express/component/Exit_Dialog.dart';
import 'package:gorila_express/component/server_card.dart';
import 'package:gorila_express/controller/Theme_controller.dart';
import 'package:gorila_express/screen/Servers.dart';
import 'package:gorila_express/style/size_config.dart';
import 'package:provider/provider.dart';
import '../component/round_icon.dart';
import '../controller/Home_Controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isActive=false;

  Duration _duration = const Duration();
  Timer? _timer;

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      const addSeconds = 1;
      setState(() {
        final seconds = _duration.inSeconds + addSeconds;
        _duration = Duration(seconds: seconds);
      });
    });
  }

  stopTimer() {
    setState(() {
      _timer?.cancel();
      _duration = const Duration();
    });
  }

  connect(){
    if(isActive==false){
      return "Disconnect";
    }else {
      return "Connected";
    }
  }

  @override
  Widget build(BuildContext context) {

    final themeController=Provider.of<ThemeController>(context);
    final homeController=context.watch<HomeController>();
    final theme=Theme.of(context);

    return WillPopScope(
      onWillPop:()=> ExitDialog(context),
      child: Scaffold(
        key: homeController.key,

        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Menu drawer button
              RoundIcon(
                onTap: (){homeController.endDrawerOpen();},
                color: theme.colorScheme.secondary,
                child:const Icon(Icons.menu_rounded,size:25,), ),
              //this title
              Text("Gorilla Express",
                  style:theme.textTheme.bodyLarge!.copyWith(fontSize: AppSize.horizontal!*4.5)),
              //app theme button
              RoundIcon(
                onTap: (){themeController.themeChangeValue();},
                color: theme.colorScheme.secondary,
                child:Icon(themeController.isDark?Icons.light_mode_outlined:Icons.bedtime_outlined,size:25,), ),
            ],
          ),
        ),

        drawer: const CustomDrawer(),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:getW(20)),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height:getH(30)),

                statusWidget(theme),
                SizedBox(height: getH(30)),

                RotatedBox(
                  quarterTurns:1,
                  child: SizedBox(
                    width:getW(250),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                        activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor:Colors.blueGrey.shade500,
                          value: isActive,
                          onChanged: (value){
                        setState(() {
                          isActive=value;
                          isActive?startTimer() : stopTimer();
                        });
                      }),
                    ),
                  ),
                ),

                SizedBox(height: getH(40)),

                uploadDownload(theme),
                SizedBox(height: getH(30)),

                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Select server",style: theme.textTheme.bodyMedium,)),

                SizedBox(height:getH(10)),

                ServerCard(
                  leading: CircleAvatar(
                    radius:getW(30),
                    backgroundImage:const NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/United-states_flag_icon_round.svg/2048px-United-states_flag_icon_round.svg.png"),
                    backgroundColor:Colors.orange,
                  ),

                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("United states",style: theme.textTheme.bodyLarge!.copyWith(fontSize:AppSize.horizontal!*4),),
                      Text("toronto",style: theme.textTheme.bodySmall),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: (){Navigator.push(context,MaterialPageRoute(builder: (_)=>const ServerScreen()));},
                ),

                SizedBox(height: getH(10)),

              ],
            ),
          ),
        ),
      ),
    );
  }

  statusWidget(ThemeData theme) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds=twoDigits(_duration.inSeconds.remainder(60));
    final minutes=twoDigits(_duration.inMinutes.remainder(60));
    final hours=twoDigits(_duration.inHours.remainder(60));

    return Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(connect(),
                  style:theme.textTheme.bodyLarge!.copyWith(fontSize: getW(40),color:Colors.green),),
                SizedBox(height: AppSize.vertical!*1),

                Text( '$hours : $minutes : $seconds',
                  style:theme.textTheme.bodySmall!.copyWith(fontSize: getW(22)),),
              ],
            )
    );
  }

  uploadDownload(ThemeData theme){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color:theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.only(top: 15,bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_circle_down_outlined,color: Colors.green,),
              const SizedBox(height: 10,),
              Text("543 kbs",style: theme.textTheme.bodySmall,),
              const SizedBox(height:5),
              Text("Download",style: theme.textTheme.bodySmall,),
            ],
          )),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/image/signal.png",height: 20,color: Colors.orange,),
              const SizedBox(height: 10,),
              Text("80 ms",style: theme.textTheme.bodySmall,),
              const SizedBox(height:5),
              Text("Pings",style: theme.textTheme.bodySmall,),
            ],
          )),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_circle_up_outlined,color: Colors.redAccent,),
              const SizedBox(height: 10),
              Text("43 kbs",style: theme.textTheme.bodySmall,),
              const SizedBox(height:5),
              Text("Upload",style: theme.textTheme.bodySmall,),
            ],
          )),
        ],
      ),
    );
  }
}




