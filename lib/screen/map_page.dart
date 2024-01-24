import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_stajrofka/bloc/add_data/add_post_bloc.dart';
import 'package:test_stajrofka/service/string.dart';
import '../service/message.dart';
import '../views/custom_text_fild.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  static TextEditingController ctrlTitle = TextEditingController();
  static TextEditingController ctrlDesc = TextEditingController();
  static TextEditingController ctrlMap = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        leading: const Icon(
          CupertinoIcons.clear,
          color: Colors.black,
        ),
        title: Text(
          KTString.newAdd.tr(),
          style: const TextStyle(
              fontSize: 20, color: Colors.black, fontFamily: "Mulish"),
        ),
        actions:  [
          IconButton(
            splashRadius: 26,
            onPressed: (){
              if(ctrlTitle.text.trim().isEmpty ||  ctrlDesc.text.trim().isEmpty ||  ctrlMap.text.trim().isEmpty ){
                KTScaffoldMessage.scaffoldMessage(
                  context, KTString.somethingError.tr(),
                );
                return;
              }
            },
            icon: const Icon(
              Icons.arrow_forward,
              size: 30,
              color: Color.fromRGBO(50, 123, 237, 1),
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: BlocConsumer<AddPostBloc, AddPostState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      KTString.title.tr(),
                      style:
                          const TextStyle(fontFamily: "Mulish", fontSize: 20),
                    ),
                    CustomTextField(
                      hintFontSize: 18,
                      controller: ctrlTitle,
                      maxLine: 1,
                      hintText: KTString.enterProductTitle.tr(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      KTString.description.tr(),
                      style:
                          const TextStyle(fontFamily: "Mulish", fontSize: 20),
                    ),
                    CustomTextField(
                      hintFontSize: 18,
                      controller: ctrlDesc,
                      maxLine: 5,
                      hintText: KTString.enterDescription.tr(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                            height: 1,
                            width: 100,
                            child: ColoredBox(color: Colors.black)),
                        Text(
                          KTString.changeLanguage.tr(),
                          style: const TextStyle(
                              fontFamily: "Mulish", fontSize: 20),
                        ),
                        const SizedBox(
                            height: 1,
                            width: 100,
                            child: ColoredBox(color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      KTString.addressByLocation.tr(),
                      style:
                          const TextStyle(fontFamily: "Mulish", fontSize: 20),
                    ),
                    CustomTextField(
                      hintFontSize: 18,
                      controller: ctrlMap,
                      maxLine: 1,
                      hintText: KTString.addressMapAddress.tr(),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}


class KTYandexMap extends StatefulWidget {
  const KTYandexMap({super.key});

  @override
  State<KTYandexMap> createState() => _KTYandexMapState();
}

class _KTYandexMapState extends State<KTYandexMap> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: YandexMap(
        mapObjects: [],
      ),
    );
  }
}
