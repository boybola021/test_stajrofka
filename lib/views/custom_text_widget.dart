
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_stajrofka/service/colors.dart';
import 'package:test_stajrofka/service/string.dart';

sealed class KTTextWidget{

  static Text viewLanguages (String text) => Text(
    text.tr(),
    style: const TextStyle(
        fontSize: 21,
        fontFamily: "Mulish",fontWeight: FontWeight.w400
    ),
  );

  static  Text changeTextWidget (String text1)=> Text(
    text1.isNotEmpty
        ? text1.tr()
        : KTString.changeLanguage.tr(),
    style:  TextStyle(fontSize: 20, color: text1.isNotEmpty? Colors.black :Colors.grey, fontFamily: "Mulish",fontWeight: FontWeight.w400),
  );
  static Text lastNameTextWidget = Text(
                     KTString.lastName.tr(),style: const TextStyle(color: KTColors.black35,fontSize: 20,fontWeight: FontWeight.w400,fontFamily: "Mulish"));
  static Text firsNameTextWidget = Text(
                     KTString.firsName.tr(),style: const TextStyle(color: KTColors.black35,fontSize: 20,fontWeight: FontWeight.w400,fontFamily: "Mulish"));
  static Text phoneNumberTextWidget = Text(
                     KTString.phoneNumber.tr(),style: const TextStyle(color: KTColors.black35,fontSize: 20,fontWeight: FontWeight.w400,fontFamily: "Mulish"));
  static Text passwordTextWidget = Text(
                     KTString.password.tr(),style: const TextStyle(color: KTColors.black35,fontSize: 20,fontWeight: FontWeight.w400,fontFamily: "Mulish"));
  static Text prePasswordTextWidget = Text(
                     KTString.prePassword.tr(),style: const TextStyle(color: KTColors.black35,fontSize: 20,fontWeight: FontWeight.w400,fontFamily: "Mulish"));
  static Text signUpTextWidget = Text(
                    KTString.signUp.tr(),textAlign: TextAlign.center,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: "Mulish"),);
  static Text saveTextWidget = Text(
                     KTString.save.tr(),style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700,fontFamily: "Mulish"),);
  static Text dataTextWidget = const Text(
                "Check your data",style: TextStyle(fontSize: 25),);
}