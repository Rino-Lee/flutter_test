import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jjigmuck/mvvm/model/local/user_schema.dart';
import 'package:flutter_jjigmuck/mvvm/view/user_search_result_page.dart';
import 'package:flutter_jjigmuck/mvvm/view_model/user_search_view_model.dart';
import 'package:provider/provider.dart';

class UserSearch extends HookWidget {
  const UserSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();

    _redirect() async {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserSearchResultPage()));
      });
    }

    useEffect(
        () => () {
              _redirect();
            },
        [context.watch<UserViewModel>().user]);
    return Scaffold(
        appBar: AppBar(
          title: Text("get user information at github"),
        ),
        body: Consumer(builder: (context, provider, child) {
          return Padding(
            padding: EdgeInsets.only(
                left: 100.0, top: 0.0, right: 100.0, bottom: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Github 이름 검색"),
                Padding(
                    padding: EdgeInsets.only(bottom: 100.0),
                    child: TextField(
                      controller: userNameController,
                    )),
                Expanded(
                    child: FutureBuilder(
                        future: context
                            .read<UserViewModel>()
                            .getFrequencySearchUserList(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          } else if (snapshot.hasData) {
                            final List<UserModel> frequencySearchedUser =
                                snapshot.data;

                            return ListView.builder(
                              itemCount: frequencySearchedUser.length,
                              itemBuilder: (BuildContext context, int index) {
                                InkWell(
                                    onTap: () {
                                      context
                                          .read<UserViewModel>()
                                          .deleteUser(frequencySearchedUser[index]);
                                    },
                                    child: Text(
                                        '${frequencySearchedUser[index].login}', style: TextStyle(backgroundColor: Colors.black),));
                                return null;
                              },
                            );
                          } else
                            return Placeholder();
                        })),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () async {
                        final viewModel = context.read<UserViewModel>();
                        if (userNameController.text == viewModel.user.login) {
                          _redirect();
                        } else {
                          viewModel.getUser(userNameController.text);
                        }
                      },
                      child: Text("검색")),
                ),
                ElevatedButton(
                    onPressed: () async {
                      context
                          .read<UserViewModel>()
                          .getFrequencySearchUserList();
                    },
                    child: Text("최근 검색")),
                ElevatedButton(
                    onPressed: () async {
                      context.read<UserViewModel>().deleteAll();
                    },
                    child: Text("모두 제거"))
              ],
            ),
          );
        }));
  }
}
