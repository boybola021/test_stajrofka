import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_stajrofka/screen/sign_up_page.dart';
import 'package:test_stajrofka/service/colors.dart';
import 'package:test_stajrofka/service/icons.dart';
import 'package:test_stajrofka/service/string.dart';
import '../views/custom_languages.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/location.png",
                height: 80,
                width: 80,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                KTString.findSport.tr(),
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    fontFamily: "K2D"),
              ),
            ],
          ),
          const Spacer(),
          const KTLanguages(),
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context) => const SignUpPage()));
            },
            child: SizedBox(
              height: 70,
              width: 70,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: KTColors.black10311,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(-1, 14),
                        color: Colors.blueGrey.shade300,
                        blurRadius: 20,
                      ),
                    ]
                ),
                child: const Center(
                    child: KTIcons.arrowRight),
              ),
            ),
          ),
          const SizedBox(height: 70,),
        ],
      ),
    );
  }
}
