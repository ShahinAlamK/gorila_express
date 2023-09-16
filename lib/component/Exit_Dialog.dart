import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool>ExitDialog(BuildContext context)async{
  final theme=Theme.of(context);
  return await showCupertinoDialog(context: context, builder: (_){
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
      title: Icon(Icons.info_outline_rounded),
      content: Text("Are you sure you want to exit",
        style:theme.textTheme.bodyMedium),
      actions: [
        Container(
          height: 45,
          width:double.infinity,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.redAccent),
                  child: Text('No',style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.green),
                  child: Text('Yes',style:theme.textTheme.bodyLarge!.copyWith(color: Colors.white),),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  });
}
