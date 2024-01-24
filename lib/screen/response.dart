

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_stajrofka/screen/map_page.dart';

class ResponseData extends StatelessWidget {
  const ResponseData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const MapPage()), (route) => false);
          },
          child: const Text("Back button",style: TextStyle(fontFamily: "Mulish",fontSize: 20),),
        ),
      ),
    );
  }
}
