import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning/atomicUI/AppScaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class ApiList extends StatefulWidget {
  const ApiList({super.key});

  @override
  State<ApiList> createState() => _ApiListState();
}

class _ApiListState extends State<ApiList> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold.withTitleBody(
        title: "Users from API", body: const ApiListPage());
  }
}

class ApiListPage extends StatefulWidget {
  const ApiListPage({super.key});

  @override
  State<ApiListPage> createState() => _ApiListPageState();
}

class _ApiListPageState extends State<ApiListPage> {
  List<dynamic> usersResponse = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      color: Color(0xffeeeeee),
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            TextButton(
                onPressed: _getAPIData,
                child: const Text(
                  "Get API data",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                )),
            Expanded(
                child: ListView.builder(
                  itemCount: usersResponse.length,
                  itemBuilder: (context, index) {
                    dynamic user = usersResponse[index];
                    String userName = user["first_name"] + user["last_name"];
                    return GestureDetector(
                      child: ListCard(
                          id: user["id"],
                          imageUrl: user["avatar"],
                          name: userName,
                          email: user["email"]),
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "Item at $index clicked with name $userName");
                      },
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }

  Future<void> _getAPIData() async {
    const baseUrl = "https://reqres.in/";
    const apiEndpoint = "api/users";
    Map<String, int> parameters = {};
    parameters["page"] = 1;
    parameters["per_page"] = 10;
    final dio = Dio();
    final response =
    await dio.get(baseUrl + apiEndpoint, queryParameters: parameters);
    Map<String, dynamic> completeResponse = response.data;
    setState(() {
      usersResponse = completeResponse["data"];
    });
  }

  Widget ListCard(
      {int? id, String? imageUrl, String name = "", String email = ""}) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl!,
              imageBuilder: (context, imageProvider) =>
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ID: $id",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurpleAccent),
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.green),
                ),
                Text(
                  email,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
