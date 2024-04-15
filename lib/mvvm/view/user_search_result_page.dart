import 'package:flutter/material.dart';
import 'package:flutter_jjigmuck/mvvm/view_model/user_search_view_model.dart';
import 'package:provider/provider.dart';

class UserSearchResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
          builder: (context, provider, child) => Center(
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20.0, top: 0.0, right: 20.0, bottom: 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${context.watch<UserViewModel>().retrofitUser?.login}"),
                        Text("${context.watch<UserViewModel>().retrofitUser?.name}"),
                        ClipOval(
                          child: SizedBox.fromSize(
                            child: Image.network(
                                "${context.watch<UserViewModel>().retrofitUser?.avatar_url}",
                                fit: BoxFit.cover),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("이전으로"))
                      ],
                    )),
              )),
    );
  }
}
