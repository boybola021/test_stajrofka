import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_stajrofka/service/icons.dart';
import 'package:test_stajrofka/service/string.dart';
import '../service/image.dart';
import 'custom_text_widget.dart';

class KTLanguages extends StatefulWidget {
  const KTLanguages({super.key});

  @override
  State<KTLanguages> createState() => _KTLanguagesState();
}

class _KTLanguagesState extends State<KTLanguages> {
  String categoryText = "";
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Text(KTString.languages.tr(),style: const TextStyle(fontSize: 23,fontFamily: "Mulish",fontWeight: FontWeight.w400),),
        ),
        PopupMenuButton<Widget>(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          itemBuilder: (context) {
            return [
              for (int i = 0; i < CategoryEnum.values.length; i++)
                PopupMenuItem(
                  child: KTTextWidget.viewLanguages(CategoryEnum.values[i].text),
                  onTap: () {
                    categoryText = CategoryEnum.values[i].text;
                    index = i;
                    if (index == 0) {
                      context.setLocale(const Locale("uz", "UZ"));
                    } else if (index == 1) {
                      debugPrint("Krill");
                      context.setLocale(const Locale("uz", "UZKrill"));
                    }else if (index == 2) {
                      context.setLocale(const Locale("ru", "RU"));
                    }
                    setState(() {});
                  },
                ),
            ];
          },
          child: Container(
            height: 56,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.only(right: 10,left: 10),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300,width: 2),
              color: Colors.white10,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                Image.asset(
                  index == 2 ? KTImages.rusFlag : KTImages.uzbFlag,
                  height: 35,
                  width: 35,
                ),
                const SizedBox(width: 10),
                KTTextWidget.changeTextWidget(categoryText),
                const Spacer(),
                KTIcons.arrowDropDown,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
