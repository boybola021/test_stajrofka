import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_stajrofka/bloc/auth/auth_bloc.dart';
import 'package:test_stajrofka/model/user_model.dart';
import 'package:test_stajrofka/screen/intial_page.dart';
import 'package:test_stajrofka/screen/map_page.dart';
import 'package:test_stajrofka/service/message.dart';
import 'package:test_stajrofka/service/string.dart';
import 'package:test_stajrofka/service/utils.dart';
import 'package:test_stajrofka/views/custom_text_fild.dart';
import 'package:test_stajrofka/views/custom_text_widget.dart';
import 'loading_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController ctrFistName = TextEditingController();
  final TextEditingController ctrLastName = TextEditingController();
  final TextEditingController ctrPhone = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();
  final TextEditingController ctrPrePassword = TextEditingController();
  bool check = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).emit(AuthSignUpState());
  }

  void signUp() {
    String firstName = ctrFistName.text.trim();
    String lastName = ctrLastName.text.trim();
    String phone = ctrPhone.text.trim();
    String password = ctrPassword.text.trim();
    String prePassword = ctrPrePassword.text.trim();

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        prePassword != password) {
      KTScaffoldMessage.scaffoldMessage(
        context, KTString.somethingError.tr(),
      );
      return;
    }
    UserModel model = UserModel(
      firstname: firstName,
      lastname: lastName,
      phone: "+998$phone",
      password: password,
    );
    BlocProvider.of<AuthBloc>(context).add(
      AuthSignUpEvent(userModel: model),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessfulState) {
            Navigator.pushAndRemoveUntil(context,
                CupertinoPageRoute(builder: (context) => const MapPage()),(rout) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthSignUpState) {
            return SafeArea(
              child: ListView(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                children: [
                  Image.asset(
                    "assets/image/circle_image.png",
                    height: 300,
                    width: 300,
                  ),
                  KTTextWidget.signUpTextWidget,
                  const SizedBox(
                    height: 10,
                  ),
                  KTTextWidget.lastNameTextWidget,
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: CustomTextField(
                        hintFontSize: 18,
                        controller: ctrFistName,
                        maxLine: 1,
                        hintText: KTString.enterLastName.tr(),
                        onSubmitted: (String text) {
                          if (!Utils.regexName(text)) {
                            KTScaffoldMessage.scaffoldMessage(
                                context, KTString.nameMessage.tr());
                            ctrFistName.text = "";
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  KTTextWidget.firsNameTextWidget,
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: CustomTextField(
                        hintFontSize: 18,
                          controller: ctrLastName,
                          maxLine: 1,
                          hintText: KTString.enterFirstName.tr(),
                          onSubmitted: (String text) {
                            if (!Utils.regexName(text)) {
                              KTScaffoldMessage.scaffoldMessage(
                                  context, KTString.familyMessage.tr());
                              ctrLastName.text = "";
                            }
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  KTTextWidget.phoneNumberTextWidget,
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: CustomTextField(
                        keyboardType: TextInputType.phone,
                        hintFontSize: 18,
                        onSubmitted: (String text) {
                          if (!Utils.regexPhone(text)) {
                            KTScaffoldMessage.scaffoldMessage(
                                context, KTString.phoneMessage.tr());
                            ctrPhone.text = "";
                          }
                        },
                        controller: ctrPhone,
                        maxLine: 1,
                        hintText: "",
                        prefix: const Text(
                          "+998 ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        formatter: [Utils.maskFormatterPhone],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  KTTextWidget.passwordTextWidget,
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: CustomTextField(
                        hintFontSize: 18,
                        controller: ctrPassword,
                        maxLine: 1,
                        hintText: KTString.password.tr(),
                        onSubmitted: (String text) {
                          if (!Utils.regexPassword(text)) {
                            KTScaffoldMessage.scaffoldMessage(
                                context, KTString.passwordMessage.tr());
                            ctrPassword.text = "";
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  KTTextWidget.prePasswordTextWidget,
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: CustomTextField(
                        hintFontSize: 18,
                        controller: ctrPrePassword,
                        maxLine: 1,
                        hintText: KTString.prePassword.tr(),
                        onSubmitted: (String text) {
                          if (ctrPrePassword.text.trim() != ctrPassword.text) {
                            KTScaffoldMessage.scaffoldMessage(
                                context, KTString.prePassword.tr());
                            ctrPrePassword.text = "";
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: signUp,
                    child: Container(
                      height: 50,
                        width: MediaQuery.sizeOf(context).width,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(1, 0, 31, 0.68),
                              Color.fromRGBO(1, 0, 31, 1),
                            ],
                          ),
                        ),
                          child: Text(
                            KTString.save.tr(),style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700,fontFamily: "Mulish"),),
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            );
          }
          if (state is AuthLoadingState || state is AuthInitialState) {
            return const LoadingPage();
          } else {
            return Center(
              child: KTTextWidget.dataTextWidget,
            );
          }
        },
      ),
    );
  }
}
