
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_stajrofka/bloc/add_data/add_post_bloc.dart';
import 'package:test_stajrofka/bloc/auth/auth_bloc.dart';
import 'package:test_stajrofka/screen/intial_page.dart';
import 'package:test_stajrofka/screen/map_page.dart';
import 'package:test_stajrofka/screen/sign_up_page.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc()),
          BlocProvider(create: (context) => AddPostBloc()),
        ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          home: const MapPage(),
        ),
    );
  }
}

