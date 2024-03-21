import 'package:flutter/material.dart';
import 'package:flutter_jjigmuck/mvvm/view/user_search_page.dart';
import 'package:flutter_jjigmuck/mvvm/view_model/user_search_view_model.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //     create: (_) => CounterBloc(),
    //     child: MaterialApp(title: 'MainApp', home: BlocPage()));

    // return MaterialApp(title: 'MainApp', home: BlocPage());
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => Counter()),
    //     ChangeNotifierProvider(create: (_) => Counter1000())
    //   ],
    //   child: MaterialApp(title: 'Flutter Provider', home: MultiProviderPage())
    // );
    var config = Configuration.local([UserSchema.schema]);
    return ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      child: MaterialApp(
        home: UserSearch(),
      ),
    );
  }
}
